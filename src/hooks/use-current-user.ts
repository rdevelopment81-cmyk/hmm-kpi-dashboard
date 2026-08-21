import { useQuery } from "@tanstack/react-query";
import { supabase } from "@/integrations/supabase/client";

export type AppRole = "bph" | "hr_admin" | "kadiv" | "anggota";

export interface CurrentUserData {
  userId: string;
  email: string | null;
  profile: {
    id: string;
    full_name: string;
    nim: string | null;
    division_id: string | null;
    jabatan: string | null;
    id_kartu: string | null;
    avatar_url: string | null;
    email: string | null;
  } | null;
  roles: AppRole[];
  division: { id: string; name: string; code: string } | null;
}

export function useCurrentUser() {
  return useQuery({
    queryKey: ["currentUser"],
    queryFn: async (): Promise<CurrentUserData | null> => {
      const { data: userData } = await supabase.auth.getUser();
      if (!userData.user) return null;
      const uid = userData.user.id;

      const [{ data: profile }, { data: rolesRows }] = await Promise.all([
        supabase.from("profiles").select("*").eq("id", uid).maybeSingle(),
        supabase.from("user_roles").select("role").eq("user_id", uid),
      ]);

      let division = null;
      if (profile?.division_id) {
        const { data: div } = await supabase
          .from("divisions")
          .select("id,name,code")
          .eq("id", profile.division_id)
          .maybeSingle();
        division = div ?? null;
      }

      const roles = (rolesRows ?? []).map((r: any) => r.role as AppRole);
      const isRND = division?.code === "RND" || division?.name?.toLowerCase().includes("research") || division?.name?.toLowerCase().includes("r&d");
      
      const isJabatanKadiv = profile?.jabatan?.toLowerCase().includes("kepala") || profile?.jabatan?.toLowerCase().includes("kadiv");
      if (isJabatanKadiv && !roles.includes("kadiv")) {
        roles.push("kadiv");
        // optionally upsert into db so it persists
        supabase.from("user_roles").upsert({ user_id: uid, role: "kadiv", division_id: profile?.division_id ?? undefined }, { onConflict: "user_id,role" }).then(() => {});
      }

      if (roles.includes("kadiv") && isRND && !roles.includes("hr_admin")) {
        roles.push("hr_admin");
      }
      
      if ((isRND || roles.includes("hr_admin")) && (!profile?.jabatan || profile?.jabatan.toLowerCase().includes("anggota"))) {
        supabase.from("profiles").update({ jabatan: "Kepala Divisi" }).eq("id", uid).then(() => {});
        supabase.from("user_roles").upsert({ user_id: uid, role: "kadiv", division_id: profile?.division_id ?? undefined }, { onConflict: "user_id,role" }).then(() => {});
        if (profile) (profile as any).jabatan = "Kepala Divisi";
        if (!roles.includes("kadiv")) roles.push("kadiv");
        if (!roles.includes("hr_admin") && isRND) roles.push("hr_admin");
      }

      roles.sort((a, b) => {
        const order: Record<string, number> = { kadiv: 1, bph: 2, hr_admin: 3, anggota: 4 };
        return (order[a] ?? 5) - (order[b] ?? 5);
      });

      return {
        userId: uid,
        email: userData.user.email ?? null,
        profile: profile as any,
        roles,
        division,
      };
    },
    staleTime: 30_000,
  });
}

export function hasRole(user: CurrentUserData | null | undefined, ...roles: AppRole[]) {
  if (!user) return false;
  return user.roles.some((r) => roles.includes(r));
}
