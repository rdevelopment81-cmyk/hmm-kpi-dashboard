import { createFileRoute, Link } from "@tanstack/react-router";
import { Button } from "@/components/ui/button";

export const Route = createFileRoute("/")({
  component: Landing,
  head: () => ({
    meta: [
      { title: "KPI HMM FEB UNPAK — Sistem Kinerja Anggota" },
      { name: "description", content: "Platform pengelolaan KPI, absensi, dan jobdesk untuk Himpunan Mahasiswa Manajemen FEB UNPAK." },
    ],
  }),
});

function Landing() {
  return (
    <div className="min-h-screen bg-background">
      <header className="border-b border-border/60 bg-card">
        <div className="mx-auto flex max-w-6xl items-center justify-between px-6 py-4">
          <div className="flex items-center gap-3">
            <img src="/hmm-logo.png" alt="Logo HMM FEB UNPAK" className="h-10 w-auto max-h-10 object-contain rounded-md shrink-0 shadow-sm" />
            <div>
              <p className="text-sm font-semibold leading-tight">HMM FEB UNPAK</p>
              <p className="text-xs text-muted-foreground">Himpunan Mahasiswa Manajemen</p>
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
              Key Performance Indikator
            </h1>
            <p className="mt-4 text-lg text-muted-foreground">
              Absensi, Verifikasi jobdesk dan dashboard KPI
            </p>
            <div className="mt-6 flex gap-3">
              <Link to="/auth"><Button size="lg">Mulai sekarang</Button></Link>
            </div>
          </div>
          <div className="overflow-hidden rounded-2xl shadow-xl border border-border/50">
            <img src="/hero-image.jpg" alt="Foto Bersama Anggota HMM FEB UNPAK" className="h-full w-full object-cover" />
          </div>
        </section>
      </main>

      <footer className="border-t border-border/60 py-6 text-center text-xs text-muted-foreground">
        © {new Date().getFullYear()} HMM FEB Universitas Pakuan
      </footer>
    </div>
  );
}
