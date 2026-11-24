import { createFileRoute, Link } from "@tanstack/react-router";
import { useCurrentUser } from "@/hooks/use-current-user";
import { useQuery } from "@tanstack/react-query";
import { supabase } from "@/integrations/supabase/client";
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";
import { Progress } from "@/components/ui/progress";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Avatar, AvatarFallback, AvatarImage } from "@/components/ui/avatar";
import {
  ScanLine,
  ClipboardCheck,
  TrendingUp,
  Users,
  FolderKanban,
  ArrowRight,
  ClipboardList,
  CalendarDays,
  CheckCircle2,
  Clock,
  AlertCircle,
  Building2,
  RotateCw,
} from "lucide-react";
import { BarChart, Bar, XAxis, YAxis, Tooltip, ResponsiveContainer, CartesianGrid } from "recharts";
import { STATUS_MAP } from "@/routes/_authenticated/prokers";

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
      <div className="flex flex-col gap-2 sm:flex-row sm:items-center sm:justify-between">
        <div>
          <h1 className="text-2xl font-bold">
            Selamat datang, {user.profile?.full_name || "Anggota"} 👋
          </h1>
          <p className="text-sm text-muted-foreground">Ringkasan kinerja Anda dan divisi terkait.</p>
        </div>
        <Button
          variant="outline"
          size="sm"
          className="gap-2 text-xs self-start sm:self-auto"
          onClick={() => window.location.reload()}
          title="Muat ulang halaman untuk mengambil pembaruan terbaru"
        >
          <RotateCw className="h-3.5 w-3.5" /> Segarkan Halaman
        </Button>
      </div>

      {/* 3 Kartu KPI Pribadi untuk semua role */}
      <PersonalKPI userId={user.userId} />

      {/* Jika BPH / HR Admin: Tampilkan Ringkasan Proker */}
      {isStaff && <ProkerSummary />}

      {/* Jika Pimpinan (BPH & Kadiv): Tampilkan Analisis Rata-rata 9 Divisi */}
      {isStaff || isKadiv ? (
        <DivisionOverview isStaff={isStaff} />
      ) : (
        /* Tampilan Khusus Anggota: Divisi Saya, Jobdesk Pending, dan Rapat Terdekat */
        <div className="space-y-6">
          <MyDivisionCard user={user} />

          <div className="grid gap-6 md:grid-cols-2">
            <MyPendingJobdesks userId={user.userId} />
            <MyUpcomingMeetings divisionId={user.profile?.division_id ?? null} />
          </div>
        </div>
      )}
    </div>
  );
}

