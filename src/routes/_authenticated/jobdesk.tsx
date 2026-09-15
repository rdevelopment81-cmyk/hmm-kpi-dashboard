import { createFileRoute } from "@tanstack/react-router";
import { useState } from "react";
import { useMutation, useQuery, useQueryClient } from "@tanstack/react-query";
import { supabase } from "@/integrations/supabase/client";
import { useCurrentUser } from "@/hooks/use-current-user";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Textarea } from "@/components/ui/textarea";
import { Badge } from "@/components/ui/badge";
import {
  Dialog,
  DialogContent,
  DialogHeader,
  DialogTitle,
  DialogTrigger,
  DialogFooter,
} from "@/components/ui/dialog";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";
import { toast } from "sonner";
import { Plus, FileText, CheckCircle2, XCircle, Download, Upload, Trash2 } from "lucide-react";

export const Route = createFileRoute("/_authenticated/jobdesk")({
  component: JobdeskPage,
  head: () => ({ meta: [{ title: "Jobdesk — HMM FEB UNPAK" }] }),
});

const STATUS_COLOR: Record<string, string> = {
  ditugaskan: "bg-secondary text-secondary-foreground",
  diajukan: "bg-success text-success-foreground",
  disetujui: "bg-success text-success-foreground",
  ditolak: "bg-destructive text-destructive-foreground",
};

const STATUS_LABEL: Record<string, string> = {
  ditugaskan: "Belum Selesai",
  diajukan: "Selesai",
  disetujui: "Selesai",
  ditolak: "Belum Selesai",
};

function JobdeskPage() {
  const { data: user } = useCurrentUser();
  const qc = useQueryClient();
  const isHrOrBph = user?.roles.some((r) => r === "hr_admin" || r === "bph");
  const isKadiv = user?.roles.includes("kadiv");
  const canReview = isHrOrBph || isKadiv;

  const { data: jobs } = useQuery({
    queryKey: ["jobdesks"],
    queryFn: async () => {
      const { data } = await supabase
        .from("jobdesks")
        .select("*, profiles(full_name, avatar_url, phone_number), divisions(code,name), prokers(name)")
        .order("created_at", { ascending: false });
      return data ?? [];
    },
  });

  const review = useMutation({
    mutationFn: async ({
      id,
      status,
      note,
    }: {
      id: string;
      status: "disetujui" | "ditolak";
      note?: string;
    }) => {
      const { error } = await supabase
        .from("jobdesks")
        .update({
          status,
          review_note: note ?? null,
          reviewed_at: new Date().toISOString(),
          reviewed_by: user!.userId,
        })
        .eq("id", id);
      if (error) throw error;
    },
    onSuccess: () => {
      toast.success("Status diperbarui");
      qc.invalidateQueries({ queryKey: ["jobdesks"] });
    },
    onError: (e: Error) => toast.error(e.message),
  });

  const deleteJobdeskMut = useMutation({
    mutationFn: async (id: string) => {
      const { error } = await supabase.from("jobdesks").delete().eq("id", id);
      if (error) throw error;
    },
    onSuccess: () => {
      toast.success("Jobdesk berhasil dihapus");
      qc.invalidateQueries({ queryKey: ["jobdesks"] });
    },
    onError: (e: Error) => toast.error(e.message),
  });

  async function download(url: string, name: string) {
    const { data, error } = await supabase.storage.from("jobdesk-files").createSignedUrl(url, 60);
    if (error) {
      toast.error(error.message);
      return;
    }
    const a = document.createElement("a");
    a.href = data.signedUrl;
    a.download = name;
    a.target = "_blank";
    a.click();
  }

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-2xl font-bold">Jobdesk</h1>
          <p className="text-sm text-muted-foreground">
            Unggah bukti pengerjaan dan pantau statusnya.
          </p>
        </div>
        {user && (
          <UploadDialog userId={user.userId} divisionId={user.profile?.division_id ?? null} />
        )}
      </div>

      <div className="grid gap-3">
        {(jobs ?? []).map((j: any) => {
          const canReviewThis = canReview && j.status === "diajukan" && j.profile_id !== user?.userId && 
            (isHrOrBph || j.division_id === user?.profile?.division_id);
          const canManageThis = canReview && (isHrOrBph || j.division_id === user?.profile?.division_id);

          return (
          <Card key={j.id}>
            <CardContent className="flex flex-col gap-3 p-5 md:flex-row md:items-center md:justify-between">
              <div className="flex-1">
                <div className="flex items-center gap-2">
                  <FileText className="h-4 w-4 text-primary" />
                  <p className="font-semibold">{j.title}</p>
                  <Badge className={STATUS_COLOR[j.status]}>{STATUS_LABEL[j.status] || j.status}</Badge>
                  {j.timing && <Badge variant="outline">{j.timing}</Badge>}
                  {j.divisions && !j.prokers && <Badge variant="outline">{j.divisions.code}</Badge>}
                  {j.seksi_name && <Badge variant="outline">{j.seksi_name}</Badge>}
                  {j.prokers && <Badge variant="secondary">{j.prokers.name}</Badge>}
                  
                  {canManageThis && (
                    <Button
                      variant="outline"
                      size="sm"
                      disabled={!j.profiles?.phone_number}
                      title={!j.profiles?.phone_number ? "Anggota ini belum mengisi nomor WA" : ""}
                      className="h-6 text-[10px] px-2 ml-1 bg-green-500/10 text-green-700 hover:bg-green-500/20 hover:text-green-800 border-green-500/20 disabled:opacity-50"
                      onClick={() => {
                        const msg = `Halo ${j.profiles?.full_name}, kamu mendapat tugas baru:\n\n*${j.title}*\nWaktu: ${j.timing || '-'}\nTenggat Waktu: ${j.deadline || '-'}\n\nSilakan cek website untuk detailnya ya!`;
                        let phone = j.profiles?.phone_number;
                        if (phone) {
                          if (phone.startsWith("0")) phone = "62" + phone.slice(1);
                          window.open(`https://wa.me/${phone}?text=${encodeURIComponent(msg)}`, "_blank");
                        }
                      }}
                    >
                      Beri Tahu via WA
                    </Button>
                  )}
                  {canManageThis && (
                    <Button
                      variant="ghost"
                      size="sm"
                      className="h-6 w-6 p-0 ml-1 text-muted-foreground hover:text-destructive"
                      onClick={() => {
                        if (confirm("Hapus jobdesk ini?")) {
                          deleteJobdeskMut.mutate(j.id);
                        }
                      }}
                    >
                      <Trash2 className="h-4 w-4" />
                    </Button>
                  )}
                </div>
                {j.description && (
                  <p className="mt-1 text-sm text-muted-foreground">{j.description}</p>
                )}
                <p className="mt-1 text-xs text-muted-foreground">
                  {j.profiles?.full_name} · Deadline {j.deadline ?? "—"}
                </p>
                {j.review_note && (
                  <p className="mt-1 text-xs italic text-muted-foreground">
                    Catatan: {j.review_note}
                  </p>
                )}
              </div>
              <div className="flex flex-wrap items-center gap-2">
                {j.profile_id === user?.userId && (
                  <UploadProofDialog userId={user.userId} jobdeskId={j.id} hasFile={!!j.file_url} />
                )}
                {j.file_url && (
                  <Button
                    size="sm"
                    variant="outline"
                    onClick={() => download(j.file_url, j.file_name || "file")}
                  >
                    <Download className="mr-1 h-4 w-4" /> File
                  </Button>
                )}
              </div>
            </CardContent>
          </Card>
          );
        })}
        {(jobs ?? []).length === 0 && (
          <Card>
            <CardContent className="p-8 text-center text-sm text-muted-foreground">
              Belum ada jobdesk.
            </CardContent>
          </Card>
        )}
      </div>
    </div>
  );
}

