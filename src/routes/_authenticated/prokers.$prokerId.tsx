import { createFileRoute, Link } from "@tanstack/react-router";
import { useState } from "react";
import { useMutation, useQuery, useQueryClient } from "@tanstack/react-query";
import { supabase } from "@/integrations/supabase/client";
import { useCurrentUser } from "@/hooks/use-current-user";
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
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
import { Avatar, AvatarFallback, AvatarImage } from "@/components/ui/avatar";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import { Textarea } from "@/components/ui/textarea";
import { Badge } from "@/components/ui/badge";
import { toast } from "sonner";
import { STATUS_MAP } from "@/routes/_authenticated/prokers";
import {
  ArrowLeft,
  CalendarDays,
  Plus,
  Trash2,
  UserPlus,
  Users,
  ShieldCheck,
  CheckCircle2,
  Clock,
  ChevronRight,
  Briefcase,
} from "lucide-react";

export const Route = createFileRoute("/_authenticated/prokers/$prokerId")({
  component: ProkerDetailPage,
  head: () => ({ meta: [{ title: "Detail Program Kerja — HMM FEB UNPAK" }] }),
});

const CORE_ROLES = [
  {
    type: "ketua_pelaksana",
    label: "Ketua Pelaksana",
    tone: "border-amber-200 bg-amber-50/50 dark:bg-amber-950/20",
  },
  {
    type: "sekretaris",
    label: "Sekretaris",
    tone: "border-blue-200 bg-blue-50/50 dark:bg-blue-950/20",
  },
  {
    type: "bendahara",
    label: "Bendahara",
    tone: "border-emerald-200 bg-emerald-50/50 dark:bg-emerald-950/20",
  },
] as const;

const COMMON_SEKSI_SUGGESTIONS = [
  "Acara",
  "Humas",
  "Sekretariat",
  "PDD (Publikasi, Dekorasi & Dokumentasi)",
  "Perlengkapan",
  "Konsumsi",
  "Sponsor & Fundraiser",
  "Keamanan",
];

