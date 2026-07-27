import { createFileRoute } from "@tanstack/react-router";
import { useMemo, useState } from "react";
import { useQuery } from "@tanstack/react-query";
import { supabase } from "@/integrations/supabase/client";
import { useCurrentUser } from "@/hooks/use-current-user";
import { Card, CardContent } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select";
import { Badge } from "@/components/ui/badge";
import { Download } from "lucide-react";

export const Route = createFileRoute("/_authenticated/rekap")({
  component: RekapPage,
  head: () => ({ meta: [{ title: "Rekap KPI — HMM FEB UNPAK" }] }),
});

function RekapPage() {
  const { data: user } = useCurrentUser();
  const [divisionId, setDivisionId] = useState<string>("all");

  const { data: divisions } = useQuery({
    queryKey: ["divisions"],
    queryFn: async () => (await supabase.from("divisions").select("*").order("name")).data ?? [],
  });

  const { data: profiles } = useQuery({
    queryKey: ["all-profiles"],
    queryFn: async () => (await supabase.from("profiles").select("*, divisions(name,code)").order("full_name")).data ?? [],
  });

  const { data: kpiMap } = useQuery({
    queryKey: ["all-kpi", (profiles ?? []).length],
    enabled: !!profiles,
    queryFn: async () => {
      const map: Record<string, any> = {};
      await Promise.all((profiles ?? []).map(async (p: any) => {
        const { data } = await supabase.rpc("calculate_kpi", { _profile_id: p.id });
        map[p.id] = data as any;
      }));
      return map;
    },
  });

  const rows = useMemo(() => {
    const list = (profiles ?? []).filter((p: any) => divisionId === "all" || p.division_id === divisionId);
    return list.map((p: any) => ({ ...p, kpi: kpiMap?.[p.id] ?? {} }))
      .sort((a: any, b: any) => (b.kpi.kpi_score ?? 0) - (a.kpi.kpi_score ?? 0));
  }, [profiles, kpiMap, divisionId]);

  function exportCSV() {
    const header = ["Nama", "NIM", "Divisi", "Jabatan", "Kehadiran%", "Jobdesk%", "Skor KPI"];
    const csv = [header.join(",")].concat(
      rows.map((r: any) => [
        JSON.stringify(r.full_name || ""),
        JSON.stringify(r.nim || ""),
        JSON.stringify(r.divisions?.name || ""),
        JSON.stringify(r.jabatan || ""),
        r.kpi?.attendance_pct ?? 0,
        r.kpi?.jobdesk_pct ?? 0,
        r.kpi?.kpi_score ?? 0,
      ].join(","))
    ).join("\n");
    const blob = new Blob([csv], { type: "text/csv" });
    const url = URL.createObjectURL(blob);
    const a = document.createElement("a");
    a.href = url; a.download = `rekap-kpi-${new Date().toISOString().slice(0, 10)}.csv`; a.click();
    URL.revokeObjectURL(url);
  }

  if (!user?.roles.some((r) => r === "hr_admin" || r === "bph")) {
    return <p className="text-muted-foreground">Hanya HR Admin dan BPH.</p>;
  }

  return (
    <div className="space-y-6">
      <div className="flex flex-col gap-3 md:flex-row md:items-center md:justify-between">
        <div>
          <h1 className="text-2xl font-bold">Rekap KPI Semua Anggota</h1>
          <p className="text-sm text-muted-foreground">Urut dari skor tertinggi. Dapat diekspor ke CSV.</p>
        </div>
        <div className="flex gap-2">
          <Select value={divisionId} onValueChange={setDivisionId}>
            <SelectTrigger className="w-56"><SelectValue /></SelectTrigger>
            <SelectContent>
              <SelectItem value="all">Semua divisi</SelectItem>
              {(divisions ?? []).map((d: any) => <SelectItem key={d.id} value={d.id}>{d.name}</SelectItem>)}
            </SelectContent>
          </Select>
          <Button onClick={exportCSV}><Download className="mr-1 h-4 w-4" /> Export CSV</Button>
        </div>
      </div>

      <Card>
        <CardContent className="p-0">
          <div className="overflow-x-auto">
            <table className="w-full text-sm">
              <thead className="bg-muted/50 text-left text-xs uppercase text-muted-foreground">
                <tr>
                  <th className="p-3">#</th>
                  <th className="p-3">Nama</th>
                  <th className="p-3">Divisi</th>
                  <th className="p-3 text-right">Kehadiran</th>
                  <th className="p-3 text-right">Jobdesk</th>
                  <th className="p-3 text-right">Skor KPI</th>
                </tr>
              </thead>
              <tbody>
                {rows.map((r: any, i: number) => (
                  <tr key={r.id} className="border-t border-border hover:bg-muted/30">
                    <td className="p-3 text-muted-foreground">{i + 1}</td>
                    <td className="p-3">
                      <p className="font-medium">{r.full_name || "(tanpa nama)"}</p>
                      <p className="text-xs text-muted-foreground">{r.nim || "—"}</p>
                    </td>
                    <td className="p-3"><Badge variant="outline">{r.divisions?.code ?? "-"}</Badge></td>
                    <td className="p-3 text-right">{r.kpi?.attendance_pct ?? 0}%</td>
                    <td className="p-3 text-right">{r.kpi?.jobdesk_pct ?? 0}%</td>
                    <td className="p-3 text-right font-bold text-primary">{r.kpi?.kpi_score ?? 0}</td>
                  </tr>
                ))}
                {rows.length === 0 && (
                  <tr><td colSpan={6} className="p-8 text-center text-sm text-muted-foreground">Tidak ada data.</td></tr>
                )}
              </tbody>
            </table>
          </div>
        </CardContent>
      </Card>
    </div>
  );
}