function UploadDialog({ userId, divisionId }: { userId: string; divisionId: string | null }) {
  const qc = useQueryClient();
  const [open, setOpen] = useState(false);
  const [title, setTitle] = useState("");
  const [desc, setDesc] = useState("");
  const [timing, setTiming] = useState("Sebelum Acara");
  const [deadline, setDeadline] = useState("");
  const [prokerId, setProkerId] = useState("");
  const [file, setFile] = useState<File | null>(null);
  const [loading, setLoading] = useState(false);

  const { data: prokers } = useQuery({
    queryKey: ["prokers-list"],
    queryFn: async () => {
      const { data } = await supabase.from("prokers").select("id, name").order("name");
      return data ?? [];
    },
  });

  async function submit() {
    if (!title) {
      toast.error("Judul wajib diisi");
      return;
    }
    setLoading(true);
    let fileUrl: string | null = null;
    let fileName: string | null = null;
    if (file) {
      const path = `${userId}/${Date.now()}_${file.name}`;
      const { error: upErr } = await supabase.storage.from("jobdesk-files").upload(path, file);
      if (upErr) {
        toast.error(upErr.message);
        setLoading(false);
        return;
      }
      fileUrl = path;
      fileName = file.name;
    }
    const { error } = await supabase.from("jobdesks").insert({
      profile_id: userId,
      division_id: divisionId,
      proker_id: prokerId || null,
      title,
      description: desc,
      timing: timing || null,
      deadline: deadline || null,
      file_url: fileUrl,
      file_name: fileName,
    });
    setLoading(false);
    if (error) {
      toast.error(error.message);
      return;
    }
    toast.success("Jobdesk diunggah");
    setOpen(false);
    setTitle("");
    setDesc("");
    setTiming("Sebelum Acara");
    setDeadline("");
    setProkerId("");
    setFile(null);
    qc.invalidateQueries({ queryKey: ["jobdesks"] });
  }

  return (
    <Dialog open={open} onOpenChange={setOpen}>
      <DialogTrigger asChild>
        <Button>
          <Plus className="mr-1 h-4 w-4" /> Unggah Jobdesk
        </Button>
      </DialogTrigger>
      <DialogContent>
        <DialogHeader>
          <DialogTitle>Unggah Jobdesk</DialogTitle>
        </DialogHeader>
        <div className="space-y-3">
          <div>
            <Label>Judul</Label>
            <Input value={title} onChange={(e) => setTitle(e.target.value)} />
          </div>
          <div>
            <Label>Deskripsi</Label>
            <Textarea value={desc} onChange={(e) => setDesc(e.target.value)} />
          </div>
          <div>
            <Label>Waktu Pelaksanaan</Label>
            <Select value={timing} onValueChange={setTiming}>
              <SelectTrigger>
                <SelectValue placeholder="Pilih waktu pelaksanaan..." />
              </SelectTrigger>
              <SelectContent>
                <SelectItem value="Sebelum Acara">Sebelum Acara</SelectItem>
                <SelectItem value="Saat Acara">Saat Acara</SelectItem>
              </SelectContent>
            </Select>
          </div>
          <div>
            <Label>Deadline</Label>
            <Input type="date" value={deadline} onChange={(e) => setDeadline(e.target.value)} />
          </div>
          <div>
            <Label>Program Kerja (Opsional)</Label>
            <Select value={prokerId || "none"} onValueChange={(val) => setProkerId(val === "none" ? "" : val)}>
              <SelectTrigger>
                <SelectValue placeholder="Pilih program kerja..." />
              </SelectTrigger>
              <SelectContent>
                <SelectItem value="none" className="text-muted-foreground">Tidak terkait proker</SelectItem>
                {(prokers ?? []).map((p) => (
                  <SelectItem key={p.id} value={p.id}>
                    {p.name}
                  </SelectItem>
                ))}
              </SelectContent>
            </Select>
          </div>
          <div>
            <Label>File (PDF/gambar/dokumen)</Label>
            <Input
              type="file"
              accept=".pdf,image/*,.doc,.docx,.xls,.xlsx"
              onChange={(e) => setFile(e.target.files?.[0] ?? null)}
            />
          </div>
        </div>
        <DialogFooter>
          <Button onClick={submit} disabled={loading}>
            {loading ? "Mengunggah..." : "Kirim"}
          </Button>
        </DialogFooter>
      </DialogContent>
    </Dialog>
  );
}


