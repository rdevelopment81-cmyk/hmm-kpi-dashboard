import { createFileRoute, Outlet, redirect, Link, useRouter, useLocation } from "@tanstack/react-router";
import { supabase } from "@/integrations/supabase/client";
import { useCurrentUser, hasRole } from "@/hooks/use-current-user";
import {
  LayoutDashboard,
  ScanLine,
  ClipboardList,
  Users,
  CalendarDays,
  Settings,
  FileBarChart,
  LogOut,
  Loader2,
  Network,
  FolderKanban,
} from "lucide-react";
import { Button } from "@/components/ui/button";
import { Avatar, AvatarFallback, AvatarImage } from "@/components/ui/avatar";
import { toast } from "sonner";
import type { ComponentType } from "react";

export const Route = createFileRoute("/_authenticated")({
  ssr: false,
  beforeLoad: async () => {
    const { data, error } = await supabase.auth.getUser();
    if (error || !data.user) throw redirect({ to: "/auth" });
    return { user: data.user };
  },
  component: AuthedLayout,
});

interface NavItem {
  to: string;
  label: string;
  icon: ComponentType<{ className?: string }>;
  show: (r: string[]) => boolean;
}

const NAV: NavItem[] = [
  { to: "/dashboard", label: "Dashboard", icon: LayoutDashboard, show: () => true },
  { to: "/prokers", label: "Program Kerja", icon: FolderKanban, show: () => true },
  { to: "/struktur", label: "Struktur Organisasi", icon: Network, show: () => true },
  { to: "/absensi", label: "Absensi", icon: ScanLine, show: (r) => r.includes("hr_admin") || r.includes("kadiv") },
  { to: "/meetings", label: "Rapat/Kegiatan", icon: CalendarDays, show: () => true },
  { to: "/jobdesk", label: "Jobdesk", icon: ClipboardList, show: () => true },
  { to: "/anggota", label: "Anggota", icon: Users, show: (r) => r.includes("hr_admin") || r.includes("bph") || r.includes("kadiv") },
  { to: "/rekap", label: "Rekap KPI", icon: FileBarChart, show: (r) => r.includes("hr_admin") || r.includes("bph") },
  { to: "/pengaturan", label: "Pengaturan KPI", icon: Settings, show: (r) => r.includes("hr_admin") },
];

const ROLE_LABEL: Record<string, string> = {
  hr_admin: "HR Admin",
  bph: "BPH",
  kadiv: "Kepala Divisi",
  anggota: "Anggota",
};

function AuthedLayout() {
  const { data: user, isLoading } = useCurrentUser();
  const router = useRouter();
  const location = useLocation();

  async function signOut() {
    await supabase.auth.signOut();
    toast.success("Anda telah keluar");
    router.navigate({ to: "/auth", replace: true });
  }

  if (isLoading || !user) {
    return (
      <div className="grid min-h-screen place-items-center">
        <Loader2 className="h-6 w-6 animate-spin text-primary" />
      </div>
    );
  }

  const visibleNav = NAV.filter((n) => n.show(user.roles));
  const primaryRole = user.roles[0] ?? "anggota";
  const displayRoleLabel =
    user.profile?.jabatan && !user.profile.jabatan.toLowerCase().includes("anggota")
      ? user.profile.jabatan
      : ROLE_LABEL[primaryRole] ?? "Kepala Divisi";

  return (
    <div className="flex min-h-screen bg-background">
      <aside className="hidden w-64 shrink-0 flex-col bg-sidebar text-sidebar-foreground md:flex">
        <div className="border-b border-sidebar-border px-5 py-4">
          <div className="flex items-center gap-3">
            <img src="/hmm-logo.png" alt="Logo HMM FEB UNPAK" className="h-10 w-auto max-h-10 object-contain rounded-md shrink-0 shadow-sm" />
            <div>
              <p className="text-sm font-semibold">HMM FEB UNPAK</p>
              <p className="text-xs opacity-70">Himpunan Mahasiswa Manajemen</p>
            </div>
          </div>
        </div>
        <nav className="flex-1 overflow-y-auto px-3 py-4">
          {visibleNav.map((item) => {
            const active = location.pathname.startsWith(item.to);
            return (
              <Link
                key={item.to}
                to={item.to}
                className={`mb-1 flex items-center gap-3 rounded-md px-3 py-2 text-sm transition ${
                  active
                    ? "bg-sidebar-primary text-sidebar-primary-foreground font-semibold"
                    : "text-sidebar-foreground hover:bg-sidebar-accent"
                }`}
              >
                <item.icon className="h-4 w-4" />
                {item.label}
              </Link>
            );
          })}
        </nav>
        <div className="border-t border-sidebar-border p-3">
          <div className="mb-3 flex items-center gap-3 rounded-md bg-sidebar-accent/40 p-2">
            <Avatar className="h-9 w-9">
              <AvatarImage src={user.profile?.avatar_url ?? undefined} />
              <AvatarFallback className="bg-sidebar-primary text-sidebar-primary-foreground">
                {(user.profile?.full_name ?? "?").slice(0, 2).toUpperCase()}
              </AvatarFallback>
            </Avatar>
            <div className="min-w-0 flex-1">
              <p className="truncate text-sm font-medium">{user.profile?.full_name || user.email}</p>
              <p className="text-xs opacity-70">{displayRoleLabel}{user.division ? ` · ${user.division.code}` : ""}</p>
            </div>
          </div>
          <Button variant="ghost" onClick={signOut} className="w-full justify-start text-sidebar-foreground hover:bg-sidebar-accent">
            <LogOut className="mr-2 h-4 w-4" /> Keluar
          </Button>
        </div>
      </aside>

      <div className="flex flex-1 flex-col">
        <header className="flex items-center justify-between border-b border-border/60 bg-card px-6 py-3 md:hidden">
          <div className="flex items-center gap-2">
            <img src="/hmm-logo.png" alt="Logo HMM" className="h-8 w-auto max-h-8 object-contain rounded-md shrink-0 shadow-sm" />
            <span className="text-sm font-semibold">HMM KPI</span>
          </div>
          <Button variant="ghost" size="sm" onClick={signOut}><LogOut className="h-4 w-4" /></Button>
        </header>

        {/* Mobile nav */}
        <nav className="flex gap-1 overflow-x-auto border-b border-border/60 bg-card px-3 py-2 md:hidden">
          {visibleNav.map((item) => {
            const active = location.pathname.startsWith(item.to);
            return (
              <Link
                key={item.to}
                to={item.to}
                className={`shrink-0 rounded-md px-3 py-1.5 text-xs ${active ? "bg-primary text-primary-foreground" : "text-muted-foreground"}`}
              >
                {item.label}
              </Link>
            );
          })}
        </nav>

        <main className="flex-1 overflow-y-auto p-6">
          <Outlet />
        </main>
      </div>
    </div>
  );
}

export { hasRole };
