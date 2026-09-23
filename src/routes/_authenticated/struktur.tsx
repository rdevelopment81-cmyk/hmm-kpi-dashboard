import { createFileRoute } from "@tanstack/react-router";
import { useQuery } from "@tanstack/react-query";
import { supabase } from "@/integrations/supabase/client";
import { Avatar, AvatarFallback, AvatarImage } from "@/components/ui/avatar";
import { Card, CardContent } from "@/components/ui/card";
import { Users } from "lucide-react";

export const Route = createFileRoute("/_authenticated/struktur")({
  component: StrukturOrganisasiPage,
  head: () => ({ meta: [{ title: "Struktur Organisasi — HMM FEB UNPAK" }] }),
});

function OrgNode({
  name,
  jabatan,
  avatarUrl,
  isBph = false,
  isKadiv = false,
}: {
  name: string;
  jabatan: string;
  avatarUrl?: string | null;
  isBph?: boolean;
  isKadiv?: boolean;
}) {
  return (
    <div
      className={`relative flex w-48 flex-col items-center rounded-xl border p-4 text-center shadow-sm transition-all hover:shadow-md ${isBph ? "border-primary/50 bg-primary/5" : isKadiv ? "border-secondary/50 bg-secondary/5" : "bg-card"}`}
    >
      <Avatar className="mb-3 h-16 w-16 border-2 border-background shadow-sm">
        <AvatarImage src={avatarUrl ?? undefined} />
        <AvatarFallback>{name.slice(0, 2).toUpperCase()}</AvatarFallback>
      </Avatar>
      <p className="line-clamp-2 text-sm font-bold leading-tight">{name}</p>
      <p className="mt-1 text-xs font-medium text-muted-foreground">{jabatan}</p>
    </div>
  );
}

function EmptyOrgNode({
  jabatan,
  isBph = false,
  isKadiv = false,
}: {
  jabatan: string;
  isBph?: boolean;
  isKadiv?: boolean;
}) {
  return (
    <div
      className={`relative flex w-48 flex-col items-center rounded-xl border border-dashed p-4 text-center shadow-sm transition-all hover:shadow-md ${
        isBph
          ? "border-primary/40 bg-primary/5"
          : isKadiv
            ? "border-secondary/40 bg-secondary/5"
            : "border-muted bg-card/50"
      }`}
    >
      <div className="mb-3 flex h-16 w-16 items-center justify-center rounded-full border-2 border-dashed border-muted-foreground/30 bg-muted/20 text-muted-foreground">
        <Users className="h-8 w-8 text-muted-foreground/60" />
      </div>
      <p className="line-clamp-2 text-sm font-semibold leading-tight text-muted-foreground">
        Posisi Kosong
      </p>
      <p className="mt-1 text-xs font-medium text-muted-foreground/80">{jabatan}</p>
    </div>
  );
}