function PersonalKPI({ userId }: { userId: string }) {
  const { data } = useQuery({
    queryKey: ["kpi", userId],
    queryFn: async () => {
      const { data, error } = await supabase.rpc("calculate_kpi", { _profile_id: userId });
      if (error) throw error;
      return data as {
        attendance_pct: number;
        jobdesk_pct: number;
        kpi_score: number;
        total_meetings: number;
        attended: number;
        total_jobs: number;
        approved_jobs: number;
      };
    },
  });

  const kpi = data ?? {
    attendance_pct: 0,
    jobdesk_pct: 0,
    kpi_score: 0,
    total_meetings: 0,
    attended: 0,
    total_jobs: 0,
    approved_jobs: 0,
  };

  const cards = [
    {
      label: "Skor KPI",
      value: `${kpi.kpi_score}`,
      icon: TrendingUp,
      tone: "bg-primary text-primary-foreground",
    },
    {
      label: "Kehadiran",
      value: `${kpi.attendance_pct}%`,
      sub: `${kpi.attended}/${kpi.total_meetings} kegiatan`,
      icon: ScanLine,
      tone: "bg-accent text-accent-foreground",
    },
    {
      label: "Jobdesk selesai",
      value: `${kpi.jobdesk_pct}%`,
      sub: `${kpi.approved_jobs}/${kpi.total_jobs} jobdesk`,
      icon: ClipboardCheck,
      tone: "bg-secondary text-secondary-foreground",
    },
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

/* ========================================================
   KOMPONEN KHUSUS ANGGOTA: 1. Kartu "Divisi Saya"
======================================================== */
function MyDivisionCard({ user }: { user: any }) {
  const divisionId = user.profile?.division_id;

  const { data: divInfo, isLoading } = useQuery({
    queryKey: ["myDivisionInfo", divisionId],
    enabled: !!divisionId,
    queryFn: async () => {
      if (!divisionId) return null;
      const { data: members, error } = await supabase
        .from("profiles")
        .select("id, full_name, avatar_url, jabatan, nim")
        .eq("division_id", divisionId)
        .order("full_name");
      if (error) throw error;

      const scores = await Promise.all(
        (members ?? []).map(async (m: { id: string }) => {
          try {
            const { data } = await supabase.rpc("calculate_kpi", { _profile_id: m.id });
            return (data as any)?.kpi_score ?? 0;
          } catch {
            return 0;
          }
        }),
      );

      const sum = scores.reduce((acc, curr) => acc + curr, 0);
      const avg = scores.length > 0 ? Math.round(sum / scores.length) : 0;

      return {
        members: members ?? [],
        avgKpi: avg,
        totalMembers: members?.length ?? 0,
      };
    },
  });

  if (!divisionId) {
    return (
      <Card className="border-dashed">
        <CardContent className="p-6 flex items-center gap-4">
          <div className="grid h-12 w-12 place-items-center rounded-xl bg-muted text-muted-foreground">
            <Building2 className="h-6 w-6" />
          </div>
          <div>
            <h3 className="font-semibold text-base">Belum Terdaftar di Divisi</h3>
            <p className="text-sm text-muted-foreground">
              Anda belum ditetapkan ke dalam divisi tertentu. Hubungi HR Admin atau Kepala Divisi
              untuk penetapan divisi Anda.
            </p>
          </div>
        </CardContent>
      </Card>
    );
  }

  const avgKpi = divInfo?.avgKpi ?? 0;
  const isGood = avgKpi >= 70;
  const isWarning = avgKpi >= 40 && avgKpi < 70;

  return (
    <Card className="overflow-hidden">
      <CardHeader className="bg-muted/30 pb-4">
        <div className="flex flex-col gap-2 sm:flex-row sm:items-center sm:justify-between">
          <div className="flex items-center gap-3">
            <div className="grid h-10 w-10 place-items-center rounded-lg bg-primary/10 text-primary">
              <Building2 className="h-5 w-5" />
            </div>
            <div>
              <CardTitle className="text-lg">
                Divisi Saya — {user.division?.name || "Divisi Terdaftar"}
              </CardTitle>
              <CardDescription>
                Informasi perkembangan tim dan rekan satu divisi Anda.
              </CardDescription>
            </div>
          </div>
          <Badge variant="outline" className="self-start sm:self-auto font-mono">
            {user.division?.code || "DIVISI"}
          </Badge>
        </div>
      </CardHeader>
      <CardContent className="p-6 space-y-6">
        <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
          {/* Rata-rata Skor KPI Divisi */}
          <div className="rounded-lg border p-4 bg-card">
            <p className="text-xs font-medium text-muted-foreground">Rata-rata Skor Divisi</p>
            <div className="mt-2 flex items-baseline gap-2">
              <span className="text-3xl font-bold">{avgKpi}</span>
              <span className="text-xs text-muted-foreground">/ 100</span>
              <Badge
                className={`ml-auto text-xs ${
                  isGood
                    ? "bg-emerald-100 text-emerald-800 dark:bg-emerald-950 dark:text-emerald-300"
                    : isWarning
                      ? "bg-amber-100 text-amber-800 dark:bg-amber-950 dark:text-amber-300"
                      : "bg-rose-100 text-rose-800 dark:bg-rose-950 dark:text-rose-300"
                }`}
              >
                {isGood ? "Baik" : isWarning ? "Cukup" : "Perlu Evaluasi"}
              </Badge>
            </div>
            <Progress value={avgKpi} className="mt-3 h-2" />
          </div>

          {/* Total Rekan Divisi */}
          <div className="rounded-lg border p-4 bg-card">
            <p className="text-xs font-medium text-muted-foreground">Total Rekan Satu Tim</p>
            <div className="mt-2 flex items-baseline gap-2">
              <span className="text-3xl font-bold">{divInfo?.totalMembers ?? 0}</span>
              <span className="text-xs text-muted-foreground">orang pengurus</span>
            </div>
            <p className="mt-3 text-xs text-muted-foreground">
              Jabatan Anda:{" "}
              <b className="text-foreground">{user.profile?.jabatan || "Anggota"}</b>
            </p>
          </div>

          {/* Tautan Cepat ke Struktur */}
          <div className="rounded-lg border p-4 bg-card flex flex-col justify-between sm:col-span-2 lg:col-span-1">
            <div>
              <p className="text-xs font-medium text-muted-foreground">Struktur Organisasi</p>
              <p className="mt-1 text-xs text-muted-foreground">
                Lihat bagan kepengurusan dan susunan posisi di divisi Anda.
              </p>
            </div>
            <Button variant="outline" size="sm" asChild className="mt-3 w-full justify-between">
              <Link to="/struktur">
                <span>Bagan Organisasi</span>
                <ArrowRight className="h-4 w-4" />
              </Link>
            </Button>
          </div>
        </div>

        {/* Daftar Anggota Divisi */}
        {divInfo?.members && divInfo.members.length > 0 && (
          <div>
            <p className="text-xs font-semibold uppercase tracking-wider text-muted-foreground mb-3">
              Rekan Satu Divisi ({divInfo.members.length})
            </p>
            <div className="grid gap-2.5 sm:grid-cols-2 md:grid-cols-3">
              {divInfo.members.map((m: any) => (
                <div
                  key={m.id}
                  className={`flex items-center gap-3 rounded-lg border p-2.5 transition-colors ${
                    m.id === user.userId ? "border-primary/50 bg-primary/5" : "bg-card"
                  }`}
                >
                  <Avatar className="h-8 w-8">
                    <AvatarImage src={m.avatar_url ?? undefined} />
                    <AvatarFallback className="text-xs font-medium">
                      {(m.full_name ?? "?").slice(0, 2).toUpperCase()}
                    </AvatarFallback>
                  </Avatar>
                  <div className="min-w-0 flex-1">
                    <p className="truncate text-xs font-semibold">
                      {m.full_name} {m.id === user.userId && "(Anda)"}
                    </p>
                    <p className="truncate text-[11px] text-muted-foreground">
                      {m.jabatan || "Anggota"}
                    </p>
                  </div>
                </div>
              ))}
            </div>
          </div>
        )}
      </CardContent>
    </Card>
  );
}

/* ========================================================
   KOMPONEN KHUSUS ANGGOTA: 2. Widget "Tugas & Jobdesk Saya"
======================================================== */
function MyPendingJobdesks({ userId }: { userId: string }) {
  const { data: jobs, isLoading } = useQuery({
    queryKey: ["myPendingJobdesks", userId],
    queryFn: async () => {
      try {
        const { data, error } = await supabase
          .from("jobdesks")
          .select("id, title, deadline, status, seksi_name, prokers(name)")
          .eq("profile_id", userId)
          .in("status", ["ditugaskan", "ditolak"])
          .order("created_at", { ascending: false })
          .limit(4);
        if (error) {
          console.warn("Error fetching pending jobdesks:", error);
          return [];
        }
        return data ?? [];
      } catch (err) {
        console.warn("Exception in myPendingJobdesks:", err);
        return [];
      }
    },
  });

  return (
    <Card className="flex flex-col h-full">
      <CardHeader className="flex flex-row items-center justify-between pb-3">
        <div>
          <CardTitle className="text-base flex items-center gap-2">
            <ClipboardList className="h-4 w-4 text-primary" />
            Tugas & Jobdesk Belum Selesai
          </CardTitle>
          <CardDescription className="text-xs">
            Daftar tugas yang perlu Anda kerjakan atau revisi.
          </CardDescription>
        </div>
        <Button variant="ghost" size="sm" asChild className="gap-1 text-xs -mr-2">
          <Link to="/jobdesk">
            Lihat Semua <ArrowRight className="h-3 w-3" />
          </Link>
        </Button>
      </CardHeader>
      <CardContent className="flex-1 space-y-3">
        {isLoading ? (
          <p className="text-xs text-muted-foreground py-4 text-center">Memuat jobdesk...</p>
        ) : (jobs ?? []).length === 0 ? (
          <div className="rounded-lg border border-dashed p-6 text-center">
            <CheckCircle2 className="mx-auto h-8 w-8 text-emerald-500 mb-2" />
            <p className="text-sm font-semibold">Semua Jobdesk Selesai!</p>
            <p className="text-xs text-muted-foreground mt-1">
              Tidak ada tugas yang tertunda. Semua jobdesk Anda telah diajukan atau disetujui.
            </p>
          </div>
        ) : (
          <div className="space-y-2.5">
            {jobs.map((j: any) => {
              const isRevision = j.status === "ditolak";
              return (
                <div
                  key={j.id}
                  className="flex flex-col gap-2 rounded-lg border p-3 hover:bg-muted/40 transition-colors"
                >
                  <div className="flex items-start justify-between gap-2">
                    <p className="font-medium text-xs sm:text-sm line-clamp-1">{j.title}</p>
                    <Badge
                      variant="outline"
                      className={`shrink-0 text-[10px] ${
                        isRevision
                          ? "border-rose-400 bg-rose-50 text-rose-700 dark:bg-rose-950 dark:text-rose-300"
                          : "border-amber-400 bg-amber-50 text-amber-700 dark:bg-amber-950 dark:text-amber-300"
                      }`}
                    >
                      {isRevision ? "Perlu Revisi" : "Belum Selesai"}
                    </Badge>
                  </div>
                  <div className="flex flex-wrap items-center justify-between text-[11px] text-muted-foreground">
                    <span>
                      {j.prokers?.name ? `Proker: ${j.prokers.name}` : j.seksi_name || "Jobdesk Divisi"}
                    </span>
                    {j.deadline && (
                      <span className="flex items-center gap-1 font-mono">
                        <Clock className="h-3 w-3" /> Deadline: {j.deadline}
                      </span>
                    )}
                  </div>
                </div>
              );
            })}
          </div>
        )}
      </CardContent>
    </Card>
  );
}

/* ========================================================
   KOMPONEN KHUSUS ANGGOTA: 3. Widget "Kegiatan & Rapat Terdekat"
======================================================== */
function MyUpcomingMeetings({ divisionId }: { divisionId: string | null }) {
  const { data: meetings, isLoading } = useQuery({
    queryKey: ["myUpcomingMeetings", divisionId],
    queryFn: async () => {
      try {
        let query = supabase
          .from("meetings")
          .select(
            "id, title, meeting_date, start_time, meeting_type, divisions(name, code), prokers(name)",
          )
          .order("meeting_date", { ascending: false })
          .limit(4);

        if (divisionId) {
          query = query.or(`division_id.is.null,division_id.eq.${divisionId}`);
        } else {
          query = query.is("division_id", null);
        }
        const { data, error } = await query;
        if (error) {
          console.warn("Error fetching meetings:", error);
          return [];
        }
        return data ?? [];
      } catch (err) {
        console.warn("Exception in myUpcomingMeetings:", err);
        return [];
      }
    },
  });

  return (
    <Card className="flex flex-col h-full">
      <CardHeader className="flex flex-row items-center justify-between pb-3">
        <div>
          <CardTitle className="text-base flex items-center gap-2">
            <CalendarDays className="h-4 w-4 text-primary" />
            Kegiatan & Rapat Terdekat
          </CardTitle>
          <CardDescription className="text-xs">
            Agenda rapat umum dan kegiatan divisi Anda.
          </CardDescription>
        </div>
        <Button variant="ghost" size="sm" asChild className="gap-1 text-xs -mr-2">
          <Link to="/meetings">
            Lihat Jadwal <ArrowRight className="h-3 w-3" />
          </Link>
        </Button>
      </CardHeader>
      <CardContent className="flex-1 space-y-3">
        {isLoading ? (
          <p className="text-xs text-muted-foreground py-4 text-center">Memuat agenda kegiatan...</p>
        ) : (meetings ?? []).length === 0 ? (
          <div className="rounded-lg border border-dashed p-6 text-center">
            <CalendarDays className="mx-auto h-8 w-8 text-muted-foreground/60 mb-2" />
            <p className="text-sm font-semibold">Belum Ada Agenda</p>
            <p className="text-xs text-muted-foreground mt-1">
              Belum ada rapat baru yang dijadwalkan oleh pengurus.
            </p>
          </div>
        ) : (
          <div className="space-y-2.5">
            {meetings.map((m: any) => (
              <div
                key={m.id}
                className="flex items-center justify-between gap-3 rounded-lg border p-3 hover:bg-muted/40 transition-colors"
              >
                <div className="min-w-0 flex-1">
                  <p className="font-medium text-xs sm:text-sm truncate">{m.title}</p>
                  <div className="mt-1 flex flex-wrap items-center gap-2 text-[11px] text-muted-foreground">
                    <span className="flex items-center gap-1 font-mono">
                      <Clock className="h-3 w-3" />
                      {m.meeting_date} · {m.start_time?.slice(0, 5)} WIB
                    </span>
                    {m.prokers?.name && (
                      <Badge variant="secondary" className="text-[10px] py-0 px-1.5">
                        {m.prokers.name}
                      </Badge>
                    )}
                  </div>
                </div>
                <Badge variant="outline" className="shrink-0 text-[10px]">
                  {m.divisions?.code ? m.divisions.code : "Umum"}
                </Badge>
              </div>
            ))}
          </div>
        )}
      </CardContent>
    </Card>
  );
}

/* ========================================================
   KOMPONEN PIMPINAN: Analisis Rata-rata 9 Divisi (Staff & Kadiv)
======================================================== */
function DivisionOverview({ isStaff }: { isStaff: boolean }) {
  const { data: divs } = useQuery({
    queryKey: ["divisions"],
    queryFn: async () => (await supabase.from("divisions").select("*").order("name")).data ?? [],
  });

  const { data: rows } = useQuery({
    queryKey: ["divRecap"],
    queryFn: async () => {
      const { data: profiles } = await supabase.from("profiles").select("id, division_id");
      if (!profiles) return [] as Array<{ division_id: string | null; score: number }>;
      const results = await Promise.all(
        profiles.map(async (p: { id: string; division_id: string | null }) => {
          const { data } = await supabase.rpc("calculate_kpi", { _profile_id: p.id });
          return { division_id: p.division_id, score: (data as { kpi_score?: number })?.kpi_score ?? 0 };
        }),
      );
      return results;
    },
    enabled: true,
  });

  const chartData = (divs ?? []).map((d: { id: string; code: string; name: string }) => {
    const list = (rows ?? []).filter((r: { division_id: string | null; score: number }) => r.division_id === d.id);
    const avg = list.length ? list.reduce((a: number, b: { score: number }) => a + Number(b.score), 0) / list.length : 0;
    return { name: d.code, KPI: Math.round(avg * 100) / 100, jumlah: list.length };
  });

  return (
    <Card>
      <CardHeader className="flex flex-row items-center justify-between">
        <CardTitle className="flex items-center gap-2">
          <Users className="h-5 w-5" /> Rata-rata KPI per Divisi
        </CardTitle>
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
            <div
              key={d.name}
              className="flex items-center justify-between rounded-md border border-border p-3"
            >
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

/* ========================================================
   KOMPONEN BPH / HR ADMIN: Ringkasan Proker
======================================================== */
function ProkerSummary() {
  const { data: prokerCounts, isLoading } = useQuery({
    queryKey: ["prokerCounts"],
    queryFn: async () => {
      const { data, error } = await supabase.from("prokers").select("status");
      if (error) throw error;
      const counts: Record<string, number> = {
        perencanaan: 0,
        rapat_1: 0,
        rapat_2: 0,
        rapat_3: 0,
        pelaksanaan: 0,
        selesai: 0,
      };
      (data ?? []).forEach((p: { status: string | null }) => {
        if (p.status && counts[p.status] !== undefined) {
          counts[p.status]++;
        }
      });
      return { counts, total: (data ?? []).length };
    },
  });

  const { counts = {}, total = 0 } = prokerCounts ?? {};

  return (
    <Card>
      <CardHeader className="flex flex-row items-center justify-between">
        <div>
          <CardTitle className="flex items-center gap-2">
            <FolderKanban className="h-5 w-5 text-primary" /> Ringkasan Status Program Kerja
          </CardTitle>
          <CardDescription className="text-xs">
            Pantau status perkembangan seluruh proker organisasi.
          </CardDescription>
        </div>
        <Button variant="outline" size="sm" asChild className="gap-1 text-xs">
          <Link to="/prokers">
            Lihat Semua <ArrowRight className="h-3.5 w-3.5" />
          </Link>
        </Button>
      </CardHeader>
      <CardContent>
        {isLoading ? (
          <p className="text-xs text-muted-foreground">Memuat statistik proker...</p>
        ) : (
          <div className="grid gap-3 sm:grid-cols-2 lg:grid-cols-6">
            {Object.entries(STATUS_MAP).map(([key, item]) => {
              const count = counts[key] ?? 0;
              return (
                <div
                  key={key}
                  className="flex flex-col justify-between rounded-lg border p-3 bg-card"
                >
                  <span
                    className={`inline-flex self-start items-center rounded-full px-2 py-0.5 text-[10px] font-semibold ${item.className}`}
                  >
                    {item.label}
                  </span>
                  <div className="mt-3">
                    <p className="text-2xl font-bold">{count}</p>
                    <p className="text-[11px] text-muted-foreground mt-0.5">
                      {total > 0 ? Math.round((count / total) * 100) : 0}% dari {total} proker
                    </p>
                  </div>
                </div>
              );
            })}
          </div>
        )}
      </CardContent>
    </Card>
  );
}
