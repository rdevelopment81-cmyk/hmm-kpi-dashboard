import { createFileRoute } from "@tanstack/react-router";
import { useCurrentUser } from "@/hooks/use-current-user";
import { useQuery } from "@tanstack/react-query";
import { supabase } from "@/integrations/supabase/client";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Progress } from "@/components/ui/progress";
import { Badge } from "@/components/ui/badge";
import { ScanLine, ClipboardCheck, TrendingUp, Users } from "lucide-react";
import { BarChart, Bar, XAxis, YAxis, Tooltip, ResponsiveContainer, CartesianGrid } from "recharts";

export const Route = createFileRoute("/_authenticated/dashboard")({
  component: Dashboard,
  head: () => ({ meta: [{ title: "Dashboard KPI — HMM FEB UNPAK" }] }),
});

function Dashboard() {
  const { data: user } = useCurrentUser();
  if (!user) return null;

  const isStaff = user.roles.some((r) => r === "hr_admin" || r === "bph");
  const isKadiv = user.roles.includes("kadiv");

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-bold">Selamat datang, {user.profile?.full_name || "Anggota"} 👋</h1>
        <p className="text-sm text-muted-foreground">Ringkasan kinerja Anda dan divisi terkait.</p>
      </div>

      <PersonalKPI userId={user.userId} />

      {(isStaff || isKadiv) && <DivisionOverview isStaff={isStaff} />}
    </div>
  );
}

function PersonalKPI({ userId }: { userId: string }) {
  const { data } = useQuery({
    queryKey: ["kpi", userId],
    queryFn: async () => {
      const { data, error } = await supabase.rpc("calculate_kpi", { _profile_id: userId });
      if (error) throw error;
      return data as any;
    },
  });

  const kpi = data ?? { attendance_pct: 0, jobdesk_pct: 0, kpi_score: 0, total_meetings: 0, attended: 0, total_jobs: 0, approved_jobs: 0 };

  const cards = [
    { label: "Skor KPI", value: `${kpi.kpi_score}`, icon: TrendingUp, tone: "bg-primary text-primary-foreground" },
    { label: "Kehadiran", value: `${kpi.attendance_pct}%`, sub: `${kpi.attended}/${kpi.total_meetings} kegiatan`, icon: ScanLine, tone: "bg-accent text-accent-foreground" },
    { label: "Jobdesk selesai", value: `${kpi.jobdesk_pct}%`, sub: `${kpi.approved_jobs}/${kpi.total_jobs} jobdesk`, icon: ClipboardCheck, tone: "bg-secondary text-secondary-foreground" },
  ];

  return (
    <div className="grid gap-4 sm:grid-cols-3">
      {cards.map((c) => (
        <Card key={c.label}>
          <CardContent className="p-6">
            <div className="flex items-center justify-between">
              <p className="text-sm font-medium text-muted-foreground">{c.label}</p>
              <div className={`grid h-9 w-9 place-items-center rounded-lg ${c.tone}`}>
                <c.icon className="h-4 w-4" />
              </div>
            </div>
            <p className="mt-3 text-3xl font-bold">{c.value}</p>
            {c.sub && <p className="text-xs text-muted-foreground">{c.sub}</p>}
          </CardContent>
        </Card>
      ))}
    </div>
  );
}

function DivisionOverview({ isStaff }: { isStaff: boolean }) {
  const { data: divs } = useQuery({
    queryKey: ["divisions"],
    queryFn: async () => (await supabase.from("divisions").select("*").order("name")).data ?? [],
  });

  const { data: rows } = useQuery({
    queryKey: ["divRecap"],
    queryFn: async () => {
      const { data: profiles } = await supabase.from("profiles").select("id, division_id");
      if (!profiles) return [] as any[];
      const results = await Promise.all(
        profiles.map(async (p: any) => {
          const { data } = await supabase.rpc("calculate_kpi", { _profile_id: p.id });
          return { division_id: p.division_id, score: (data as any)?.kpi_score ?? 0 };
        }),
      );
      return results;
    },
    enabled: isStaff,
  });

  const chartData = (divs ?? []).map((d: any) => {
    const list = (rows ?? []).filter((r: any) => r.division_id === d.id);
    const avg = list.length ? list.reduce((a: number, b: any) => a + Number(b.score), 0) / list.length : 0;
    return { name: d.code, KPI: Math.round(avg * 100) / 100, jumlah: list.length };
  });

  return (
    <Card>
      <CardHeader className="flex flex-row items-center justify-between">
        <CardTitle className="flex items-center gap-2"><Users className="h-5 w-5" /> Rata-rata KPI per Divisi</CardTitle>
        <Badge variant="secondary">{chartData.length} divisi</Badge>
      </CardHeader>
      <CardContent>
        <div className="h-72 w-full">
          <ResponsiveContainer width="100%" height="100%">
            <BarChart data={chartData}>
              <CartesianGrid strokeDasharray="3 3" opacity={0.3} />
              <XAxis dataKey="name" tick={{ fontSize: 12 }} />
              <YAxis domain={[0, 100]} />
              <Tooltip />
              <Bar dataKey="KPI" fill="var(--color-primary)" radius={[6, 6, 0, 0]} />
            </BarChart>
          </ResponsiveContainer>
        </div>
        <div className="mt-4 grid gap-2 sm:grid-cols-2">
          {chartData.map((d) => (
            <div key={d.name} className="flex items-center justify-between rounded-md border border-border p-3">
              <div>
                <p className="text-sm font-semibold">{d.name}</p>
                <p className="text-xs text-muted-foreground">{d.jumlah} anggota</p>
              </div>
              <div className="flex items-center gap-3">
                <Progress value={d.KPI} className="w-24" />
                <span className="w-10 text-right text-sm font-medium">{d.KPI}</span>
              </div>
            </div>
          ))}
        </div>
      </CardContent>
    </Card>
  );
}