function StrukturOrganisasiPage() {
  const { data: divisions } = useQuery({
    queryKey: ["divisions"],
    queryFn: async () => {
      const { data } = await supabase.from("divisions").select("*").order("name");
      return data ?? [];
    },
  });

  const { data: orgData, isLoading } = useQuery({
    queryKey: ["orgStructure"],
    queryFn: async () => {
      const [{ data: profiles }, { data: roles }] = await Promise.all([
        supabase.from("profiles").select("*, divisions(name,code)"),
        supabase.from("user_roles").select("*"),
      ]);

      if (!profiles || !roles) return { bph: [], divisions: [] };

      const userRoles = roles.reduce((acc: any, curr: any) => {
        if (!acc[curr.user_id]) acc[curr.user_id] = [];
        acc[curr.user_id].push(curr.role);
        return acc;
      }, {});

      const bph: any[] = [];
      const divMap: Record<string, { kadiv: any[]; anggota: any[] }> = {};

      (divisions ?? []).forEach((d) => {
        const entry = { kadiv: [], anggota: [] };
        divMap[d.id] = entry;
        if (d.code) divMap[d.code.toUpperCase()] = entry;
      });

      profiles.forEach((p: any) => {
        const uRoles = userRoles[p.id] || [];
        const pDivCode = p.divisions?.code?.toUpperCase();
        const targetMap =
          (p.division_id && divMap[p.division_id]) || (pDivCode && divMap[pDivCode]);

        const isBphRole =
          uRoles.includes("bph") ||
          p.jabatan?.toLowerCase().includes("ketua") ||
          p.jabatan?.toLowerCase().includes("sekretaris") ||
          p.jabatan?.toLowerCase().includes("bendahara");
        const isRND = pDivCode === "RND" || p.divisions?.name?.toLowerCase().includes("research");
        const isKadivRole =
          uRoles.includes("kadiv") ||
          p.jabatan?.toLowerCase().includes("kepala") ||
          p.jabatan?.toLowerCase().includes("kadiv") ||
          (uRoles.includes("hr_admin") && isRND);

        if (isBphRole) {
          bph.push(p);
        } else if (isKadivRole && targetMap) {
          targetMap.kadiv.push(p);
        } else if (targetMap) {
          targetMap.anggota.push(p);
        }
      });

      // Sort BPH by custom priority
      const bphOrder = [
        "Ketua Umum",
        "Wakil Ketua Umum",
        "Sekretaris Umum 1",
        "Sekretaris Umum 2",
        "Bendahara Umum 1",
        "Bendahara Umum 2",
      ];
      bph.sort((a, b) => {
        const idxA = bphOrder.findIndex((o) => a.jabatan?.toLowerCase().includes(o.toLowerCase()));
        const idxB = bphOrder.findIndex((o) => b.jabatan?.toLowerCase().includes(o.toLowerCase()));
        return (idxA === -1 ? 99 : idxA) - (idxB === -1 ? 99 : idxB);
      });

      const structuredDivisions = (divisions ?? [])
        .filter((d) => d.code?.toUpperCase() !== "BPH" && d.name?.toUpperCase() !== "BPH")
        .map((d) => {
        const code = d.code?.toUpperCase() === "MEDIA" ? "MEDPUB" : d.code;
        return {
          ...d,
          code,
          kadiv: divMap[d.id].kadiv,
          anggota: divMap[d.id].anggota,
        };
      });

      return { bph, divisions: structuredDivisions };
    },
    enabled: !!divisions,
  });

  if (isLoading || !orgData) {
    return (
      <div className="p-8 text-center text-muted-foreground">Memuat struktur organisasi...</div>
    );
  }

  const bphList = orgData.bph || [];

  const ketua = bphList.find(
    (p) =>
      p.jabatan?.toLowerCase().includes("ketua umum") &&
      !p.jabatan?.toLowerCase().includes("wakil"),
  );

  const wakil1 = bphList.find(
    (p) =>
      p.jabatan?.toLowerCase().includes("wakil ketua umum") ||
      p.jabatan?.toLowerCase() === "wakil ketua umum",
  );
  const otherWakils = bphList.filter(
    (p) =>
      p.jabatan?.toLowerCase().includes("wakil") && p !== ketua && p !== wakil1,
  );
  const finalWakil1 = wakil1 || otherWakils[0];

  const sek1 = bphList.find(
    (p) =>
      p.jabatan?.toLowerCase().includes("sekretaris umum 1") ||
      p.jabatan?.toLowerCase().includes("sekretaris 1"),
  );
  const sek2 = bphList.find(
    (p) =>
      p.jabatan?.toLowerCase().includes("sekretaris umum 2") ||
      p.jabatan?.toLowerCase().includes("sekretaris 2"),
  );
  const otherSeks = bphList.filter(
    (p) => p.jabatan?.toLowerCase().includes("sekretaris") && p !== sek1 && p !== sek2,
  );
  const finalSek1 = sek1 || otherSeks[0];
  const finalSek2 = sek2 || otherSeks[1];

  const ben1 = bphList.find(
    (p) =>
      p.jabatan?.toLowerCase().includes("bendahara umum 1") ||
      p.jabatan?.toLowerCase().includes("bendahara 1"),
  );
  const ben2 = bphList.find(
    (p) =>
      p.jabatan?.toLowerCase().includes("bendahara umum 2") ||
      p.jabatan?.toLowerCase().includes("bendahara 2"),
  );
  const otherBens = bphList.filter(
    (p) => p.jabatan?.toLowerCase().includes("bendahara") && p !== ben1 && p !== ben2,
  );
  const finalBen1 = ben1 || otherBens[0];
  const finalBen2 = ben2 || otherBens[1];

  return (
    <div className="space-y-12 pb-16">
      <div className="text-center">
        <h1 className="text-3xl font-bold">Struktur Organisasi</h1>
        <p className="mt-2 text-muted-foreground">Himpunan Mahasiswa Manajemen FEB UNPAK</p>
      </div>

      <div className="overflow-x-auto pb-8">
        <div className="mx-auto flex min-w-max flex-col items-center">
          {/* BPH SECTION */}
          <div className="relative mb-16 flex flex-col items-center gap-8">
            <div className="mb-2 rounded-full bg-primary/10 px-5 py-1.5 text-sm font-semibold text-primary">
              Badan Pengurus Harian (BPH)
            </div>

            {/* KETUA */}
            <div className="relative z-10 flex flex-col items-center">
              {ketua ? (
                <OrgNode
                  name={ketua.full_name}
                  jabatan={ketua.jabatan || "Ketua Umum"}
                  avatarUrl={ketua.avatar_url}
                  isBph
                />
              ) : (
                <EmptyOrgNode jabatan="Ketua Umum" isBph />
              )}
              {/* Line from Ketum to the horizontal branch */}
              <div className="h-8 w-[2px] bg-border" />
            </div>

            {/* HORIZONTAL BRANCH (SEKUM - WAKETUM - BENDUM) */}
            <div className="relative flex w-full max-w-4xl justify-between">
              {/* SEKUM BRANCH */}
              <div className="relative flex flex-1 flex-col items-center pt-8">
                <div className="absolute top-0 right-0 h-[2px] w-[50%] bg-border" />
                <div className="absolute top-0 h-8 w-[2px] bg-border" />
                {finalSek1 ? (
                  <OrgNode
                    name={finalSek1.full_name}
                    jabatan={finalSek1.jabatan || "Sekretaris Umum 1"}
                    avatarUrl={finalSek1.avatar_url}
                    isBph
                  />
                ) : (
                  <EmptyOrgNode jabatan="Sekretaris Umum 1" isBph />
                )}
                <div className="h-6 w-[2px] bg-border" />
                {finalSek2 ? (
                  <OrgNode
                    name={finalSek2.full_name}
                    jabatan={finalSek2.jabatan || "Sekretaris Umum 2"}
                    avatarUrl={finalSek2.avatar_url}
                    isBph
                  />
                ) : (
                  <EmptyOrgNode jabatan="Sekretaris Umum 2" isBph />
                )}
              </div>

              {/* WAKETUM BRANCH */}
              <div className="relative flex flex-1 flex-col items-center pt-8">
                <div className="absolute top-0 right-0 left-0 h-[2px] bg-border" />
                <div className="absolute top-0 h-8 w-[2px] bg-border" />
                {finalWakil1 ? (
                  <OrgNode
                    name={finalWakil1.full_name}
                    jabatan={finalWakil1.jabatan || "Wakil Ketua Umum"}
                    avatarUrl={finalWakil1.avatar_url}
                    isBph
                  />
                ) : (
                  <EmptyOrgNode jabatan="Wakil Ketua Umum" isBph />
                )}
                {/* Line going straight down to Kadivs */}
                <div className="h-16 w-[2px] bg-border" />
              </div>

              {/* BENDUM BRANCH */}
              <div className="relative flex flex-1 flex-col items-center pt-8">
                <div className="absolute top-0 left-0 h-[2px] w-[50%] bg-border" />
                <div className="absolute top-0 h-8 w-[2px] bg-border" />
                {finalBen1 ? (
                  <OrgNode
                    name={finalBen1.full_name}
                    jabatan={finalBen1.jabatan || "Bendahara Umum"}
                    avatarUrl={finalBen1.avatar_url}
                    isBph
                  />
                ) : (
                  <EmptyOrgNode jabatan="Bendahara Umum" isBph />
                )}
                <div className="h-6 w-[2px] bg-border" />
                {finalBen2 ? (
                  <OrgNode
                    name={finalBen2.full_name}
                    jabatan={finalBen2.jabatan || "Wakil Bendahara Umum"}
                    avatarUrl={finalBen2.avatar_url}
                    isBph
                  />
                ) : (
                  <EmptyOrgNode jabatan="Wakil Bendahara Umum" isBph />
                )}
              </div>
            </div>
          </div>

          {/* DIVISIONS SECTION */}
          {orgData.divisions.length > 0 && (
            <div className="relative mt-0 flex w-full flex-col items-center">
              <div className="flex w-full justify-center gap-12 px-8">
                {orgData.divisions.map((div: any, idx: number, arr: any[]) => (
                  <div key={div.id} className="relative flex min-w-[200px] flex-col items-center pt-8">
                    {/* Horizontal Branch for Kadivs */}
                    {arr.length > 1 && (
                      <>
                        {idx === 0 && <div className="absolute top-0 right-0 h-[2px] w-[50%] bg-border" />}
                        {idx === arr.length - 1 && <div className="absolute top-0 left-0 h-[2px] w-[50%] bg-border" />}
                        {idx > 0 && idx < arr.length - 1 && <div className="absolute top-0 right-0 left-0 h-[2px] bg-border" />}
                      </>
                    )}
                    {/* Vertical line connecting up to the horizontal branch */}
                    <div className="absolute top-0 h-8 w-[2px] bg-border" />

                    <h3 className="mb-6 rounded-full bg-primary/10 px-4 py-1 text-sm font-semibold text-primary">
                      Divisi {div.code}
                    </h3>

                    {/* KADIV */}
                    <div className="mb-8 flex flex-col gap-4">
                      {div.kadiv.length > 0 ? (
                        div.kadiv.map((k: any) => (
                          <div key={k.id} className="relative flex flex-col items-center">
                            <OrgNode
                              name={k.full_name}
                              jabatan={
                                k.jabatan && !k.jabatan.toLowerCase().includes("anggota")
                                  ? k.jabatan
                                  : `Kepala Divisi ${div.code}`
                              }
                              avatarUrl={k.avatar_url}
                              isKadiv
                            />
                            <div className="absolute -bottom-8 h-8 w-[2px] bg-border" />
                          </div>
                        ))
                      ) : (
                        <div className="relative flex flex-col items-center">
                          <div className="flex w-48 flex-col items-center rounded-xl border border-dashed border-muted p-4 text-center">
                            <Users className="mb-2 h-8 w-8 text-muted" />
                            <p className="text-xs text-muted-foreground">Posisi Kosong</p>
                          </div>
                          <div className="absolute -bottom-8 h-8 w-[2px] border-l-2 border-dashed border-border" />
                        </div>
                      )}
                    </div>

                    {/* ANGGOTA */}
                    <div className="flex flex-col items-center gap-3">
                      <div className="h-[2px] w-full min-w-[120px] bg-border" />
                      {div.anggota.length > 0 ? (
                        div.anggota.map((a: any) => (
                          <div
                            key={a.id}
                            className="relative flex w-48 flex-col items-center rounded-xl border bg-card p-3 text-center shadow-sm"
                          >
                            <div className="absolute -top-3 z-0 h-3 w-[2px] bg-border" />
                            <Avatar className="mb-2 h-10 w-10">
                              <AvatarImage src={a.avatar_url ?? undefined} />
                              <AvatarFallback>
                                {a.full_name.slice(0, 2).toUpperCase()}
                              </AvatarFallback>
                            </Avatar>
                            <p className="line-clamp-1 text-xs font-semibold">{a.full_name}</p>
                            <p className="text-[10px] text-muted-foreground">
                              {a.jabatan || "Anggota"}
                            </p>
                          </div>
                        ))
                      ) : (
                        <p className="text-xs text-muted-foreground">Belum ada anggota</p>
                      )}
                    </div>
                  </div>
                ))}
              </div>
            </div>
          )}
        </div>
      </div>
    </div>
  );
}
