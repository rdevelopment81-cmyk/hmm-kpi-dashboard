import { createFileRoute } from "@tanstack/react-router";
import { useMemo, useState } from "react";
import { useQuery } from "@tanstack/react-query";
import { supabase } from "@/integrations/supabase/client";
import { useCurrentUser } from "@/hooks/use-current-user";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";
import { Badge } from "@/components/ui/badge";
import { Avatar, AvatarFallback, AvatarImage } from "@/components/ui/avatar";
import {
  Download,
  Printer,
  Search,
  TrendingUp,
  CheckCircle2,
  AlertTriangle,
  AlertOctagon,
  Users,
} from "lucide-react";

export const Route = createFileRoute("/_authenticated/rekap")({
  component: RekapPage,
  head: () => ({ meta: [{ title: "Rekap KPI — HMM FEB UNPAK" }] }),
});

function getKesimpulan(score: number): { label: string; className: string } {
  if (score >= 70) {
    return {
      label: "Hijau",
      className:
        "bg-emerald-100 text-emerald-800 dark:bg-emerald-950 dark:text-emerald-300 border-emerald-300 dark:border-emerald-800",
    };
  } else if (score >= 40) {
    return {
      label: "Kuning",
      className:
        "bg-amber-100 text-amber-800 dark:bg-amber-950 dark:text-amber-300 border-amber-300 dark:border-amber-800",
    };
  } else {
    return {
      label: "Merah",
      className:
        "bg-rose-100 text-rose-800 dark:bg-rose-950 dark:text-rose-300 border-rose-300 dark:border-rose-800",
    };
  }
}

