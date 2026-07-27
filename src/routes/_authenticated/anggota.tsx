import { createFileRoute } from "@tanstack/react-router";
import { useEffect, useRef, useState } from "react";
import { useMutation, useQuery, useQueryClient } from "@tanstack/react-query";
import { supabase } from "@/integrations/supabase/client";
import { useCurrentUser } from "@/hooks/use-current-user";
import { Card, CardContent } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Badge } from "@/components/ui/badge";
import { Dialog, DialogContent, DialogHeader, DialogTitle, DialogTrigger, DialogFooter } from "@/components/ui/dialog";
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select";
import { Avatar, AvatarFallback, AvatarImage } from "@/components/ui/avatar";
import { toast } from "sonner";
import { CreditCard, ScanLine, Search, CheckCircle2 } from "lucide-react";

export const Route = createFileRoute("/_authenticated/anggota")({
  component: AnggotaPage,
  head: () => ({ meta: [{ title: "Manajemen Anggota — HMM FEB UNPAK" }] }),
});

const ROLES = [
  { v: "anggota", l: "Anggota" },
  { v: "kadiv", l: "Kepala Divisi" },
  { v: "bph", l: "BPH" },
  { v: "hr_admin", l: "HR Admin" },
];

function AnggotaPage() {
  const { data: user } = useCurrentUser();
  const qc = useQueryClient();
  const [search, setSearch] = useState("");
  const [regTarget, setRegTarget] = useState<{ id: string; name: string } | null>(null);
  const isHR = user?.roles.includes("hr_admin");

  const { data: divisions } = useQuery({
    queryKey: ["divisions"],
    queryFn: async () => (await supabase.from("divisions").select("*").order("name")).data ?? [],
  });

  const { data: profiles } = useQuery({
    queryKey: ["profiles-list"],
    queryFn: async () => (await supabase.from("profiles").select("*, divisions(name,code), user_roles(role)").order("full_name")).data ?? [],
  });

  const updateProfile = useMutation({
    mutationFn: async ({ id, patch }: { id: string; patch: any }) => {
      const { error } = await supabase.from("profiles").update(patch).eq("id", id);
      if (error) throw error;
    },
    onSuccess: () => { toast.success("Data diperbarui"); qc.invalidateQueries({ queryKey: ["profiles-list"] }); },
    onError: (e: any) => toast.error(e.message),
  });

  const setRole = useMutation({
    mutationFn: async ({ userId, role, divisionId }: { userId: string; role: string; divisionId: string | null }) => {
      const { error: delErr } = await supabase.from("user_roles").delete().eq("user_id", userId);
      if (delErr) throw delErr;
      const { error } = await supabase.from("user_roles").insert({ user_id: userId, role: role as any, division_id: divisionId });
      if (error) throw error;
    },
    onSuccess: () => { toast.success("Role diperbarui"); qc.invalidateQueries({ queryKey: ["profiles-list"] }); },
    onError: (e: any) => toast.error(e.message),
  });

  const filtered = (profiles ?? [])
    .filter((p: any) => !search || p.full_name?.toLowerCase().includes(search.toLowerCase()) || p.nim?.includes(search))
    .sort((a: any, b: any) => (a.status === "pending" ? -1 : 1) - (b.status === "pending" ? -1 : 1));

  const pendingCount = (profiles ?? []).filter((p: any) => p.status === "pending").length;

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between gap-3">
        <div>
          <h1 className="text-2xl font-bold">Manajemen Anggota</h1>
          <p className="text-sm text-muted-foreground">Verifikasi pendaftar baru, kelola profil, role, divisi, dan kartu RFID.</p>
        </div>
        {isHR && pendingCount > 0 && (
          <Badge variant="destructive" className="gap-1">{pendingCount} menunggu verifikasi</Badge>
        )}
      </div>

      <div className="relative">
        <Search className="absolute left-3 top-2.5 h-4 w-4 text-muted-foreground" />
        <Input className="pl-9" placeholder="Cari nama atau NIM..." value={search} onChange={(e) => setSearch(e.target.value)} />
      </div>

      <div className="grid gap-3">
        {filtered.map((p: any) => {
          const currentRole = p.user_roles?.[0]?.role ?? "anggota";
          return (
            <Card key={p.id}>
              <CardContent className="flex flex-col gap-4 p-4 md:flex-row md:items-center">
                <div className="flex flex-1 items-center gap-3">
                  <Avatar>
                    <AvatarImage src={p.avatar_url ?? undefined} />
                    <AvatarFallback>{(p.full_name ?? "?").slice(0, 2).toUpperCase()}</AvatarFallback>
                  </Avatar>
                  <div>
                    <p className="font-semibold">{p.full_name || "(tanpa nama)"}</p>
                    <p className="text-xs text-muted-foreground">{p.email} · {p.nim || "—"}</p>
                    <div className="mt-1 flex flex-wrap gap-1">
                      <Badge variant="outline">{p.divisions?.code ?? "Belum ada divisi"}</Badge>
                      <Badge>{currentRole}</Badge>
                      {p.id_kartu && <Badge variant="secondary" className="gap-1"><CreditCard className="h-3 w-3" /> {p.id_kartu}</Badge>}
                    </div>
                  </div>
                </div>
                {isHR && (
                  <div className="grid grid-cols-2 gap-2 md:flex md:flex-nowrap">
                    <Input placeholder="NIM" defaultValue={p.nim ?? ""} onBlur={(e) => e.target.value !== (p.nim ?? "") && updateProfile.mutate({ id: p.id, patch: { nim: e.target.value } })} className="w-full md:w-32" />
                    <Input placeholder="Jabatan" defaultValue={p.jabatan ?? ""} onBlur={(e) => e.target.value !== (p.jabatan ?? "") && updateProfile.mutate({ id: p.id, patch: { jabatan: e.target.value } })} className="w-full md:w-36" />
                    <Select value={p.division_id ?? ""} onValueChange={(v) => updateProfile.mutate({ id: p.id, patch: { division_id: v } })}>
                      <SelectTrigger className="w-full md:w-40"><SelectValue placeholder="Divisi" /></SelectTrigger>
                      <SelectContent>{(divisions ?? []).map((d: any) => <SelectItem key={d.id} value={d.id}>{d.name}</SelectItem>)}</SelectContent>
                    </Select>
                    <Select value={currentRole} onValueChange={(v) => setRole.mutate({ userId: p.id, role: v, divisionId: v === "kadiv" ? p.division_id : null })}>
                      <SelectTrigger className="w-full md:w-36"><SelectValue /></SelectTrigger>
                      <SelectContent>{ROLES.map((r) => <SelectItem key={r.v} value={r.v}>{r.l}</SelectItem>)}</SelectContent>
                    </Select>
                    <Button variant="outline" size="sm" onClick={() => setRegTarget({ id: p.id, name: p.full_name })}>
                      <ScanLine className="mr-1 h-4 w-4" /> Kartu
                    </Button>
                  </div>
                )}
              </CardContent>
            </Card>
          );
        })}
        {filtered.length === 0 && (
          <Card><CardContent className="p-8 text-center text-sm text-muted-foreground">Belum ada anggota.</CardContent></Card>
        )}
      </div>

      {regTarget && (
        <RegisterCardDialog target={regTarget} onClose={() => { setRegTarget(null); qc.invalidateQueries({ queryKey: ["profiles-list"] }); }} />
      )}
    </div>
  );
}

