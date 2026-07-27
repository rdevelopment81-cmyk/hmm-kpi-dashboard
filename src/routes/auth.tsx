import { createFileRoute, useNavigate } from "@tanstack/react-router";
import { useEffect, useState } from "react";
import { useQuery } from "@tanstack/react-query";
import { supabase } from "@/integrations/supabase/client";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select";
import { toast } from "sonner";

export const Route = createFileRoute("/auth")({
  component: AuthPage,
  head: () => ({
    meta: [
      { title: "Masuk — KPI HMM FEB UNPAK" },
      { name: "description", content: "Masuk ke sistem KPI Himpunan Mahasiswa Manajemen FEB UNPAK." },
    ],
  }),
});

function AuthPage() {
  const navigate = useNavigate();
  const [loading, setLoading] = useState(false);
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [fullName, setFullName] = useState("");
  const [nim, setNim] = useState("");
  const [divisionId, setDivisionId] = useState<string>("");

  const { data: divisions } = useQuery({
    queryKey: ["divisions-public"],
    queryFn: async () => (await supabase.from("divisions").select("id,name,code").order("name")).data ?? [],
  });

  useEffect(() => {
    supabase.auth.getUser().then(({ data }) => {
      if (data.user) navigate({ to: "/dashboard", replace: true });
    });
  }, [navigate]);

  async function signIn(e: React.FormEvent) {
    e.preventDefault();
    setLoading(true);
    const { error } = await supabase.auth.signInWithPassword({ email, password });
    setLoading(false);
    if (error) { toast.error(error.message); return; }
    toast.success("Berhasil masuk");
    navigate({ to: "/dashboard", replace: true });
  }

  async function signUp(e: React.FormEvent) {
    e.preventDefault();
    if (!divisionId) { toast.error("Pilih divisi terlebih dahulu"); return; }
    setLoading(true);
    const { error } = await supabase.auth.signUp({
      email,
      password,
      options: {
        emailRedirectTo: `${window.location.origin}/dashboard`,
        data: { full_name: fullName, nim, division_id: divisionId },
      },
    });
    setLoading(false);
    if (error) { toast.error(error.message); return; }
    toast.success("Akun dibuat. Menunggu verifikasi HR Admin.");
  }

  return (
    <div className="grid min-h-screen md:grid-cols-2">
      <div className="hidden bg-gradient-to-br from-primary to-primary/70 p-12 text-primary-foreground md:flex md:flex-col md:justify-between">
        <div className="flex items-center gap-3">
          <div className="grid h-11 w-11 place-items-center rounded-lg bg-primary-foreground/15 font-bold">H</div>
          <div>
            <p className="font-semibold">HMM FEB UNPAK</p>
            <p className="text-xs opacity-80">Sistem KPI</p>
          </div>
        </div>
        <div>
          <h2 className="text-3xl font-bold">Selamat datang kembali.</h2>
          <p className="mt-3 max-w-sm text-primary-foreground/80">
            Pantau kinerja, kelola absensi rapat via RFID, dan verifikasi jobdesk dari satu dashboard.
          </p>
        </div>
        <p className="text-xs opacity-70">Himpunan Mahasiswa Manajemen • Fakultas Ekonomi & Bisnis</p>
      </div>

      <div className="flex items-center justify-center p-6">
        <Card className="w-full max-w-md">
          <CardHeader>
            <CardTitle>Akun HMM</CardTitle>
            <CardDescription>Masuk atau daftar dengan email kampus.</CardDescription>
          </CardHeader>
          <CardContent>
            <Tabs defaultValue="signin">
              <TabsList className="grid w-full grid-cols-2">
                <TabsTrigger value="signin">Masuk</TabsTrigger>
                <TabsTrigger value="signup">Daftar</TabsTrigger>
              </TabsList>
              <TabsContent value="signin">
                <form onSubmit={signIn} className="space-y-3 pt-4">
                  <div><Label>Email</Label><Input type="email" required value={email} onChange={(e) => setEmail(e.target.value)} /></div>
                  <div><Label>Password</Label><Input type="password" required value={password} onChange={(e) => setPassword(e.target.value)} /></div>
                  <Button type="submit" className="w-full" disabled={loading}>{loading ? "Memproses..." : "Masuk"}</Button>
                </form>
              </TabsContent>
              <TabsContent value="signup">
                <form onSubmit={signUp} className="space-y-3 pt-4">
                  <div><Label>Nama lengkap</Label><Input required value={fullName} onChange={(e) => setFullName(e.target.value)} /></div>
                  <div className="grid grid-cols-2 gap-2">
                    <div><Label>NIM</Label><Input value={nim} onChange={(e) => setNim(e.target.value)} /></div>
                    <div>
                      <Label>Divisi</Label>
                      <Select value={divisionId} onValueChange={setDivisionId}>
                        <SelectTrigger><SelectValue placeholder="Pilih divisi" /></SelectTrigger>
                        <SelectContent>
                          {(divisions ?? []).map((d: any) => (
                            <SelectItem key={d.id} value={d.id}>{d.name}</SelectItem>
                          ))}
                        </SelectContent>
                      </Select>
                    </div>
                  </div>
                  <div><Label>Email</Label><Input type="email" required value={email} onChange={(e) => setEmail(e.target.value)} /></div>
                  <div><Label>Password</Label><Input type="password" required minLength={6} value={password} onChange={(e) => setPassword(e.target.value)} /></div>
                  <Button type="submit" className="w-full" disabled={loading}>{loading ? "Memproses..." : "Daftar"}</Button>
                  <p className="text-xs text-muted-foreground">Akun baru berstatus <b>Pending</b> sampai diverifikasi HR Admin. User pertama otomatis menjadi HR Admin.</p>
                </form>
              </TabsContent>
            </Tabs>
          </CardContent>
        </Card>
      </div>
    </div>
  );
}