function RekapPage() {
  const { data: user } = useCurrentUser();
  const [divisionId, setDivisionId] = useState<string>("all");
  const [search, setSearch] = useState<string>("");
  const [statusFilter, setStatusFilter] = useState<string>("all");

  const { data: divisions } = useQuery({
    queryKey: ["divisions"],
    queryFn: async () => (await supabase.from("divisions").select("*").order("name")).data ?? [],
  });

  const { data: profiles } = useQuery({
    queryKey: ["all-profiles"],
    queryFn: async () =>
      (await supabase.from("profiles").select("*, divisions(name,code)").order("full_name")).data ??
      [],
  });

  const { data: kpiMap } = useQuery({
    queryKey: ["all-kpi", (profiles ?? []).length],
    enabled: !!profiles,
    queryFn: async () => {
      const map: Record<string, any> = {};
      await Promise.all(
        (profiles ?? []).map(async (p: any) => {
          const { data } = await supabase.rpc("calculate_kpi", { _profile_id: p.id });
          map[p.id] = data as any;
        }),
      );
      return map;
    },
  });

  // Semua baris yang sudah dihitung KPI-nya
  const allEvaluatedRows = useMemo(() => {
    return (profiles ?? [])
      .map((p: any) => ({ ...p, kpi: kpiMap?.[p.id] ?? {} }))
      .sort((a: any, b: any) => (b.kpi.kpi_score ?? 0) - (a.kpi.kpi_score ?? 0));
  }, [profiles, kpiMap]);

  // Statistik Ringkasan Keseluruhan / Berdasarkan Divisi terpilih
  const summaryStats = useMemo(() => {
    const list = allEvaluatedRows.filter(
      (p: any) => divisionId === "all" || p.division_id === divisionId,
    );
    const total = list.length;
    if (total === 0) {
      return { total: 0, avg: 0, hijau: 0, kuning: 0, merah: 0 };
    }
    const sumScore = list.reduce((acc, curr) => acc + (curr.kpi?.kpi_score ?? 0), 0);
    const avg = Number((sumScore / total).toFixed(1));
    const hijau = list.filter((p) => (p.kpi?.kpi_score ?? 0) >= 70).length;
    const kuning = list.filter(
      (p) => (p.kpi?.kpi_score ?? 0) >= 40 && (p.kpi?.kpi_score ?? 0) < 70,
    ).length;
    const merah = list.filter((p) => (p.kpi?.kpi_score ?? 0) < 40).length;

    return { total, avg, hijau, kuning, merah };
  }, [allEvaluatedRows, divisionId]);

  // Baris setelah difilter divisi, pencarian teks, dan filter status kesimpulan
  const filteredRows = useMemo(() => {
    return allEvaluatedRows.filter((p: any) => {
      const matchDiv = divisionId === "all" || p.division_id === divisionId;
      const matchSearch =
        !search.trim() ||
        p.full_name?.toLowerCase().includes(search.toLowerCase()) ||
        p.nim?.includes(search.trim());
      const kesimpulan = getKesimpulan(p.kpi?.kpi_score ?? 0).label.toLowerCase();
      const matchStatus = statusFilter === "all" || kesimpulan === statusFilter;
      return matchDiv && matchSearch && matchStatus;
    });
  }, [allEvaluatedRows, divisionId, search, statusFilter]);

  function exportCSV() {
    const header = [
      "No",
      "Nama",
      "NIM",
      "Divisi",
      "Jabatan",
      "Kehadiran%",
      "Jobdesk%",
      "Skor KPI",
      "Kesimpulan",
    ];
    const csv = [header.join(",")]
      .concat(
        filteredRows.map((r: any, idx: number) =>
          [
            idx + 1,
            JSON.stringify(r.full_name || ""),
            JSON.stringify(r.nim || ""),
            JSON.stringify(r.divisions?.name || ""),
            JSON.stringify(r.jabatan || ""),
            r.kpi?.attendance_pct ?? 0,
            r.kpi?.jobdesk_pct ?? 0,
            r.kpi?.kpi_score ?? 0,
            JSON.stringify(getKesimpulan(r.kpi?.kpi_score ?? 0).label),
          ].join(","),
        ),
      )
      .join("\n");
    const blob = new Blob([csv], { type: "text/csv;charset=utf-8;" });
    const url = URL.createObjectURL(blob);
    const a = document.createElement("a");
    a.href = url;
    a.download = `rekap-kpi-hmm-feb-unpak-${new Date().toISOString().slice(0, 10)}.csv`;
    a.click();
    URL.revokeObjectURL(url);
  }

  function handlePrint() {
    window.print();
  }

  if (!user?.roles.some((r) => r === "hr_admin" || r === "bph")) {
    return (
      <div className="p-8 text-center text-muted-foreground">
        Hanya HR Admin dan BPH yang memiliki hak akses ke halaman Rekap KPI.
      </div>
    );
  }

  return (
    <div className="space-y-6">
      {/* Header Cetak Resmi (Hanya tampil saat dicetak ke PDF/Kertas) */}
      <div className="hidden print:block border-b-2 border-black pb-4 mb-6">
        <div className="flex items-center gap-4">
          <img src="/hmm-logo.png" alt="Logo HMM" className="h-16 w-16 object-contain" />
          <div className="text-left">
            <h2 className="text-lg font-bold uppercase tracking-wider">
              HIMPUNAN MAHASISWA MANAJEMEN
            </h2>
            <h3 className="text-sm font-semibold text-gray-700">
              FAKULTAS EKONOMI DAN BISNIS — UNIVERSITAS PAKUAN
            </h3>
            <p className="text-xs text-gray-500">
              Laporan Evaluasi & Rekapitulasi Key Performance Indicator (KPI) Pengurus Periode 2026
            </p>
          </div>
        </div>
      </div>

      {/* Header Halaman Web */}
      <div className="flex flex-col gap-3 md:flex-row md:items-center md:justify-between print:hidden">
        <div>
          <h1 className="text-2xl font-bold">Rekap KPI Semua Anggota</h1>
          <p className="text-sm text-muted-foreground">
            Pemantauan kinerja seluruh pengurus dan anggota HMM FEB UNPAK.
          </p>
        </div>
        <div className="flex flex-wrap gap-2">
          <Button variant="outline" onClick={handlePrint} className="gap-2">
            <Printer className="h-4 w-4" /> Cetak / PDF
          </Button>
          <Button onClick={exportCSV} className="gap-2">
            <Download className="h-4 w-4" /> Export CSV
          </Button>
        </div>
      </div>

      {/* Kartu Ringkasan Metrik */}
      <div className="grid gap-3 grid-cols-2 md:grid-cols-4 print:grid-cols-4">
        <Card>
          <CardContent className="p-4 flex items-center justify-between">
            <div>
              <p className="text-xs font-medium text-muted-foreground">Total Dievaluasi</p>
              <p className="text-2xl font-bold mt-1">{summaryStats.total} orang</p>
            </div>
            <div className="h-9 w-9 rounded-lg bg-primary/10 text-primary flex items-center justify-center">
              <Users className="h-5 w-5" />
            </div>
          </CardContent>
        </Card>

        <Card>
          <CardContent className="p-4 flex items-center justify-between">
            <div>
              <p className="text-xs font-medium text-muted-foreground">Rata-rata Skor</p>
              <p className="text-2xl font-bold mt-1 text-primary">{summaryStats.avg}</p>
            </div>
            <div className="h-9 w-9 rounded-lg bg-primary/10 text-primary flex items-center justify-center">
              <TrendingUp className="h-5 w-5" />
            </div>
          </CardContent>
        </Card>

        <Card>
          <CardContent className="p-4 flex items-center justify-between">
            <div>
              <p className="text-xs font-medium text-muted-foreground">Kinerja Baik (Hijau)</p>
              <p className="text-2xl font-bold mt-1 text-emerald-600 dark:text-emerald-400">
                {summaryStats.hijau}{" "}
                <span className="text-xs font-normal text-muted-foreground">
                  ({summaryStats.total ? Math.round((summaryStats.hijau / summaryStats.total) * 100) : 0}%)
                </span>
              </p>
            </div>
            <div className="h-9 w-9 rounded-lg bg-emerald-500/10 text-emerald-600 flex items-center justify-center">
              <CheckCircle2 className="h-5 w-5" />
            </div>
          </CardContent>
        </Card>

        <Card>
          <CardContent className="p-4 flex items-center justify-between">
            <div>
              <p className="text-xs font-medium text-muted-foreground">Perlu Evaluasi (Kuning & Merah)</p>
              <p className="text-2xl font-bold mt-1 text-rose-600 dark:text-rose-400">
                {summaryStats.kuning + summaryStats.merah}{" "}
                <span className="text-xs font-normal text-muted-foreground">
                  (K:{summaryStats.kuning} / M:{summaryStats.merah})
                </span>
              </p>
            </div>
            <div className="h-9 w-9 rounded-lg bg-rose-500/10 text-rose-600 flex items-center justify-center">
              <AlertTriangle className="h-5 w-5" />
            </div>
          </CardContent>
        </Card>
      </div>

      {/* Toolbar Pencarian & Filter */}
      <Card className="print:hidden">
        <CardContent className="p-4">
          <div className="flex flex-col gap-3 md:flex-row md:items-center">
            {/* Search Input */}
            <div className="relative flex-1">
              <Search className="absolute left-3 top-2.5 h-4 w-4 text-muted-foreground" />
              <Input
                placeholder="Cari nama anggota atau NPM..."
                value={search}
                onChange={(e) => setSearch(e.target.value)}
                className="pl-9"
              />
            </div>

            {/* Filter Divisi */}
            <Select value={divisionId} onValueChange={setDivisionId}>
              <SelectTrigger className="w-full md:w-56">
                <SelectValue placeholder="Pilih Divisi" />
              </SelectTrigger>
              <SelectContent>
                <SelectItem value="all">Semua Divisi</SelectItem>
                {(divisions ?? []).map((d: any) => (
                  <SelectItem key={d.id} value={d.id}>
                    {d.name}
                  </SelectItem>
                ))}
              </SelectContent>
            </Select>

            {/* Filter Status Kesimpulan */}
            <Select value={statusFilter} onValueChange={setStatusFilter}>
              <SelectTrigger className="w-full md:w-44">
                <SelectValue placeholder="Semua Status" />
              </SelectTrigger>
              <SelectContent>
                <SelectItem value="all">Semua Status</SelectItem>
                <SelectItem value="hijau">🟢 Hijau (≥ 70)</SelectItem>
                <SelectItem value="kuning">🟡 Kuning (40 - 69)</SelectItem>
                <SelectItem value="merah">🔴 Merah (&lt; 40)</SelectItem>
              </SelectContent>
            </Select>
          </div>
        </CardContent>
      </Card>

      {/* Tabel Data Rekap */}
      <Card>
        <CardContent className="p-0">
          <div className="overflow-x-auto">
            <table className="w-full text-sm">
              <thead className="bg-muted/50 text-left text-xs uppercase text-muted-foreground">
                <tr>
                  <th className="p-3 w-12 text-center">#</th>
                  <th className="p-3">Nama Anggota</th>
                  <th className="p-3">Divisi</th>
                  <th className="p-3 text-right">Kehadiran</th>
                  <th className="p-3 text-right">Jobdesk</th>
                  <th className="p-3 text-right">Skor KPI</th>
                  <th className="p-3 text-center">Kesimpulan</th>
                </tr>
              </thead>
              <tbody>
                {filteredRows.map((r: any, i: number) => {
                  const kesimpulan = getKesimpulan(r.kpi?.kpi_score ?? 0);
                  return (
                    <tr
                      key={r.id}
                      className="border-t border-border hover:bg-muted/30 transition-colors"
                    >
                      <td className="p-3 text-center text-muted-foreground font-medium">{i + 1}</td>
                      <td className="p-3">
                        <div className="flex items-center gap-3">
                          <Avatar className="h-8 w-8 print:hidden">
                            <AvatarImage src={r.avatar_url ?? undefined} />
                            <AvatarFallback className="text-xs">
                              {(r.full_name ?? "?").slice(0, 2).toUpperCase()}
                            </AvatarFallback>
                          </Avatar>
                          <div>
                            <p className="font-semibold">{r.full_name || "(tanpa nama)"}</p>
                            <p className="text-xs text-muted-foreground">{r.nim || "—"}</p>
                          </div>
                        </div>
                      </td>
                      <td className="p-3">
                        <Badge variant="outline">{r.divisions?.code ?? "BPH"}</Badge>
                      </td>
                      <td className="p-3 text-right font-medium">
                        {r.kpi?.attendance_pct ?? 0}%
                      </td>
                      <td className="p-3 text-right font-medium">
                        {r.kpi?.jobdesk_pct ?? 0}%
                      </td>
                      <td className="p-3 text-right font-bold text-base text-primary">
                        {r.kpi?.kpi_score ?? 0}
                      </td>
                      <td className="p-3 text-center">
                        <span
                          className={`inline-flex items-center rounded-full border px-2.5 py-0.5 text-xs font-semibold ${kesimpulan.className}`}
                        >
                          {kesimpulan.label}
                        </span>
                      </td>
                    </tr>
                  );
                })}
                {filteredRows.length === 0 && (
                  <tr>
                    <td colSpan={7} className="p-10 text-center text-sm text-muted-foreground">
                      Tidak ada anggota yang cocok dengan filter pencarian.
                    </td>
                  </tr>
                )}
              </tbody>
            </table>
          </div>
        </CardContent>
      </Card>

      {/* Footer Cetak Resmi */}
      <div className="hidden print:block text-xs text-gray-500 pt-8 mt-8 border-t border-gray-300">
        <div className="flex justify-between items-end">
          <div>
            <p>Dicetak pada: {new Date().toLocaleDateString("id-ID", { dateStyle: "full" })}</p>
            <p>Sistem Dashboard KPI — HMM FEB UNPAK</p>
          </div>
          <div className="text-center w-48">
            <p className="mb-14">Ketua Umum / HR Admin</p>
            <p className="border-t border-black font-semibold">( ............................................ )</p>
          </div>
        </div>
      </div>
    </div>
  );
}
