import { createFileRoute } from "@tanstack/react-router";
import { useEffect, useState } from "react";
import { useMutation, useQuery, useQueryClient } from "@tanstack/react-query";
import { supabase } from "@/integrations/supabase/client";
import { useCurrentUser } from "@/hooks/use-current-user";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Label } from "@/components/ui/label";
import { Slider } from "@/components/ui/slider";
import { toast } from "sonner";

export const Route = createFileRoute("/_authenticated/pengaturan")({
  component: SettingsPage,
  head: () => ({ meta: [{ title: "Pengaturan KPI — HMM FEB UNPAK" }] }),
});

function SettingsPage() {
  const { data: user } = useCurrentUser();
  const qc = useQueryClient();
  const [attendance, setAttendance] = useState(50);

  const { data: settings } = useQuery({
    queryKey: ["kpi_settings"],
    queryFn: async () => (await supabase.from("kpi_settings").select("*").eq("id", 1).maybeSingle()).data,
  });

  useEffect(() => {
    if (settings) setAttendance(Math.round(Number(settings.attendance_weight) * 100));
  }, [settings]);

  const save = useMutation({
    mutationFn: async () => {
      const att = attendance / 100;
      const job = 1 - att;
      const { error } = await supabase.from("kpi_settings").update({
        attendance_weight: att, jobdesk_weight: job, updated_by: user!.userId, updated_at: new Date().toISOString(),
      }).eq("id", 1);
      if (error) throw error;
    },
    onSuccess: () => { toast.success("Bobot disimpan"); qc.invalidateQueries({ queryKey: ["kpi_settings"] }); },
    onError: (e: any) => toast.error(e.message),
  });

  if (!user?.roles.includes("hr_admin")) return <p className="text-muted-foreground">Hanya HR Admin.</p>;

  return (
    <div className="mx-auto max-w-2xl space-y-6">
      <div>
        <h1 className="text-2xl font-bold">Pengaturan KPI</h1>
        <p className="text-sm text-muted-foreground">Atur bobot kontribusi kehadiran dan jobdesk terhadap skor akhir.</p>
      </div>

      <Card>
        <CardHeader><CardTitle>Bobot perhitungan</CardTitle></CardHeader>
        <CardContent className="space-y-6">
          <div>
            <div className="mb-2 flex items-center justify-between">
              <Label>Kehadiran</Label>
              <span className="font-mono text-sm">{attendance}%</span>
            </div>
            <Slider value={[attendance]} min={0} max={100} step={5} onValueChange={(v) => setAttendance(v[0])} />
          </div>
          <div>
            <div className="mb-2 flex items-center justify-between">
              <Label>Jobdesk</Label>
              <span className="font-mono text-sm">{100 - attendance}%</span>
            </div>
            <div className="h-2 w-full rounded-full bg-muted">
              <div className="h-full rounded-full bg-accent" style={{ width: `${100 - attendance}%` }} />
            </div>
          </div>
          <div className="rounded-md bg-muted p-4 text-sm">
            <p className="font-medium">Formula:</p>
            <code className="text-xs">KPI = kehadiran% × {(attendance / 100).toFixed(2)} + jobdesk% × {((100 - attendance) / 100).toFixed(2)}</code>
          </div>
          <Button onClick={() => save.mutate()} disabled={save.isPending}>{save.isPending ? "Menyimpan..." : "Simpan"}</Button>
        </CardContent>
      </Card>
    </div>
  );
}