function ProkerDetailPage() {
  const { prokerId } = Route.useParams();
  const { data: user } = useCurrentUser();
  const qc = useQueryClient();

  // 1. Fetch Proker Detail
  const { data: proker, isLoading: isLoadingProker } = useQuery({
    queryKey: ["proker", prokerId],
    queryFn: async () => {
      const { data, error } = await supabase
        .from("prokers")
        .select("*, divisions(id, code, name)")
        .eq("id", prokerId)
        .single();
      if (error) throw error;
      return data;
    },
    enabled: !!prokerId,
  });

  // 2. Fetch Assignments
  const { data: assignments, isLoading: isLoadingAssignments } = useQuery({
    queryKey: ["proker_assignments", prokerId],
    queryFn: async () => {
      const { data, error } = await supabase
        .from("proker_assignments")
        .select(
          "*, profiles:profile_id(id, full_name, avatar_url, division_id, divisions(code, name))",
        )
        .eq("proker_id", prokerId);
      if (error) throw error;
      return data ?? [];
    },
    enabled: !!prokerId,
  });

  // 3. Fetch Proker Meetings
  const { data: meetings, isLoading: isLoadingMeetings } = useQuery({
    queryKey: ["proker_meetings", prokerId],
    queryFn: async () => {
      const { data, error } = await supabase
        .from("meetings")
        .select("*, attendance(count)")
        .eq("proker_id", prokerId)
        .order("meeting_date", { ascending: false });
      if (error) throw error;
      return data ?? [];
    },
    enabled: !!prokerId,
  });

  // 4. Fetch All Profiles (for assigning members)
  const { data: allProfiles } = useQuery({
    queryKey: ["all_profiles"],
    queryFn: async () => {
      const { data, error } = await supabase
        .from("profiles")
        .select("id, full_name, avatar_url, division_id, divisions(code, name)")
        .order("full_name");
      if (error) throw error;
      return data ?? [];
    },
  });

  // Check if current user is Ketuplak
  const isKetuplak = (assignments ?? []).some(
    (a: any) => a.role_type === "ketua_pelaksana" && a.profile_id === user?.userId,
  );
  const isBphOrHr = user?.roles.some((r) => r === "hr_admin" || r === "bph");
  const isKadiv = user?.roles.includes("kadiv") && proker?.division_id === user.profile?.division_id;
  const canManage = isBphOrHr || isKadiv || isKetuplak;

  // Status Change Mutation
  const updateStatusMut = useMutation({
    mutationFn: async (newStatus: string) => {
      const { error } = await supabase
        .from("prokers")
        .update({ status: newStatus as any })
        .eq("id", prokerId);
      if (error) throw error;
    },
    onSuccess: () => {
      toast.success("Status proker berhasil diperbarui");
      qc.invalidateQueries({ queryKey: ["proker", prokerId] });
      qc.invalidateQueries({ queryKey: ["prokers"] });
    },
    onError: (e: Error) => toast.error(e.message),
  });

  // Assign Core Role Mutation
  const assignCoreMut = useMutation({
    mutationFn: async ({ roleType, profileId }: { roleType: string; profileId: string }) => {
      // Remove existing core assignment for this role if any
      await supabase
        .from("proker_assignments")
        .delete()
        .eq("proker_id", prokerId)
        .eq("role_type", roleType as any);

      // Insert new core assignment
      const { error } = await supabase.from("proker_assignments").insert({
        proker_id: prokerId,
        profile_id: profileId,
        role_type: roleType as any,
      });
      if (error) throw error;
    },
    onSuccess: () => {
      toast.success("Panitia inti berhasil diperbarui");
      qc.invalidateQueries({ queryKey: ["proker_assignments", prokerId] });
      qc.invalidateQueries({ queryKey: ["prokers"] });
    },
    onError: (e: Error) => toast.error(e.message),
  });

  // Remove Assignment Mutation
  const removeAssignMut = useMutation({
    mutationFn: async (assignmentId: string) => {
      const { error } = await supabase.from("proker_assignments").delete().eq("id", assignmentId);
      if (error) throw error;
    },
    onSuccess: () => {
      toast.success("Penugasan dihapus");
      qc.invalidateQueries({ queryKey: ["proker_assignments", prokerId] });
      qc.invalidateQueries({ queryKey: ["prokers"] });
    },
    onError: (e: Error) => toast.error(e.message),
  });

  if (isLoadingProker)
    return <p className="text-sm text-muted-foreground">Memuat detail proker...</p>;
  if (!proker)
    return <p className="text-sm text-muted-foreground">Program Kerja tidak ditemukan.</p>;

  const currentStatusConfig = STATUS_MAP[proker.status] ?? { label: proker.status, className: "" };
  const koordinatorList = (assignments ?? []).filter((a: any) => a.role_type === "koordinator");

  return (
    <div className="space-y-6">
      {/* Back Button & Header */}
      <div>
        <Link
          to="/prokers"
          className="inline-flex items-center gap-1.5 text-xs text-muted-foreground hover:text-primary mb-3"
        >
          <ArrowLeft className="h-3.5 w-3.5" /> Kembali ke Daftar Proker
        </Link>
        <div className="flex flex-col gap-4 md:flex-row md:items-center md:justify-between">
          <div>
            <div className="flex items-center gap-2 mb-1">
              <Badge variant="outline" className="font-semibold">
                {proker.divisions?.name ?? "Lintas Divisi"}
              </Badge>
              <span
                className={`inline-flex items-center rounded-full px-2.5 py-0.5 text-xs font-semibold ${currentStatusConfig.className}`}
              >
                {currentStatusConfig.label}
              </span>
            </div>
            <h1 className="text-2xl font-bold">{proker.name}</h1>
            {proker.description && (
              <p className="text-sm text-muted-foreground mt-1 max-w-2xl">{proker.description}</p>
            )}
          </div>

          {/* Change Status Dropdown */}
          {canManage && (
            <div className="flex items-center gap-2 shrink-0">
              <span className="text-xs font-medium text-muted-foreground">Ubah Status:</span>
              <Select value={proker.status} onValueChange={(val) => updateStatusMut.mutate(val)}>
                <SelectTrigger className="w-40 h-9 text-xs">
                  <SelectValue />
                </SelectTrigger>
                <SelectContent>
                  {Object.entries(STATUS_MAP).map(([key, item]) => (
                    <SelectItem key={key} value={key} className="text-xs">
                      {item.label}
                    </SelectItem>
                  ))}
                </SelectContent>
              </Select>
            </div>
          )}
        </div>
      </div>

      {/* SECTION 1: Dewan Kegiatan */}
      <Card>
        <CardHeader>
          <CardTitle className="text-lg flex items-center gap-2">
            <ShieldCheck className="h-5 w-5 text-primary" /> Dewan Kegiatan
          </CardTitle>
          <CardDescription className="text-xs">
            3 posisi utama penanggung jawab kegiatan. Ketua Pelaksana memiliki hak mengelola
            kepanitiaan.
          </CardDescription>
        </CardHeader>
        <CardContent>
          <div className="grid gap-4 sm:grid-cols-3">
            {CORE_ROLES.map((role) => {
              const currentAssign = (assignments ?? []).find((a: any) => a.role_type === role.type);
              const assignedProfile = currentAssign?.profiles;

              return (
                <div
                  key={role.type}
                  className={`rounded-xl border p-4 flex flex-col justify-between ${role.tone}`}
                >
                  <div>
                    <span className="text-xs font-bold uppercase tracking-wider text-muted-foreground">
                      {role.label}
                    </span>
                    {assignedProfile ? (
                      <div className="flex items-center gap-3 mt-3">
                        <Avatar className="h-10 w-10">
                          <AvatarImage src={assignedProfile.avatar_url ?? undefined} />
                          <AvatarFallback>
                            {(assignedProfile.full_name ?? "?").slice(0, 2).toUpperCase()}
                          </AvatarFallback>
                        </Avatar>
                        <div className="min-w-0 flex-1">
                          <p className="font-semibold text-sm truncate">
                            {assignedProfile.full_name}
                          </p>
                          <p className="text-xs text-muted-foreground truncate">
                            {assignedProfile.divisions?.code
                              ? `Divisi ${assignedProfile.divisions.code}`
                              : "Tanpa Divisi"}
                          </p>
                        </div>
                      </div>
                    ) : (
                      <p className="text-xs italic text-muted-foreground mt-3">Belum ditentukan</p>
                    )}
                  </div>

                  {canManage && (
                    <div className="mt-4 pt-3 border-t flex justify-end">
                      <AssignCoreDialog
                        roleType={role.type}
                        roleLabel={role.label}
                        prokerDivisionId={proker.division_id}
                        allProfiles={allProfiles ?? []}
                        currentProfileId={assignedProfile?.id}
                        onAssign={(profileId) =>
                          assignCoreMut.mutate({ roleType: role.type, profileId })
                        }
                        onRemove={() => currentAssign && removeAssignMut.mutate(currentAssign.id)}
                      />
                    </div>
                  )}
                </div>
              );
            })}
          </div>
        </CardContent>
      </Card>

      {/* SECTION 2: Koordinator / Seksi */}
      <Card>
        <CardHeader className="flex flex-row items-center justify-between">
          <div>
            <CardTitle className="text-lg flex items-center gap-2">
              <Users className="h-5 w-5 text-primary" /> Koordinator Seksi
            </CardTitle>
            <CardDescription className="text-xs">
              Koordinator tiap bidang yang bisa diisi oleh anggota dari divisi manapun.
            </CardDescription>
          </div>
          {canManage && (
            <AddCoordinatorDialog
              prokerDivisionId={proker.division_id}
              allProfiles={allProfiles ?? []}
              prokerId={prokerId}
            />
          )}
        </CardHeader>
        <CardContent>
          <SeksiList 
            assignments={assignments} 
            canManage={canManage} 
            allProfiles={allProfiles ?? []} 
            prokerId={prokerId} 
            prokerDivisionId={proker.division_id}
            user={user}
            removeAssignMut={removeAssignMut}
          />
        </CardContent>
      </Card>

      {/* SECTION 3: Rapat Proker */}
      <Card>
        <CardHeader className="flex flex-row items-center justify-between">
          <div>
            <CardTitle className="text-lg flex items-center gap-2">
              <CalendarDays className="h-5 w-5 text-primary" /> Rapat & Kegiatan Proker
            </CardTitle>
            <CardDescription className="text-xs">
              Sesi rapat persiapan (Rapat 1/2/3) dan hari pelaksanaan untuk proker ini.
            </CardDescription>
          </div>
          {canManage && (
            <CreateProkerMeetingDialog
              prokerId={prokerId}
              prokerName={proker.name}
              prokerStatus={proker.status}
              divisionId={proker.division_id}
              userId={user?.userId ?? ""}
            />
          )}
        </CardHeader>
        <CardContent>
          {(meetings ?? []).length === 0 ? (
            <p className="text-center py-6 text-xs text-muted-foreground">
              Belum ada sesi rapat yang dibuat untuk proker ini.
            </p>
          ) : (
            <div className="space-y-3">
              {(meetings ?? []).map((m: any) => (
                <div
                  key={m.id}
                  className="flex flex-col sm:flex-row sm:items-center justify-between gap-3 rounded-lg border p-4 hover:bg-muted/30 transition"
                >
                  <div className="flex items-start gap-3">
                    <div className="grid h-10 w-10 shrink-0 place-items-center rounded-lg bg-primary/10 text-primary">
                      <CalendarDays className="h-5 w-5" />
                    </div>
                    <div>
                      <div className="flex items-center gap-2">
                        <Badge variant="secondary" className="text-[11px] capitalize">
                          {m.meeting_type?.replace("_", " ") ?? "Umum"}
                        </Badge>
                        <span className="font-semibold text-sm">{m.title}</span>
                      </div>
                      <p className="text-xs text-muted-foreground mt-1">
                        {m.meeting_date} · Waktu: {m.start_time?.slice(0, 5)} WIB (Toleransi{" "}
                        {m.grace_minutes} menit)
                      </p>
                    </div>
                  </div>

                  <div className="flex items-center gap-3 self-end sm:self-center">
                    <Badge variant="outline" className="gap-1 text-xs">
                      <Users className="h-3.5 w-3.5" /> Hadir:{" "}
                      <b>{m.attendance?.[0]?.count ?? 0}</b>
                    </Badge>
                    <Button variant="ghost" size="sm" asChild className="gap-1 text-xs">
                      <Link to="/meetings">
                        Ke Absensi <ChevronRight className="h-3.5 w-3.5" />
                      </Link>
                    </Button>
                  </div>
                </div>
              ))}
            </div>
          )}
        </CardContent>
      </Card>
    </div>
  );
}