function UploadProofDialog({ userId, jobdeskId, hasFile }: { userId: string; jobdeskId: string; hasFile?: boolean }) {
  const qc = useQueryClient();
  const [open, setOpen] = useState(false);
  const [file, setFile] = useState<File | null>(null);
  const [loading, setLoading] = useState(false);

  async function submit() {
    if (!file) {
      toast.error("File bukti wajib diunggah");
      return;
    }
    setLoading(true);
    const path = `${userId}/${Date.now()}_${file.name}`;
    const { error: upErr } = await supabase.storage.from("jobdesk-files").upload(path, file);
    if (upErr) {
      toast.error(upErr.message);
      setLoading(false);
      return;
    }

    const { error } = await supabase.from("jobdesks").update({
      file_url: path,
      file_name: file.name,
      status: "disetujui",
    }).eq("id", jobdeskId);

    setLoading(false);
    if (error) {
      toast.error(error.message);
      return;
    }
    toast.success(hasFile ? "Bukti pengerjaan diperbarui" : "Bukti pengerjaan diunggah");
    setOpen(false);
    setFile(null);
    qc.invalidateQueries({ queryKey: ["jobdesks"] });
    qc.invalidateQueries({ queryKey: ["seksi_jobdesks"] });
  }

  return (
    <Dialog open={open} onOpenChange={setOpen}>
      <DialogTrigger asChild>
        <Button size="sm">
          <Upload className="mr-1 h-4 w-4" /> {hasFile ? "Ganti Bukti" : "Kerjakan / Unggah Bukti"}
        </Button>
      </DialogTrigger>
      <DialogContent>
        <DialogHeader>
          <DialogTitle>Unggah Bukti Pengerjaan</DialogTitle>
        </DialogHeader>
        <div className="space-y-3">
          <div>
            <Label>File (PDF/gambar/dokumen)</Label>
            <Input
              type="file"
              accept=".pdf,image/*,.doc,.docx,.xls,.xlsx"
              onChange={(e) => setFile(e.target.files?.[0] ?? null)}
            />
          </div>
        </div>
        <DialogFooter>
          <Button onClick={submit} disabled={loading}>
            {loading ? "Mengunggah..." : "Kirim Bukti"}
          </Button>
        </DialogFooter>
      </DialogContent>
    </Dialog>
  );
}
