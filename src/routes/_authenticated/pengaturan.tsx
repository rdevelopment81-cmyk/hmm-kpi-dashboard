import { createFileRoute } from "@tanstack/react-router";
import { useEffect, useState } from "react";
import { useMutation, useQuery, useQueryClient } from "@tanstack/react-query";
import { supabase } from "@/integrations/supabase/client";
import { useCurrentUser } from "@/hooks/use-current-user";
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Slider } from "@/components/ui/slider";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import { Badge } from "@/components/ui/badge";
import { Avatar, AvatarFallback, AvatarImage } from "@/components/ui/avatar";
import { toast } from "sonner";
import { KeyRound, User, Sliders, ShieldCheck, CheckCircle2, Loader2 } from "lucide-react";

export const Route = createFileRoute("/_authenticated/pengaturan")({
  component: SettingsPage,
  head: () => ({ meta: [{ title: "Pengaturan Akun & KPI — HMM FEB UNPAK" }] }),
});

function SettingsPage() {
  const { data: user, refetch: refetchUser } = useCurrentUser();
  const qc = useQueryClient();
  const isHR = user?.roles.includes("hr_admin");

  // Profile Edit State
  const [fullName, setFullName] = useState("");
  const [isUpdatingProfile, setIsUpdatingProfile] = useState(false);

  // Password Change State
  const [newPassword, setNewPassword] = useState("");
  const [confirmPassword, setConfirmPassword] = useState("");
  const [isChangingPassword, setIsChangingPassword] = useState(false);

  // KPI Settings State
  const [attendance, setAttendance] = useState(50);

  const { data: settings } = useQuery({
    queryKey: ["kpi_settings"],
    enabled: !!isHR,
    queryFn: async () =>
      (await supabase.from("kpi_settings").select("*").eq("id", 1).maybeSingle()).data,
  });

  useEffect(() => {
    if (user?.profile?.full_name) {
      setFullName(user.profile.full_name);
    }
  }, [user]);

  useEffect(() => {
    if (settings) setAttendance(Math.round(Number(settings.attendance_weight) * 100));
  }, [settings]);

  const saveSettings = useMutation({
    mutationFn: async () => {
      const att = attendance / 100;
      const job = 1 - att;
      const { error } = await supabase
        .from("kpi_settings")
        .update({
          attendance_weight: att,
          jobdesk_weight: job,
          updated_by: user!.userId,
          updated_at: new Date().toISOString(),
        })
        .eq("id", 1);
      if (error) throw error;
    },
    onSuccess: () => {
      toast.success("Bobot penilaian berhasil disimpan");
      qc.invalidateQueries({ queryKey: ["kpi_settings"] });
    },
    onError: (e: Error) => toast.error(e.message),
  });

  async function handleUpdateProfile(e: React.FormEvent) {
    e.preventDefault();
    if (!fullName.trim()) {
      toast.error("Nama lengkap tidak boleh kosong");
      return;
    }
    setIsUpdatingProfile(true);
    const { error } = await supabase
      .from("profiles")
      .update({ full_name: fullName.trim() })
      .eq("id", user!.userId);
    setIsUpdatingProfile(false);

    if (error) {
      toast.error(error.message);
      return;
    }
    toast.success("Profil berhasil diperbarui");
    refetchUser();
  }

  async function handleChangePassword(e: React.FormEvent) {
    e.preventDefault();
    if (newPassword.length < 6) {
      toast.error("Kata sandi baru minimal 6 karakter");
      return;
    }
    if (newPassword !== confirmPassword) {
      toast.error("Konfirmasi kata sandi tidak cocok");
      return;
    }

    setIsChangingPassword(true);
    const { error } = await supabase.auth.updateUser({
      password: newPassword,
    });
    setIsChangingPassword(false);

    if (error) {
      toast.error(error.message);
      return;
    }

    toast.success("Kata sandi Anda berhasil diperbarui!");
    setNewPassword("");
    setConfirmPassword("");
  }

  if (!user) return null;

  return (
    <div className="mx-auto max-w-3xl space-y-6">
      <div>
        <h1 className="text-2xl font-bold">Pengaturan & Profil</h1>
        <p className="text-sm text-muted-foreground">
          Kelola informasi akun Anda, keamanan kata sandi, dan preferensi sistem.
        </p>
      </div>

      <Tabs defaultValue="profil" className="w-full">
        <TabsList className={`grid w-full ${isHR ? "grid-cols-2" : "grid-cols-1"}`}>
          <TabsTrigger value="profil" className="flex items-center gap-2">
            <User className="h-4 w-4" /> Profil & Keamanan
          </TabsTrigger>
          {isHR && (
            <TabsTrigger value="kpi" className="flex items-center gap-2">
              <Sliders className="h-4 w-4" /> Bobot Penilaian KPI
            </TabsTrigger>
          )}
        </TabsList>

        <TabsContent value="profil" className="mt-4 space-y-6">
          {/* Card Info Akun & Edit Nama */}
          <Card>
            <CardHeader>
              <CardTitle className="text-lg flex items-center gap-2">
                <ShieldCheck className="h-5 w-5 text-primary" />
                Informasi Akun
              </CardTitle>
              <CardDescription>
                Detail akun dan keanggotaan Anda di HMM FEB UNPAK.
              </CardDescription>
            </CardHeader>
            <CardContent>
              <form onSubmit={handleUpdateProfile} className="space-y-4">
                <div className="flex items-center gap-4 rounded-lg bg-muted/40 p-4">
                  <Avatar className="h-16 w-16 border-2 border-primary/20">
                    <AvatarImage src={user.profile?.avatar_url ?? undefined} />
                    <AvatarFallback className="bg-primary text-primary-foreground text-lg">
                      {(user.profile?.full_name ?? "?").slice(0, 2).toUpperCase()}
                    </AvatarFallback>
                  </Avatar>
                  <div className="space-y-1">
                    <p className="font-semibold text-base leading-tight">
                      {user.profile?.full_name || user.email}
                    </p>
                    <p className="text-xs text-muted-foreground">{user.email}</p>
                    <div className="flex flex-wrap gap-1.5 pt-1">
                      <Badge variant="secondary">
                        {user.division?.name || "BPH / Tanpa Divisi"}
                      </Badge>
                      <Badge variant="outline">{user.profile?.jabatan || "Pengurus"}</Badge>
                      <Badge className="bg-emerald-600 hover:bg-emerald-700 text-white">
                        <CheckCircle2 className="mr-1 h-3 w-3" /> Aktif
                      </Badge>
                    </div>
                  </div>
                </div>

                <div className="grid gap-4 sm:grid-cols-2">
                  <div className="space-y-2">
                    <Label htmlFor="fullname">Nama Lengkap</Label>
                    <Input
                      id="fullname"
                      value={fullName}
                      onChange={(e) => setFullName(e.target.value)}
                      placeholder="Nama lengkap Anda"
                    />
                  </div>
                  <div className="space-y-2">
                    <Label htmlFor="nim">NPM / NIM</Label>
                    <Input
                      id="nim"
                      value={user.profile?.nim || "—"}
                      disabled
                      className="bg-muted cursor-not-allowed"
                    />
                  </div>
                  <div className="space-y-2">
                    <Label htmlFor="email">Alamat Email</Label>
                    <Input
                      id="email"
                      value={user.email || "—"}
                      disabled
                      className="bg-muted cursor-not-allowed"
                    />
                  </div>
                  <div className="space-y-2">
                    <Label htmlFor="divisi">Divisi</Label>
                    <Input
                      id="divisi"
                      value={user.division?.name || "Badan Pengurus Harian (BPH)"}
                      disabled
                      className="bg-muted cursor-not-allowed"
                    />
                  </div>
                </div>

                <div className="flex justify-end pt-2">
                  <Button type="submit" disabled={isUpdatingProfile}>
                    {isUpdatingProfile && <Loader2 className="mr-2 h-4 w-4 animate-spin" />}
                    Simpan Perubahan Nama
                  </Button>
                </div>
              </form>
            </CardContent>
          </Card>

          {/* Card Ganti Kata Sandi */}
          <Card>
            <CardHeader>
              <CardTitle className="text-lg flex items-center gap-2">
                <KeyRound className="h-5 w-5 text-primary" />
                Ganti Kata Sandi
              </CardTitle>
              <CardDescription>
                Perbarui kata sandi akun Anda secara langsung tanpa harus keluar.
              </CardDescription>
            </CardHeader>
            <CardContent>
              <form onSubmit={handleChangePassword} className="space-y-4">
                <div className="grid gap-4 sm:grid-cols-2">
                  <div className="space-y-2">
                    <Label htmlFor="new-password">Kata Sandi Baru</Label>
                    <Input
                      id="new-password"
                      type="password"
                      placeholder="Minimal 6 karakter"
                      value={newPassword}
                      onChange={(e) => setNewPassword(e.target.value)}
                    />
                  </div>
                  <div className="space-y-2">
                    <Label htmlFor="confirm-password">Konfirmasi Kata Sandi Baru</Label>
                    <Input
                      id="confirm-password"
                      type="password"
                      placeholder="Ketik ulang kata sandi baru"
                      value={confirmPassword}
                      onChange={(e) => setConfirmPassword(e.target.value)}
                    />
                  </div>
                </div>

                <div className="flex justify-end pt-2">
                  <Button
                    type="submit"
                    disabled={isChangingPassword || !newPassword || !confirmPassword}
                  >
                    {isChangingPassword && <Loader2 className="mr-2 h-4 w-4 animate-spin" />}
                    Perbarui Kata Sandi
                  </Button>
                </div>
              </form>
            </CardContent>
          </Card>
        </TabsContent>

        {isHR && (
          <TabsContent value="kpi" className="mt-4">
            <Card>
              <CardHeader>
                <CardTitle className="text-lg">Bobot Perhitungan KPI Organisasi</CardTitle>
                <CardDescription>
                  Atur perbandingan persentase antara kehadiran rapat dan penyelesaian jobdesk.
                </CardDescription>
              </CardHeader>
              <CardContent className="space-y-6">
                <div>
                  <div className="mb-2 flex items-center justify-between">
                    <Label>Bobot Kehadiran</Label>
                    <span className="font-mono text-sm font-semibold text-primary">
                      {attendance}%
                    </span>
                  </div>
                  <Slider
                    value={[attendance]}
                    min={0}
                    max={100}
                    step={5}
                    onValueChange={(v) => setAttendance(v[0])}
                  />
                </div>

                <div>
                  <div className="mb-2 flex items-center justify-between">
                    <Label>Bobot Jobdesk</Label>
                    <span className="font-mono text-sm font-semibold text-secondary-foreground">
                      {100 - attendance}%
                    </span>
                  </div>
                  <div className="h-2 w-full rounded-full bg-muted">
                    <div
                      className="h-full rounded-full bg-primary"
                      style={{ width: `${100 - attendance}%` }}
                    />
                  </div>
                </div>

                <div className="rounded-md bg-muted p-4 text-sm">
                  <p className="font-medium mb-1">Formula Perhitungan:</p>
                  <code className="text-xs text-muted-foreground block font-mono">
                    Skor Akhir KPI = (Kehadiran% × {(attendance / 100).toFixed(2)}) + (Jobdesk% ×{" "}
                    {((100 - attendance) / 100).toFixed(2)})
                  </code>
                </div>

                <Button onClick={() => saveSettings.mutate()} disabled={saveSettings.isPending}>
                  {saveSettings.isPending && <Loader2 className="mr-2 h-4 w-4 animate-spin" />}
                  {saveSettings.isPending ? "Menyimpan..." : "Simpan Bobot"}
                </Button>
              </CardContent>
            </Card>
          </TabsContent>
        )}
      </Tabs>
    </div>
  );
}