// Dialog: Assign / Ubah Core Role
function AssignCoreDialog({
  roleType,
  roleLabel,
  prokerDivisionId,
  allProfiles,
  currentProfileId,
  onAssign,
  onRemove,
}: {
  roleType: string;
  roleLabel: string;
  prokerDivisionId: string | null;
  allProfiles: any[];
  currentProfileId?: string;
  onAssign: (profileId: string) => void;
  onRemove: () => void;
}) {
  const [open, setOpen] = useState(false);
  const [selectedId, setSelectedId] = useState<string>(currentProfileId ?? "");
  const [filterDiv, setFilterDiv] = useState<boolean>(true);

  const displayedProfiles =
    filterDiv && prokerDivisionId
      ? allProfiles.filter((p) => p.division_id === prokerDivisionId)
      : allProfiles;

  return (
    <Dialog open={open} onOpenChange={setOpen}>
      <DialogTrigger asChild>
        <Button variant="outline" size="sm" className="h-8 text-xs gap-1.5">
          <UserPlus className="h-3.5 w-3.5" />
          {currentProfileId ? "Ganti" : "Pilih Anggota"}
        </Button>
      </DialogTrigger>
      <DialogContent className="max-w-md">
        <DialogHeader>
          <DialogTitle>Assign {roleLabel}</DialogTitle>
        </DialogHeader>
        <div className="space-y-4 pt-2">
          {prokerDivisionId && (
            <div className="flex items-center justify-between rounded-md bg-muted/40 p-2 text-xs">
              <span className="text-muted-foreground">Filter Anggota Divisi Penyelenggara</span>
              <Button
                variant="ghost"
                size="sm"
                className="h-6 text-[11px]"
                onClick={() => setFilterDiv(!filterDiv)}
              >
                {filterDiv ? "Tampilkan Semua Divisi" : "Filter Divisi Ini Saja"}
              </Button>
            </div>
          )}

          <div className="space-y-1.5">
            <Label>Pilih Anggota</Label>
            <Select value={selectedId} onValueChange={setSelectedId}>
              <SelectTrigger>
                <SelectValue placeholder="Cari / Pilih Anggota" />
              </SelectTrigger>
              <SelectContent className="max-h-60">
                {displayedProfiles.map((p) => (
                  <SelectItem key={p.id} value={p.id}>
                    {p.full_name} {p.divisions?.code ? `(${p.divisions.code})` : ""}
                  </SelectItem>
                ))}
              </SelectContent>
            </Select>
          </div>

          <DialogFooter className="pt-2 flex items-center justify-between sm:justify-between">
            {currentProfileId ? (
              <Button
                type="button"
                variant="ghost"
                size="sm"
                className="text-destructive text-xs"
                onClick={() => {
                  onRemove();
                  setOpen(false);
                }}
              >
                Kosongkan Posisi
              </Button>
            ) : (
              <div />
            )}
            <div className="flex items-center gap-2">
              <Button type="button" variant="outline" size="sm" onClick={() => setOpen(false)}>
                Batal
              </Button>
              <Button
                type="button"
                size="sm"
                disabled={!selectedId}
                onClick={() => {
                  onAssign(selectedId);
                  setOpen(false);
                }}
              >
                Simpan
              </Button>
            </div>
          </DialogFooter>
        </div>
      </DialogContent>
    </Dialog>
  );
}

