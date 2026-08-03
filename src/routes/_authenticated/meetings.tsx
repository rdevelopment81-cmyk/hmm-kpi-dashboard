import { createFileRoute } from "@tanstack/react-router";
import { useState } from "react";
import { useMutation, useQuery, useQueryClient } from "@tanstack/react-query";
import { supabase } from "@/integrations/supabase/client";
import { useCurrentUser } from "@/hooks/use-current-user";
import { Card, CardContent } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Dialog, DialogContent, DialogHeader, DialogTitle, DialogTrigger, DialogFooter } from "@/components/ui/dialog";
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select";
import { Avatar, AvatarFallback, AvatarImage } from "@/components/ui/avatar";
import { Badge } from "@/components/ui/badge";
import { toast } from "sonner";
import { Plus, Trash2, Calendar, Users } from "lucide-react";

export const Route = createFileRoute("/_authenticated/meetings")({
  component: MeetingsPage,
  head: () => ({ meta: [{ title: "Rapat — HMM FEB UNPAK" }] }),
});

interface Meeting {
  id: string;
  title: string;
  meeting_date: string;
  start_time: string;
  grace_minutes: number;
  division_id: string | null;
  divisions: { code: string; name: string } | null;
  attendance: { count: number }[];
}


function MeetingsPage() {
  const { data: user } = useCurrentUser();
  const qc = useQueryClient();
  const [selectedMeeting, setSelectedMeeting] = useState<Meeting | null>(null);

  const { data: meetings } = useQuery({
    queryKey: ["meetings"],
    queryFn: async () => (await supabase.from("meetings").select("*, divisions(code,name), attendance(count)").order("meeting_date", { ascending: false })).data ?? [],
  });

  const del = useMutation({
    mutationFn: async (id: string) => { const { error } = await supabase.from("meetings").delete().eq("id", id); if (error) throw error; },
    onSuccess: () => { toast.success("Rapat dihapus"); qc.invalidateQueries({ queryKey: ["meetings"] }); },
    onError: (e: any) => toast.error(e.message),
  });

  if (!user) return null;
  const canCreate = user.roles.some((r) => r === "hr_admin" || r === "kadiv");

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-2xl font-bold">Rapat</h1>
          <p className="text-sm text-muted-foreground">Kelola sesi rapat dan pantau kehadiran.</p>
        </div>
        {canCreate && <CreateMeetingDialog userId={user.userId} defaultDivisionId={user.roles.includes("kadiv") ? user.profile?.division_id ?? null : null} />}
      </div>

      <div className="grid gap-3">
        {(meetings ?? []).map((m: any) => (
          <Card key={m.id} className="cursor-pointer transition-colors hover:bg-muted/50" onClick={() => setSelectedMeeting(m)}>
            <CardContent className="flex flex-col items-start gap-3 p-5 md:flex-row md:items-center md:justify-between">
              <div className="flex items-center gap-3">
                <div className="grid h-11 w-11 place-items-center rounded-lg bg-primary/10 text-primary"><Calendar className="h-5 w-5" /></div>
                <div>
                  <p className="font-semibold">{m.title}</p>
                  <p className="text-xs text-muted-foreground">
                    {m.meeting_date} · {m.start_time?.slice(0, 5)} · {m.divisions ? m.divisions.name : "Umum"}
                  </p>
                </div>
              </div>
              <div className="flex items-center gap-3" onClick={(e) => e.stopPropagation()}>
                <Button variant="ghost" size="sm" className="gap-1 text-muted-foreground hover:text-primary" onClick={() => setSelectedMeeting(m)}>
                  <Users className="h-4 w-4" />
                  Hadir: <b>{m.attendance?.[0]?.count ?? 0}</b>
                </Button>
                {canCreate && (
                  <Button variant="ghost" size="sm" onClick={() => del.mutate(m.id)}>
                    <Trash2 className="h-4 w-4 text-destructive" />
                  </Button>
                )}
              </div>
            </CardContent>
          </Card>
        ))}
        {(meetings ?? []).length === 0 && (
          <Card><CardContent className="p-8 text-center text-sm text-muted-foreground">Belum ada rapat.</CardContent></Card>
        )}
      </div>

      {selectedMeeting && (
        <AttendanceDialog meeting={selectedMeeting} onClose={() => setSelectedMeeting(null)} />
      )}
    </div>
  );
}