function RegisterCardDialog({ target, onClose }: { target: { id: string; name: string }; onClose: () => void }) {
  const [value, setValue] = useState("");
  const [manual, setManual] = useState("");
  const ref = useRef<HTMLInputElement>(null);
  useEffect(() => { ref.current?.focus(); }, []);

  async function save(kartu: string) {
    const { data, error } = await supabase.rpc("register_card", { _profile_id: target.id, _id_kartu: kartu });
    if (error) { toast.error(error.message); return; }
    const r = data as any;
    if (!r.ok) { toast.error(r.error); return; }
    toast.success(`Kartu ${kartu} terdaftar untuk ${target.name}`);
    onClose();
  }

  return (
    <Dialog open onOpenChange={(o) => !o && onClose()}>
      <DialogContent>
        <DialogHeader><DialogTitle>Daftarkan Kartu RFID — {target.name}</DialogTitle></DialogHeader>
        <div className="space-y-4">
          <div>
            <Label>Tap kartu di reader</Label>
            <input
              ref={ref}
              autoFocus
              value={value}
              onChange={(e) => setValue(e.target.value)}
              onKeyDown={(e) => { if (e.key === "Enter") { e.preventDefault(); save(value.trim()); } }}
              placeholder="Menunggu tap kartu..."
              className="mt-2 w-full rounded-xl border-2 border-dashed border-primary/40 bg-background px-6 py-6 text-center text-2xl font-mono tracking-widest focus:border-primary focus:outline-none"
            />
          </div>
          <div className="text-center text-xs text-muted-foreground">atau input manual</div>
          <div className="flex gap-2">
            <Input placeholder="Nomor kartu" value={manual} onChange={(e) => setManual(e.target.value)} />
            <Button onClick={() => save(manual.trim())} disabled={!manual}>Simpan</Button>
          </div>
        </div>
        <DialogFooter><Button variant="ghost" onClick={onClose}>Tutup</Button></DialogFooter>
      </DialogContent>
    </Dialog>
  );
}