// Dialog: Tambah Koordinator Seksi
function AddCoordinatorDialog({
  prokerDivisionId,
  allProfiles,
  prokerId,
}: {
  prokerDivisionId: string | null;
  allProfiles: any[];
  prokerId: string;
}) {
  const [open, setOpen] = useState(false);
  const [seksiName, setSeksiName] = useState("");
  const [profileId, setProfileId] = useState("");
  const qc = useQueryClient();

  const addMut = useMutation({
    mutationFn: async () => {
      if (!seksiName.trim()) throw new Error("Nama seksi wajib diisi");
      if (!profileId) throw new Error("Anggota koordinator wajib dipilih");

      const { error } = await supabase.from("proker_assignments").insert({
        proker_id: prokerId,
        profile_id: profileId,
        role_type: "koordinator",
        seksi_name: seksiName.trim(),
      });
      if (error) throw error;
    },
    onSuccess: () => {
      toast.success("Koordinator seksi berhasil ditambahkan");
      setOpen(false);
      setSeksiName("");
      setProfileId("");
      qc.invalidateQueries({ queryKey: ["proker_assignments", prokerId] });
      qc.invalidateQueries({ queryKey: ["prokers"] });
    },
    onError: (e: Error) => toast.error(e.message),
  });

  return (
    <Dialog open={open} onOpenChange={setOpen}>
      <DialogTrigger asChild>
        <Button variant="outline" size="sm" className="gap-1.5 text-xs">
          <Plus className="h-3.5 w-3.5" /> Tambah Koordinator
        </Button>
      </DialogTrigger>
      <DialogContent className="max-w-md">
        <DialogHeader>
          <DialogTitle>Tambah Koordinator Seksi</DialogTitle>
        </DialogHeader>
        <form
          onSubmit={(e) => {
            e.preventDefault();
            addMut.mutate();
          }}
          className="space-y-4 pt-2"
        >
          <div className="space-y-1.5">
            <Label htmlFor="seksi-name">Nama Seksi / Bidang *</Label>
            <Input
              id="seksi-name"
              placeholder="Contoh: Acara / Humas / PDD / Perlengkapan"
              value={seksiName}
              onChange={(e) => setSeksiName(e.target.value)}
              required
            />
            <div className="flex flex-wrap gap-1 mt-1.5">
              {COMMON_SEKSI_SUGGESTIONS.map((s) => (
                <button
                  type="button"
                  key={s}
                  onClick={() => setSeksiName(s)}
                  className="rounded bg-muted px-1.5 py-0.5 text-[10px] text-muted-foreground hover:bg-primary/10 hover:text-primary transition"
                >
                  {s}
                </button>
              ))}
            </div>
          </div>

          <div className="space-y-1.5">
            <Label htmlFor="coord-profile">Pilih Koordinator (Bisa dari Divisi Manapun) *</Label>
            <Select value={profileId} onValueChange={setProfileId}>
              <SelectTrigger id="coord-profile">
                <SelectValue placeholder="Pilih Anggota" />
              </SelectTrigger>
              <SelectContent className="max-h-60">
                {allProfiles.map((p) => (
                  <SelectItem key={p.id} value={p.id}>
                    {p.full_name} {p.divisions?.code ? `(${p.divisions.code})` : ""}
                  </SelectItem>
                ))}
              </SelectContent>
            </Select>
          </div>

          <DialogFooter className="pt-2">
            <Button type="button" variant="outline" onClick={() => setOpen(false)}>
              Batal
            </Button>
            <Button type="submit" disabled={addMut.isPending}>
              {addMut.isPending ? "Menyimpan..." : "Tambah Koordinator"}
            </Button>
          </DialogFooter>
        </form>
      </DialogContent>
    </Dialog>
  );
}

