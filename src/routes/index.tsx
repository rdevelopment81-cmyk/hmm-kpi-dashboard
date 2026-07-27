import { createFileRoute, Link } from "@tanstack/react-router";
import { Button } from "@/components/ui/button";
import { ShieldCheck, Users, ClipboardCheck, BarChart3 } from "lucide-react";

export const Route = createFileRoute("/")({
  component: Landing,
  head: () => ({
    meta: [
      { title: "KPI HMM FEB UNPAK — Sistem Kinerja Anggota" },
      { name: "description", content: "Platform pengelolaan KPI, absensi RFID, dan jobdesk untuk Himpunan Mahasiswa Manajemen FEB UNPAK." },
    ],
  }),
});

function Landing() {
  return (
    <div className="min-h-screen bg-background">
      <header className="border-b border-border/60 bg-card">
        <div className="mx-auto flex max-w-6xl items-center justify-between px-6 py-4">
          <div className="flex items-center gap-3">
            <div className="grid h-10 w-10 place-items-center rounded-lg bg-primary font-bold text-primary-foreground">H</div>
            <div>
              <p className="text-sm font-semibold leading-tight">HMM FEB UNPAK</p>
              <p className="text-xs text-muted-foreground">Sistem KPI Anggota</p>
            </div>
          </div>
          <Link to="/auth">
            <Button>Masuk</Button>
          </Link>
        </div>
      </header>

      <main className="mx-auto max-w-6xl px-6 py-16">
        <section className="grid gap-10 md:grid-cols-2 md:items-center">
          <div>
            <span className="inline-flex rounded-full bg-accent/30 px-3 py-1 text-xs font-semibold text-accent-foreground">
              Himpunan Mahasiswa Manajemen FEB UNPAK
            </span>
            <h1 className="mt-4 text-4xl font-bold tracking-tight md:text-5xl">
              Kelola kinerja anggota HMM dengan cara modern.
            </h1>
            <p className="mt-4 text-lg text-muted-foreground">
              Absensi rapat via kartu RFID, verifikasi jobdesk, dan dashboard KPI real-time — semua di satu tempat.
            </p>
            <div className="mt-6 flex gap-3">
              <Link to="/auth"><Button size="lg">Mulai sekarang</Button></Link>
            </div>
          </div>
          <div className="rounded-2xl bg-gradient-to-br from-primary to-primary/70 p-8 text-primary-foreground shadow-xl">
            <div className="grid gap-4 sm:grid-cols-2">
              {[
                { icon: ShieldCheck, label: "Absensi RFID", desc: "Tap kartu, tercatat otomatis" },
                { icon: ClipboardCheck, label: "Jobdesk", desc: "Upload & approval terstruktur" },
                { icon: BarChart3, label: "Dashboard KPI", desc: "Skor per anggota & divisi" },
                { icon: Users, label: "8 Divisi", desc: "Terintegrasi penuh" },
              ].map((f) => (
                <div key={f.label} className="rounded-xl bg-primary-foreground/10 p-4 backdrop-blur">
                  <f.icon className="h-6 w-6 text-accent" />
                  <p className="mt-2 font-semibold">{f.label}</p>
                  <p className="text-sm opacity-80">{f.desc}</p>
                </div>
              ))}
            </div>
          </div>
        </section>
      </main>

      <footer className="border-t border-border/60 py-6 text-center text-xs text-muted-foreground">
        © {new Date().getFullYear()} HMM FEB Universitas Pakuan
      </footer>
    </div>
  );
}
