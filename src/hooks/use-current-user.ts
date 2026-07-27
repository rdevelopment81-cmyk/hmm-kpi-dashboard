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

      return {
        userId: uid,
        email: userData.user.email ?? null,
        profile: profile as any,
        roles: (rolesRows ?? []).map((r: any) => r.role as AppRole),
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