// Dialog: Buat Rapat Proker
function CreateProkerMeetingDialog({
  prokerId,
  prokerName,
  prokerStatus,
  divisionId,
  userId,
}: {
  prokerId: string;
  prokerName: string;
  prokerStatus: string;
  divisionId: string | null;
  userId: string;
}) {
  const [open, setOpen] = useState(false);
  const [title, setTitle] = useState("");
  const [meetingDate, setMeetingDate] = useState("");
  const [startTime, setStartTime] = useState("13:00");
  const [graceMinutes, setGraceMinutes] = useState(15);
  const [meetingType, setMeetingType] = useState<string>(
    ["rapat_1", "rapat_2", "rapat_3", "pelaksanaan"].includes(prokerStatus)
      ? prokerStatus
      : "rapat_1",
  );
  const qc = useQueryClient();

  const createMut = useMutation({
    mutationFn: async () => {
      if (!title.trim()) throw new Error("Judul rapat wajib diisi");
      if (!meetingDate) throw new Error("Tanggal rapat wajib diisi");

      const { error } = await supabase.from("meetings").insert({
        title: title.trim(),
        meeting_date: meetingDate,
        start_time: startTime,
        grace_minutes: graceMinutes,
        proker_id: prokerId,
        meeting_type: meetingType,
        division_id: divisionId,
        created_by: userId,
      });
      if (error) throw error;
    },
    onSuccess: () => {
      toast.success("Rapat proker berhasil dibuat");
      setOpen(false);
      setTitle("");
      setMeetingDate("");
      qc.invalidateQueries({ queryKey: ["proker_meetings", prokerId] });
      qc.invalidateQueries({ queryKey: ["meetings"] });
    },
    onError: (e: Error) => toast.error(e.message),
  });

  return (
    <Dialog open={open} onOpenChange={setOpen}>
      <DialogTrigger asChild>
        <Button className="gap-1.5 text-xs">
          <Plus className="h-3.5 w-3.5" /> Buat Rapat Proker
        </Button>
      </DialogTrigger>
      <DialogContent className="max-w-md">
        <DialogHeader>
          <DialogTitle>Buat Rapat Proker — {prokerName}</DialogTitle>
        </DialogHeader>
        <form
          onSubmit={(e) => {
            e.preventDefault();
            createMut.mutate();
          }}
          className="space-y-4 pt-2"
        >
          <div className="space-y-1.5">
            <Label htmlFor="m-type">Tahap Rapat / Jenis Kegiatan</Label>
            <Select value={meetingType} onValueChange={setMeetingType}>
              <SelectTrigger id="m-type">
                <SelectValue />
              </SelectTrigger>
              <SelectContent>
                <SelectItem value="rapat_1">Rapat 1 (Perencanaan & Pembagian Tugas)</SelectItem>
                <SelectItem value="rapat_2">Rapat 2 (Progress & Checkpoint)</SelectItem>
                <SelectItem value="rapat_3">Rapat 3 (Gladi / Final Preparation)</SelectItem>
                <SelectItem value="pelaksanaan">Pelaksanaan (Hari H)</SelectItem>
                <SelectItem value="umum">Rapat Umum / Evaluasi</SelectItem>
              </SelectContent>
            </Select>
          </div>

          <div className="space-y-1.5">
            <Label htmlFor="m-title">Judul Sesi Rapat / Kegiatan *</Label>
            <Input
              id="m-title"
              placeholder={`Contoh: ${meetingType === "pelaksanaan" ? "Pelaksanaan Event" : "Rapat 1 Pembentukan Panitia"}`}
              value={title}
              onChange={(e) => setTitle(e.target.value)}
              required
            />
          </div>

          <div className="grid grid-cols-2 gap-3">
            <div className="space-y-1.5">
              <Label htmlFor="m-date">Tanggal *</Label>
              <Input
                id="m-date"
                type="date"
                value={meetingDate}
                onChange={(e) => setMeetingDate(e.target.value)}
                required
              />
            </div>
            <div className="space-y-1.5">
              <Label htmlFor="m-time">Waktu Mulai *</Label>
              <Input
                id="m-time"
                type="time"
                value={startTime}
                onChange={(e) => setStartTime(e.target.value)}
                required
              />
            </div>
          </div>

          <div className="space-y-1.5">
            <Label htmlFor="m-grace">Toleransi Keterlambatan (menit)</Label>
            <Input
              id="m-grace"
              type="number"
              min={0}
              max={120}
              value={graceMinutes}
              onChange={(e) => setGraceMinutes(Number(e.target.value))}
            />
          </div>

          <DialogFooter className="pt-2">
            <Button type="button" variant="outline" onClick={() => setOpen(false)}>
              Batal
            </Button>
            <Button type="submit" disabled={createMut.isPending}>
              {createMut.isPending ? "Menyimpan..." : "Buat Sesi Rapat"}
            </Button>
          </DialogFooter>
        </form>
      </DialogContent>
    </Dialog>
  );
}


