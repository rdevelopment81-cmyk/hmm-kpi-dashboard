import { createFileRoute, Link } from "@tanstack/react-router";
import { useState } from "react";
import { useMutation, useQuery, useQueryClient } from "@tanstack/react-query";
import { supabase } from "@/integrations/supabase/client";
import { useCurrentUser } from "@/hooks/use-current-user";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Textarea } from "@/components/ui/textarea";
import { Dialog, DialogContent, DialogHeader, DialogTitle, DialogTrigger, DialogFooter } from "@/components/ui/dialog";
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select";
import { Badge } from "@/components/ui/badge";
import { toast } from "sonner";
import { Plus, Trash2, FolderKanban, Users, CalendarDays, ArrowRight } from "lucide-react";

export const Route = createFileRoute("/_authenticated/prokers")({
  component: ProkersPage,
  head: () => ({ meta: [{ title: "Program Kerja — HMM FEB UNPAK" }] }),
});

export const STATUS_MAP: Record<string, { label: string; className: string }> = {
  perencanaan: { label: "Perencanaan", className: "bg-slate-100 text-slate-800 dark:bg-slate-800 dark:text-slate-200" },
  rapat_1: { label: "Rapat 1", className: "bg-blue-100 text-blue-800 dark:bg-blue-900/60 dark:text-blue-200" },
  rapat_2: { label: "Rapat 2", className: "bg-indigo-100 text-indigo-800 dark:bg-indigo-900/60 dark:text-indigo-200" },
  rapat_3: { label: "Rapat 3", className: "bg-purple-100 text-purple-800 dark:bg-purple-900/60 dark:text-purple-200" },
  pelaksanaan: { label: "Pelaksanaan", className: "bg-amber-100 text-amber-800 dark:bg-amber-900/60 dark:text-amber-200" },
  selesai: { label: "Selesai", className: "bg-emerald-100 text-emerald-800 dark:bg-emerald-900/60 dark:text-emerald-200" },
};

function ProkersPage() {
  const { data: user } = useCurrentUser();
  const qc = useQueryClient();

  const { data: prokers, isLoading } = useQuery({
    queryKey: ["prokers"],
    queryFn: async () => {
      const { data, error } = await supabase
        .from("prokers")
        .select("*, divisions(id, code, name), proker_assignments(count)")
        .order("created_at", { ascending: false });
      if (error) throw error;
      return data ?? [];
    },
  });

  const del = useMutation({
    mutationFn: async (id: string) => {
      const { error } = await supabase.from("prokers").delete().eq("id", id);
      if (error) throw error;
    },
    onSuccess: () => {
      toast.success("Program kerja dihapus");
      qc.invalidateQueries({ queryKey: ["prokers"] });
    },
    onError: (e: any) => toast.error(e.message),
  });

  if (!user) return null;

  const isHr = user.roles.includes("hr_admin");
  const isKadiv = user.roles.includes("kadiv");
  const canCreate = isHr || isKadiv;

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-2xl font-bold">Program Kerja (Proker)</h1>
          <p className="text-sm text-muted-foreground">Kelola seluruh program kerja, kepanitiaan, dan rapat persiapan.</p>
        </div>
        {canCreate && (
          <CreateProkerDialog
            userId={user.userId}
            userRoles={user.roles}
            defaultDivisionId={isKadiv ? user.profile?.division_id ?? null : null}
          />
        )}
      </div>

      {isLoading ? (
        <p className="text-sm text-muted-foreground">Memuat daftar program kerja...</p>
      ) : (prokers ?? []).length === 0 ? (
        <Card>
          <CardContent className="p-12 text-center text-muted-foreground">
            <FolderKanban className="mx-auto mb-3 h-10 w-10 text-muted-foreground/50" />
            <p className="font-medium">Belum ada Program Kerja</p>
            <p className="text-xs text-muted-foreground mt-1">Buat program kerja baru untuk mulai mengelola kepanitiaan.</p>
          </CardContent>
        </Card>
      ) : (
        <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
          {(prokers ?? []).map((p: any) => {
            const statusConfig = STATUS_MAP[p.status] ?? { label: p.status, className: "" };
            const countPanitia = p.proker_assignments?.[0]?.count ?? 0;
            const canManageThis = isHr || (isKadiv && p.division_id === user.profile?.division_id);

            return (
              <Card key={p.id} className="flex flex-col transition-all hover:shadow-md border-border/80">
                <CardHeader className="pb-3">
                  <div className="flex items-start justify-between gap-2">
                    <Badge variant="outline" className="font-semibold shrink-0">
                      {p.divisions?.code ?? "Semua Divisi"}
                    </Badge>
                    <span className={`inline-flex items-center rounded-full px-2.5 py-0.5 text-xs font-semibold ${statusConfig.className}`}>
                      {statusConfig.label}
                    </span>
                  </div>
                  <CardTitle className="line-clamp-2 text-lg mt-2 font-bold">{p.name}</CardTitle>
                </CardHeader>
                <CardContent className="flex-1 space-y-4 pb-4">
                  <p className="text-xs text-muted-foreground line-clamp-2">
                    {p.description || "Tidak ada deskripsi"}
                  </p>

                  <div className="flex items-center gap-4 text-xs text-muted-foreground pt-2 border-t">
                    <div className="flex items-center gap-1.5">
                      <Users className="h-3.5 w-3.5" />
                      <span>{countPanitia} Panitia</span>
                    </div>
                  </div>
                </CardContent>
                <div className="flex items-center justify-between border-t bg-muted/20 px-6 py-3">
                  <Link
                    to="/prokers/$prokerId"
                    params={{ prokerId: p.id }}
                    className="inline-flex items-center gap-1 text-xs font-semibold text-primary hover:underline"
                  >
                    Detail Proker <ArrowRight className="h-3.5 w-3.5" />
                  </Link>

                  {canManageThis && (
                    <Button
                      variant="ghost"
                      size="sm"
                      className="h-8 w-8 p-0 text-muted-foreground hover:text-destructive"
                      onClick={(e) => {
                        e.preventDefault();
                        if (confirm(`Hapus proker "${p.name}"?`)) del.mutate(p.id);
                      }}
                    >
                      <Trash2 className="h-4 w-4" />
                    </Button>
                  )}
                </div>
              </Card>
            );
          })}
        </div>
      )}
    </div>
  );
}

