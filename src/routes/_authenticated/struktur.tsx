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
    <div className={`relative flex w-48 flex-col items-center rounded-xl border p-4 text-center shadow-sm transition-all hover:shadow-md ${isBph ? 'border-primary/50 bg-primary/5' : isKadiv ? 'border-secondary/50 bg-secondary/5' : 'bg-card'}`}>
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
      <p className="line-clamp-2 text-sm font-semibold leading-tight text-muted-foreground">Posisi Kosong</p>
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
        const targetMap = (p.division_id && divMap[p.division_id]) || (pDivCode && divMap[pDivCode]);

        const isBphRole = uRoles.includes("bph") || p.jabatan?.toLowerCase().includes("ketua") || p.jabatan?.toLowerCase().includes("sekretaris") || p.jabatan?.toLowerCase().includes("bendahara");
        const isRND = pDivCode === "RND" || p.divisions?.name?.toLowerCase().includes("research");
        const isKadivRole = uRoles.includes("kadiv") || p.jabatan?.toLowerCase().includes("kepala") || p.jabatan?.toLowerCase().includes("kadiv") || (uRoles.includes("hr_admin") && isRND);

        if (isBphRole) {
          bph.push(p);
        } else if (isKadivRole && targetMap) {
          targetMap.kadiv.push(p);
        } else if (targetMap) {
          targetMap.anggota.push(p);
        }
      });

      // Sort BPH by custom priority
      const bphOrder = ["Ketua Umum", "Wakil Ketua Umum 1", "Wakil Ketua Umum 2", "Sekretaris Umum 1", "Sekretaris Umum 2", "Bendahara Umum 1", "Bendahara Umum 2"];
      bph.sort((a, b) => {
        const idxA = bphOrder.findIndex(o => a.jabatan?.toLowerCase().includes(o.toLowerCase()));
        const idxB = bphOrder.findIndex(o => b.jabatan?.toLowerCase().includes(o.toLowerCase()));
        return (idxA === -1 ? 99 : idxA) - (idxB === -1 ? 99 : idxB);
      });

      const structuredDivisions = (divisions ?? []).map((d) => {
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
    return <div className="p-8 text-center text-muted-foreground">Memuat struktur organisasi...</div>;
  }

  const bphList = orgData.bph || [];
  
  const ketua = bphList.find(p => p.jabatan?.toLowerCase().includes("ketua umum") && !p.jabatan?.toLowerCase().includes("wakil"));
  
  const wakil1 = bphList.find(p => p.jabatan?.toLowerCase().includes("wakil ketua umum 1") || p.jabatan?.toLowerCase() === "wakil ketua umum 1");
  const wakil2 = bphList.find(p => p.jabatan?.toLowerCase().includes("wakil ketua umum 2") || p.jabatan?.toLowerCase() === "wakil ketua umum 2");
  const otherWakils = bphList.filter(p => p.jabatan?.toLowerCase().includes("wakil") && p !== ketua && p !== wakil1 && p !== wakil2);
  const finalWakil1 = wakil1 || otherWakils[0];
  const finalWakil2 = wakil2 || otherWakils[1];

  const sek1 = bphList.find(p => p.jabatan?.toLowerCase().includes("sekretaris umum 1") || p.jabatan?.toLowerCase().includes("sekretaris 1"));
  const sek2 = bphList.find(p => p.jabatan?.toLowerCase().includes("sekretaris umum 2") || p.jabatan?.toLowerCase().includes("sekretaris 2"));
  const otherSeks = bphList.filter(p => p.jabatan?.toLowerCase().includes("sekretaris") && p !== sek1 && p !== sek2);
  const finalSek1 = sek1 || otherSeks[0];
  const finalSek2 = sek2 || otherSeks[1];

  const ben1 = bphList.find(p => p.jabatan?.toLowerCase().includes("bendahara umum 1") || p.jabatan?.toLowerCase().includes("bendahara 1"));
  const ben2 = bphList.find(p => p.jabatan?.toLowerCase().includes("bendahara umum 2") || p.jabatan?.toLowerCase().includes("bendahara 2"));
  const otherBens = bphList.filter(p => p.jabatan?.toLowerCase().includes("bendahara") && p !== ben1 && p !== ben2);
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
            <div className="relative z-10">
              {ketua ? (
                <OrgNode name={ketua.full_name} jabatan={ketua.jabatan || "Ketua Umum"} avatarUrl={ketua.avatar_url} isBph />
              ) : (
                <EmptyOrgNode jabatan="Ketua Umum" isBph />
              )}
            </div>

            {/* CONNECTOR KETUA -> WAKILS */}
            <div className="h-6 w-[2px] bg-border" />
            
            {/* WAKILS */}
            <div className="relative z-10 flex gap-12">
              <div className="absolute -top-6 right-[25%] left-[25%] z-0 h-[2px] bg-border" />
              <div className="relative flex flex-col items-center">
                <div className="absolute -top-6 z-0 h-6 w-[2px] bg-border" />
                {finalWakil1 ? (
                  <OrgNode name={finalWakil1.full_name} jabatan={finalWakil1.jabatan || "Wakil Ketua Umum 1"} avatarUrl={finalWakil1.avatar_url} isBph />
                ) : (
                  <EmptyOrgNode jabatan="Wakil Ketua Umum 1" isBph />
                )}
              </div>
              <div className="relative flex flex-col items-center">
                <div className="absolute -top-6 z-0 h-6 w-[2px] bg-border" />
                {finalWakil2 ? (
                  <OrgNode name={finalWakil2.full_name} jabatan={finalWakil2.jabatan || "Wakil Ketua Umum 2"} avatarUrl={finalWakil2.avatar_url} isBph />
                ) : (
                  <EmptyOrgNode jabatan="Wakil Ketua Umum 2" isBph />
                )}
              </div>
            </div>

            {/* CONNECTOR WAKILS -> SEKRETARIS & BENDAHARA */}
            <div className="h-6 w-[2px] bg-border" />

            {/* SEKRETARIS & BENDAHARA */}
            <div className="flex flex-wrap justify-center gap-6">
              {[
                { p: finalSek1, defaultTitle: "Sekretaris Umum 1" },
                { p: finalSek2, defaultTitle: "Sekretaris Umum 2" },
                { p: finalBen1, defaultTitle: "Bendahara Umum 1" },
                { p: finalBen2, defaultTitle: "Bendahara Umum 2" },
              ].map((item, idx) => (
                <div key={idx}>
                  {item.p ? (
                    <OrgNode name={item.p.full_name} jabatan={item.p.jabatan || item.defaultTitle} avatarUrl={item.p.avatar_url} isBph />
                  ) : (
                    <EmptyOrgNode jabatan={item.defaultTitle} isBph />
                  )}
                </div>
              ))}
            </div>
          </div>

          {/* DIVISIONS SECTION */}
          {orgData.divisions.length > 0 && (
            <div className="mt-8 w-full border-t-2 border-dashed border-border pt-16">
              <div className="flex gap-12 px-8">
                {orgData.divisions.map((div: any) => (
                  <div key={div.id} className="flex min-w-[200px] flex-col items-center">
                    
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
                              jabatan={k.jabatan && !k.jabatan.toLowerCase().includes("anggota") ? k.jabatan : `Kepala Divisi ${div.code}`}
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
                          <div key={a.id} className="relative flex w-48 flex-col items-center rounded-xl border bg-card p-3 text-center shadow-sm">
                            <div className="absolute -top-3 z-0 h-3 w-[2px] bg-border" />
                            <Avatar className="mb-2 h-10 w-10">
                              <AvatarImage src={a.avatar_url ?? undefined} />
                              <AvatarFallback>{a.full_name.slice(0, 2).toUpperCase()}</AvatarFallback>
                            </Avatar>
                            <p className="line-clamp-1 text-xs font-semibold">{a.full_name}</p>
                            <p className="text-[10px] text-muted-foreground">{a.jabatan || "Anggota"}</p>
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