function SeksiList({ assignments, canManage, allProfiles, prokerId, prokerDivisionId, user, removeAssignMut }: any) {
  const seksiNames = Array.from(new Set((assignments ?? []).filter((a: any) => a.seksi_name).map((a: any) => a.seksi_name))) as string[];
  const [selectedSeksi, setSelectedSeksi] = useState<string | null>(null);

  if (seksiNames.length === 0) {
    return (
      <p className="text-center py-6 text-xs text-muted-foreground">
        Belum ada seksi yang ditambahkan.
      </p>
    );
  }

  return (
    <>
      <div className="grid gap-3 sm:grid-cols-2 lg:grid-cols-3">
        {seksiNames.map((seksi) => {
          const koordinator = assignments.find((a: any) => a.seksi_name === seksi && a.role_type === "koordinator");
          const anggotaCount = assignments.filter((a: any) => a.seksi_name === seksi && a.role_type === "anggota").length;
          
          return (
            <div
              key={seksi}
              className="flex items-center justify-between rounded-lg border p-3 bg-card hover:border-primary/50 cursor-pointer transition-colors"
              onClick={() => setSelectedSeksi(seksi)}
            >
              <div className="flex items-center gap-3 min-w-0">
                <Avatar className="h-9 w-9">
                  <AvatarImage src={koordinator?.profiles?.avatar_url ?? undefined} />
                  <AvatarFallback>
                    {(koordinator?.profiles?.full_name ?? seksi).slice(0, 2).toUpperCase()}
                  </AvatarFallback>
                </Avatar>
                <div className="min-w-0">
                  <p className="text-xs font-bold text-primary truncate">
                    {seksi}
                  </p>
                  <p className="text-sm font-medium truncate">
                    {koordinator?.profiles?.full_name ?? "Tanpa Koordinator"}
                  </p>
                  <p className="text-[10px] text-muted-foreground">
                    {anggotaCount} Anggota
                  </p>
                </div>
              </div>
              <ChevronRight className="h-4 w-4 text-muted-foreground shrink-0" />
            </div>
          );
        })}
      </div>
      {selectedSeksi && (
        <SeksiDetailDialog
          seksiName={selectedSeksi}
          isOpen={!!selectedSeksi}
          onOpenChange={(open) => !open && setSelectedSeksi(null)}
          prokerId={prokerId}
          assignments={assignments}
          allProfiles={allProfiles}
          canManage={canManage}
          user={user}
          removeAssignMut={removeAssignMut}
        />
      )}
    </>
  );
}