function CreateProkerDialog({
  userId,
  userRoles,
  defaultDivisionId,
}: {
  userId: string;
  userRoles: string[];
  defaultDivisionId: string | null;
}) {
  const [open, setOpen] = useState(false);
  const [name, setName] = useState("");
  const [description, setDescription] = useState("");
  const [divisionId, setDivisionId] = useState<string>(defaultDivisionId ?? "");
  const qc = useQueryClient();

  const isHr = userRoles.includes("hr_admin");

  const { data: divisions } = useQuery({
    queryKey: ["divisions"],
    queryFn: async () => (await supabase.from("divisions").select("*").order("name")).data ?? [],
  });

  const createMut = useMutation({
    mutationFn: async () => {
      if (!name.trim()) throw new Error("Nama proker wajib diisi");
      const { error } = await supabase.from("prokers").insert({
        name: name.trim(),
        description: description.trim() || null,
        division_id: divisionId || null,
        created_by: userId,
        status: "perencanaan",
      });
      if (error) throw error;
    },
    onSuccess: () => {
      toast.success("Program kerja berhasil dibuat");
      setOpen(false);
      setName("");
      setDescription("");
      qc.invalidateQueries({ queryKey: ["prokers"] });
    },
    onError: (e: any) => toast.error(e.message),
  });

  return (
    <Dialog open={open} onOpenChange={setOpen}>
      <DialogTrigger asChild>
        <Button className="gap-2">
          <Plus className="h-4 w-4" />
          Proker Baru
        </Button>
      </DialogTrigger>
      <DialogContent className="max-w-md">
        <DialogHeader>
          <DialogTitle>Tambah Program Kerja (Proker)</DialogTitle>
        </DialogHeader>
        <form
          onSubmit={(e) => {
            e.preventDefault();
            createMut.mutate();
          }}
          className="space-y-4 pt-2"
        >
          <div className="space-y-1.5">
            <Label htmlFor="proker-name">Nama Program Kerja *</Label>
            <Input
              id="proker-name"
              placeholder="Contoh: Webinar Nasional / Company Visit"
              value={name}
              onChange={(e) => setName(e.target.value)}
              required
            />
          </div>

          <div className="space-y-1.5">
            <Label htmlFor="proker-div">Divisi Penyelenggara</Label>
            {isHr ? (
              <Select value={divisionId} onValueChange={setDivisionId}>
                <SelectTrigger id="proker-div">
                  <SelectValue placeholder="Pilih Divisi" />
                </SelectTrigger>
                <SelectContent>
                  {(divisions ?? []).map((d: any) => (
                    <SelectItem key={d.id} value={d.id}>
                      {d.name} ({d.code})
                    </SelectItem>
                  ))}
                </SelectContent>
              </Select>
            ) : (
              <Input
                value={(divisions ?? []).find((d: any) => d.id === defaultDivisionId)?.name ?? "Divisi Anda"}
                disabled
              />
            )}
          </div>

          <div className="space-y-1.5">
            <Label htmlFor="proker-desc">Deskripsi</Label>
            <Textarea
              id="proker-desc"
              placeholder="Penjelasan singkat mengenai proker ini..."
              rows={3}
              value={description}
              onChange={(e) => setDescription(e.target.value)}
            />
          </div>

          <DialogFooter className="pt-2">
            <Button type="button" variant="outline" onClick={() => setOpen(false)}>
              Batal
            </Button>
            <Button type="submit" disabled={createMut.isPending}>
              {createMut.isPending ? "Menyimpan..." : "Simpan Proker"}
            </Button>
          </DialogFooter>
        </form>
      </DialogContent>
    </Dialog>
  );
}
