import { createFileRoute } from "@tanstack/react-router";
import { useEffect, useRef, useState } from "react";
import { useQuery, useQueryClient } from "@tanstack/react-query";
import { supabase } from "@/integrations/supabase/client";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Label } from "@/components/ui/label";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";
import { Avatar, AvatarFallback, AvatarImage } from "@/components/ui/avatar";
import { Badge } from "@/components/ui/badge";
import { CheckCircle2, XCircle, ScanLine } from "lucide-react";
import { toast } from "sonner";
import { useCurrentUser } from "@/hooks/use-current-user";

export const Route = createFileRoute("/_authenticated/absensi")({
  component: AbsensiPage,
  head: () => ({ meta: [{ title: "Absensi — HMM FEB UNPAK" }] }),
});

interface LastTap {
  ok: boolean;
  name?: string;
  avatar?: string | null;
  status?: string;
  message: string;
}

function AbsensiPage() {
  const { data: user } = useCurrentUser();
  const qc = useQueryClient();
  const [meetingId, setMeetingId] = useState<string>("");
  const [value, setValue] = useState("");
  const [last, setLast] = useState<LastTap | null>(null);
  const inputRef = useRef<HTMLInputElement>(null);

  const canUse = user?.roles.some((r) => r === "hr_admin" || r === "kadiv");

  const { data: meetings } = useQuery({
    queryKey: ["meetings-today"],
    queryFn: async () => {
      const today = new Date().toISOString().slice(0, 10);
      const { data } = await supabase
        .from("meetings")
        .select("id,title,meeting_date,start_time,division_id,divisions(code)")
        .gte("meeting_date", today)
        .order("meeting_date", { ascending: true })
        .limit(50);
      return data ?? [];
    },
  });

  useEffect(() => {
    inputRef.current?.focus();
  }, [meetingId]);

  useEffect(() => {
    if (!last) return;
    const t = setTimeout(() => setLast(null), 2500);
    return () => clearTimeout(t);
  }, [last]);

  async function handleTap() {
    const kartu = value.trim();
    setValue("");
    inputRef.current?.focus();
    if (!meetingId) { toast.error("Pilih rapat dulu"); return; }
    if (!kartu) return;

    const { data, error } = await supabase.rpc("record_attendance", { _meeting_id: meetingId, _id_kartu: kartu });
    if (error) { setLast({ ok: false, message: error.message }); return; }
    const r = data as any;
    if (!r.ok) {
      setLast({ ok: false, message: r.error, name: r.profile?.full_name, avatar: r.profile?.avatar_url });
      return;
    }
    setLast({ ok: true, name: r.profile.full_name, avatar: r.profile.avatar_url, status: r.status, message: "Absensi tercatat" });
    qc.invalidateQueries({ queryKey: ["attendance"] });
  }

  if (!canUse) return <p className="text-muted-foreground">Anda tidak memiliki akses ke halaman ini.</p>;

  return (
    <div className="mx-auto max-w-4xl space-y-6">
      <div>
        <h1 className="text-2xl font-bold">Absensi Rapat/Kegiatan</h1>
        <p className="text-sm text-muted-foreground">Tap kartu pada USB reader. Data tersimpan otomatis.</p>
      </div>

      <Card>
        <CardHeader><CardTitle>Pilih sesi Kegiatan</CardTitle></CardHeader>
        <CardContent>
          <Label>Kegiatan aktif</Label>
          <Select value={meetingId} onValueChange={setMeetingId}>
            <SelectTrigger className="mt-2"><SelectValue placeholder="Pilih kegiatan..." /></SelectTrigger>
            <SelectContent>
              {(meetings ?? []).map((m: any) => (
                <SelectItem key={m.id} value={m.id}>
                  {m.title} — {m.meeting_date} {m.start_time?.slice(0, 5)}{m.divisions?.code ? ` · ${m.divisions.code}` : ""}
                </SelectItem>
              ))}
              {(meetings ?? []).length === 0 && <div className="p-2 text-xs text-muted-foreground">Belum ada rapat.</div>}
            </SelectContent>
          </Select>
        </CardContent>
      </Card>

      <Card className={meetingId ? "border-primary" : ""}>
        <CardContent className="p-8">
          <label className="mb-3 flex items-center gap-2 text-sm font-medium text-muted-foreground">
            <ScanLine className="h-4 w-4 text-primary" /> Tempelkan kartu ID di sini
          </label>
          <input
            ref={inputRef}
            autoFocus
            disabled={!meetingId}
            value={value}
            onChange={(e) => setValue(e.target.value)}
            onKeyDown={(e) => { if (e.key === "Enter") { e.preventDefault(); handleTap(); } }}
            onBlur={() => setTimeout(() => inputRef.current?.focus(), 100)}
            placeholder={meetingId ? "Menunggu tap kartu..." : "Pilih rapat terlebih dahulu"}
            className="w-full rounded-xl border-2 border-dashed border-primary/40 bg-background px-6 py-8 text-center text-3xl font-mono tracking-widest placeholder:text-lg placeholder:tracking-normal focus:border-primary focus:outline-none disabled:opacity-50"
          />
          <p className="mt-3 text-center text-xs text-muted-foreground">
            Layar ini auto-fokus. Jangan tutup jendela selama rapat.
          </p>
        </CardContent>
      </Card>

      {last && (
        <Card className={`border-2 ${last.ok ? "border-success" : "border-destructive"} animate-in fade-in`}>
          <CardContent className="flex items-center gap-4 p-5">
            {last.ok ? (
              <CheckCircle2 className="h-12 w-12 text-success" />
            ) : (
              <XCircle className="h-12 w-12 text-destructive" />
            )}
            {last.avatar !== undefined && (
              <Avatar className="h-14 w-14">
                <AvatarImage src={last.avatar ?? undefined} />
                <AvatarFallback>{(last.name ?? "??").slice(0, 2).toUpperCase()}</AvatarFallback>
              </Avatar>
            )}
            <div className="flex-1">
              <p className="text-lg font-semibold">{last.name ?? last.message}</p>
              <p className="text-sm text-muted-foreground">{last.ok ? last.message : (last.name ? last.message : "Kartu tidak terdaftar")}</p>
            </div>
            {last.ok && last.status && (
              <Badge variant={last.status === "telat" ? "destructive" : "default"} className="text-base">
                {last.status.toUpperCase()}
              </Badge>
            )}
          </CardContent>
        </Card>
      )}
    </div>
  );
}