function SeksiDetailDialog({
  seksiName,
  isOpen,
  onOpenChange,
  prokerId,
  assignments,
  allProfiles,
  canManage,
  user,
  removeAssignMut,
}: any) {
  const qc = useQueryClient();
  const seksiAssigns = assignments.filter((a: any) => a.seksi_name === seksiName);
  const koordinator = seksiAssigns.find((a: any) => a.role_type === "koordinator");
  const anggotaList = seksiAssigns.filter((a: any) => a.role_type === "anggota");

  // Fetch Jobdesks for this seksi
  const { data: jobdesks, isLoading: isLoadingJobs } = useQuery({
    queryKey: ["seksi_jobdesks", prokerId, seksiName],
    queryFn: async () => {
      const { data } = await supabase
        .from("jobdesks")
        .select("*, profiles(full_name, avatar_url)")
        .eq("proker_id", prokerId)
        .eq("seksi_name", seksiName)
        .order("created_at", { ascending: false });
      return data ?? [];
    },
    enabled: isOpen,
  });

  const isKoordinatorOfThisSeksi = koordinator?.profile_id === user?.userId;
  const canManageSeksi = canManage || isKoordinatorOfThisSeksi;

  return (
    <Dialog open={isOpen} onOpenChange={onOpenChange}>
      <DialogContent className="max-w-2xl h-[80vh] flex flex-col p-0 overflow-hidden">
        <DialogHeader className="px-6 py-4 border-b shrink-0">
          <DialogTitle className="text-xl flex items-center gap-2">
            <Users className="h-5 w-5 text-primary" /> Seksi {seksiName}
          </DialogTitle>
        </DialogHeader>

        <div className="flex-1 overflow-y-auto px-6 py-4">
          <Tabs defaultValue="anggota" className="w-full">
            <TabsList className="mb-4">
              <TabsTrigger value="anggota">Anggota</TabsTrigger>
              <TabsTrigger value="jobdesk">Jobdesk Seksi</TabsTrigger>
            </TabsList>

            <TabsContent value="anggota" className="space-y-4">
              <div className="flex items-center justify-between">
                <h3 className="font-semibold text-sm">Koordinator</h3>
              </div>
              {koordinator ? (
                <div className="flex items-center justify-between rounded-lg border p-3 bg-card">
                  <div className="flex items-center gap-3">
                    <Avatar className="h-9 w-9">
                      <AvatarImage src={koordinator.profiles?.avatar_url ?? undefined} />
                      <AvatarFallback>
                        {(koordinator.profiles?.full_name ?? "?").slice(0, 2).toUpperCase()}
                      </AvatarFallback>
                    </Avatar>
                    <div>
                      <p className="text-sm font-medium">{koordinator.profiles?.full_name}</p>
                      <Badge variant="outline" className="text-[10px] mt-0.5">
                        {koordinator.profiles?.divisions?.code ?? "Lintas Divisi"}
                      </Badge>
                    </div>
                  </div>
                  {canManage && (
                    <Button
                      variant="ghost" size="sm" className="h-8 w-8 p-0 text-muted-foreground hover:text-destructive"
                      onClick={() => removeAssignMut.mutate(koordinator.id)}
                    >
                      <Trash2 className="h-4 w-4" />
                    </Button>
                  )}
                </div>
              ) : (
                <p className="text-xs text-muted-foreground italic">Belum ada koordinator.</p>
              )}

              <div className="flex items-center justify-between mt-6">
                <h3 className="font-semibold text-sm">Anggota Seksi</h3>
                {canManageSeksi && (
                  <AddAnggotaSeksiDialog
                    seksiName={seksiName}
                    prokerId={prokerId}
                    allProfiles={allProfiles}
                  />
                )}
              </div>
              {anggotaList.length === 0 ? (
                <p className="text-xs text-muted-foreground italic">Belum ada anggota.</p>
              ) : (
                <div className="grid gap-2">
                  {anggotaList.map((item: any) => (
                    <div key={item.id} className="flex items-center justify-between rounded-lg border p-3 bg-card">
                      <div className="flex items-center gap-3">
                        <Avatar className="h-8 w-8">
                          <AvatarImage src={item.profiles?.avatar_url ?? undefined} />
                          <AvatarFallback>
                            {(item.profiles?.full_name ?? "?").slice(0, 2).toUpperCase()}
                          </AvatarFallback>
                        </Avatar>
                        <div>
                          <p className="text-sm font-medium">{item.profiles?.full_name}</p>
                        </div>
                      </div>
                      {canManageSeksi && (
                        <Button
                          variant="ghost" size="sm" className="h-8 w-8 p-0 text-muted-foreground hover:text-destructive"
                          onClick={() => removeAssignMut.mutate(item.id)}
                        >
                          <Trash2 className="h-4 w-4" />
                        </Button>
                      )}
                    </div>
                  ))}
                </div>
              )}
            </TabsContent>

            <TabsContent value="jobdesk" className="space-y-4">
              <div className="flex items-center justify-between">
                <h3 className="font-semibold text-sm">Jobdesk Seksi</h3>
                {canManageSeksi && (
                  <AssignJobdeskDialog
                    prokerId={prokerId}
                    seksiName={seksiName}
                    anggotaList={[...(koordinator ? [koordinator] : []), ...anggotaList]}
                    userId={user?.userId}
                  />
                )}
              </div>
              
              {isLoadingJobs ? (
                <p className="text-xs text-muted-foreground">Memuat jobdesk...</p>
              ) : (jobdesks ?? []).length === 0 ? (
                <p className="text-xs text-muted-foreground italic">Belum ada jobdesk untuk seksi ini.</p>
              ) : (
                <div className="grid gap-3">
                  {(jobdesks ?? []).map((j: any) => (
                    <Card key={j.id} className="p-3">
                      <div className="flex flex-col gap-2">
                        <div className="flex items-start justify-between">
                          <div>
                            <p className="font-semibold text-sm flex items-center gap-1.5">
                              <Briefcase className="h-4 w-4 text-primary" /> {j.title}
                            </p>
                            <p className="text-xs text-muted-foreground mt-1">Ditugaskan kepada: {j.profiles?.full_name}</p>
                          </div>
                          <Badge variant="outline" className={j.status === "ditugaskan" ? "bg-secondary text-secondary-foreground" : j.status === "diajukan" ? "bg-accent text-accent-foreground" : j.status === "disetujui" ? "bg-success text-success-foreground" : "bg-destructive text-destructive-foreground"}>
                            {j.status}
                          </Badge>
                        </div>
                        {j.description && <p className="text-xs text-muted-foreground">{j.description}</p>}
                        {j.status === "ditugaskan" && j.profile_id === user?.userId && (
                          <div className="mt-2 flex justify-end">
                            <Button size="sm" asChild>
                              <Link to="/jobdesk">Ke Halaman Jobdesk</Link>
                            </Button>
                          </div>
                        )}
                      </div>
                    </Card>
                  ))}
                </div>
              )}
            </TabsContent>
          </Tabs>
        </div>
      </DialogContent>
    </Dialog>
  );
}