function AttendanceDialog({ meeting, onClose }: { meeting: Meeting; onClose: () => void }) {
  const { data: rows, isLoading } = useQuery({
    queryKey: ["attendance", meeting.id],
    queryFn: async () => {
      const { data, error } = await supabase
        .from("attendance")
        .select("*, profiles:profile_id(full_name, avatar_url, division_id, divisions(name))")
        .eq("meeting_id", meeting.id)
        .order("tap_time", { ascending: true });
      if (error) throw error;
      return data ?? [];
    },
    enabled: !!meeting.id,
  });

  return (
    <Dialog open onOpenChange={(open) => { if (!open) onClose(); }}>
      <DialogContent className="max-w-xl">
        <DialogHeader>
          <DialogTitle>Daftar Kehadiran</DialogTitle>
        </DialogHeader>
        <div className="space-y-4">
          <div className="rounded-lg border bg-muted/30 p-4">
            <p className="font-semibold">{meeting.title}</p>
            <p className="text-sm text-muted-foreground">
              {meeting.meeting_date} · {meeting.start_time?.slice(0, 5)} · {meeting.divisions ? meeting.divisions.name : "Umum"}
            </p>
            <p className="mt-1 text-sm text-muted-foreground">Total hadir: <b>{rows?.length ?? 0}</b></p>
          </div>

          {isLoading ? (
            <p className="text-sm text-muted-foreground">Memuat kehadiran...</p>
          ) : (rows ?? []).length === 0 ? (
            <p className="text-center text-sm text-muted-foreground">Belum ada kehadiran untuk rapat ini.</p>
          ) : (
            <div className="grid gap-2 max-h-[60vh] overflow-y-auto pr-1">
              {(rows ?? []).map((r: any) => (
                <div key={r.id} className="flex items-center gap-3 rounded-lg border p-3">
                  <Avatar className="h-10 w-10">
                    <AvatarImage src={r.profiles?.avatar_url ?? undefined} />
                    <AvatarFallback>{(r.profiles?.full_name ?? "??").slice(0, 2).toUpperCase()}</AvatarFallback>
                  </Avatar>
                  <div className="flex-1 min-w-0">
                    <p className="font-medium truncate">{r.profiles?.full_name ?? "-"}</p>
                    <p className="text-xs text-muted-foreground">
                      {r.profiles?.divisions?.name ?? "Belum ada divisi"} · {new Date(r.tap_time).toLocaleTimeString("id-ID", { hour: "2-digit", minute: "2-digit" })}
                    </p>
                  </div>
                  <Badge variant={r.status === "telat" ? "destructive" : "default"}>
                    {r.status === "telat" ? "TELAT" : "HADIR"}
                  </Badge>
                </div>
              ))}
            </div>
          )}
        </div>
        <DialogFooter><Button onClick={onClose}>Tutup</Button></DialogFooter>
      </DialogContent>
    </Dialog>
  );
}


function CreateMeetingDialog({ userId, defaultDivisionId }: { userId: string; defaultDivisionId: string | null }) {
  const qc = useQueryClient();
  const [open, setOpen] = useState(false);
  const [title, setTitle] = useState("");
  const [date, setDate] = useState(new Date().toISOString().slice(0, 10));
  const [time, setTime] = useState("19:00");
  const [grace, setGrace] = useState(15);
  const [divisionId, setDivisionId] = useState<string | "">(defaultDivisionId ?? "");

  const { data: divisions } = useQuery({
    queryKey: ["divisions"],
    queryFn: async () => (await supabase.from("divisions").select("*").order("name")).data ?? [],
  });

  async function submit() {
    if (!title) { toast.error("Judul wajib"); return; }
    const { error } = await supabase.from("meetings").insert({
      title, meeting_date: date, start_time: time, grace_minutes: grace,
      division_id: divisionId || null, created_by: userId,
    });
    if (error) { toast.error(error.message); return; }
    toast.success("Rapat dibuat");
    setOpen(false); setTitle("");
    qc.invalidateQueries({ queryKey: ["meetings"] });
  }

  return (
    <Dialog open={open} onOpenChange={setOpen}>
      <DialogTrigger asChild><Button><Plus className="mr-1 h-4 w-4" /> Rapat baru</Button></DialogTrigger>
      <DialogContent>
        <DialogHeader><DialogTitle>Buat Rapat</DialogTitle></DialogHeader>
        <div className="space-y-3">
          <div><Label>Judul</Label><Input value={title} onChange={(e) => setTitle(e.target.value)} /></div>
          <div className="grid grid-cols-2 gap-2">
            <div><Label>Tanggal</Label><Input type="date" value={date} onChange={(e) => setDate(e.target.value)} /></div>
            <div><Label>Mulai</Label><Input type="time" value={time} onChange={(e) => setTime(e.target.value)} /></div>
          </div>
          <div><Label>Toleransi telat (menit)</Label><Input type="number" value={grace} onChange={(e) => setGrace(Number(e.target.value))} /></div>
          <div>
            <Label>Divisi (kosong = rapat umum)</Label>
            <Select value={divisionId} onValueChange={(v) => setDivisionId(v)}>
              <SelectTrigger><SelectValue placeholder="Umum (semua divisi)" /></SelectTrigger>
              <SelectContent>
                {(divisions ?? []).map((d: any) => <SelectItem key={d.id} value={d.id}>{d.name}</SelectItem>)}
              </SelectContent>
            </Select>
          </div>
        </div>
        <DialogFooter><Button onClick={submit}>Simpan</Button></DialogFooter>
      </DialogContent>
    </Dialog>
  );
}