function AddAnggotaSeksiDialog({ seksiName, prokerId, allProfiles }: any) {
  const [open, setOpen] = useState(false);
  const [profileId, setProfileId] = useState("");
  const qc = useQueryClient();

  const addMut = useMutation({
    mutationFn: async () => {
      if (!profileId) throw new Error("Pilih anggota");
      const { error } = await supabase.from("proker_assignments").insert({
        proker_id: prokerId,
        profile_id: profileId,
        role_type: "anggota",
        seksi_name: seksiName,
      });
      if (error) throw error;
    },
    onSuccess: () => {
      toast.success("Anggota berhasil ditambahkan");
      setOpen(false);
      setProfileId("");
      qc.invalidateQueries({ queryKey: ["proker_assignments", prokerId] });
    },
    onError: (e: Error) => toast.error(e.message),
  });

  return (
    <Dialog open={open} onOpenChange={setOpen}>
      <DialogTrigger asChild>
        <Button variant="outline" size="sm" className="gap-1.5 text-xs">
          <UserPlus className="h-3.5 w-3.5" /> Tambah Anggota
        </Button>
      </DialogTrigger>
      <DialogContent className="max-w-md">
        <DialogHeader>
          <DialogTitle>Tambah Anggota Seksi {seksiName}</DialogTitle>
        </DialogHeader>
        <div className="space-y-4 pt-2">
          <div className="space-y-1.5">
            <Label>Pilih Anggota</Label>
            <Select value={profileId} onValueChange={setProfileId}>
              <SelectTrigger>
                <SelectValue placeholder="Pilih anggota..." />
              </SelectTrigger>
              <SelectContent>
                {allProfiles.map((p: any) => (
                  <SelectItem key={p.id} value={p.id}>
                    {p.full_name} {p.divisions?.code ? `(${p.divisions.code})` : ""}
                  </SelectItem>
                ))}
              </SelectContent>
            </Select>
          </div>
        </div>
        <DialogFooter>
          <Button onClick={() => addMut.mutate()}>Tambah</Button>
        </DialogFooter>
      </DialogContent>
    </Dialog>
  );
}

function AssignJobdeskDialog({ prokerId, seksiName, anggotaList, userId }: any) {
  const [open, setOpen] = useState(false);
  const [title, setTitle] = useState("");
  const [desc, setDesc] = useState("");
  const [deadline, setDeadline] = useState("");
  const [profileId, setProfileId] = useState("");
  const qc = useQueryClient();

  const assignMut = useMutation({
    mutationFn: async () => {
      if (!title || !profileId) throw new Error("Judul dan anggota penerima wajib diisi");
      const { error } = await supabase.from("jobdesks").insert({
        proker_id: prokerId,
        seksi_name: seksiName,
        profile_id: profileId,
        title,
        description: desc,
        deadline: deadline || null,
        status: "ditugaskan",
      });
      if (error) throw error;
    },
    onSuccess: () => {
      toast.success("Jobdesk berhasil ditugaskan");
      setOpen(false);
      setTitle("");
      setDesc("");
      setDeadline("");
      setProfileId("");
      qc.invalidateQueries({ queryKey: ["seksi_jobdesks", prokerId, seksiName] });
      qc.invalidateQueries({ queryKey: ["jobdesks"] });
    },
    onError: (e: Error) => toast.error(e.message),
  });

  return (
    <Dialog open={open} onOpenChange={setOpen}>
      <DialogTrigger asChild>
        <Button size="sm" className="gap-1.5 text-xs">
          <Plus className="h-3.5 w-3.5" /> Tugaskan Jobdesk
        </Button>
      </DialogTrigger>
      <DialogContent className="max-w-md">
        <DialogHeader>
          <DialogTitle>Tugaskan Jobdesk Seksi</DialogTitle>
        </DialogHeader>
        <div className="space-y-3 pt-2">
          <div>
            <Label>Pilih Penerima Tugas</Label>
            <Select value={profileId} onValueChange={setProfileId}>
              <SelectTrigger>
                <SelectValue placeholder="Pilih anggota..." />
              </SelectTrigger>
              <SelectContent>
                {anggotaList.map((a: any) => (
                  <SelectItem key={a.profile_id} value={a.profile_id}>
                    {a.profiles?.full_name} ({a.role_type})
                  </SelectItem>
                ))}
              </SelectContent>
            </Select>
          </div>
          <div>
            <Label>Judul Tugas</Label>
            <Input value={title} onChange={(e) => setTitle(e.target.value)} />
          </div>
          <div>
            <Label>Deskripsi</Label>
            <Textarea value={desc} onChange={(e) => setDesc(e.target.value)} />
          </div>
          <div>
            <Label>Deadline</Label>
            <Input type="date" value={deadline} onChange={(e) => setDeadline(e.target.value)} />
          </div>
        </div>
        <DialogFooter>
          <Button onClick={() => assignMut.mutate()}>Tugaskan</Button>
        </DialogFooter>
      </DialogContent>
    </Dialog>
  );
}
