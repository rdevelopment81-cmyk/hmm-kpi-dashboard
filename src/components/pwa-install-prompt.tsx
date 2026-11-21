import { useEffect, useState } from "react";
import { Download, X, Smartphone, Laptop, Share, PlusSquare } from "lucide-react";
import { Button } from "@/components/ui/button";

interface BeforeInstallPromptEvent extends Event {
  prompt: () => Promise<void>;
  userChoice: Promise<{ outcome: "accepted" | "dismissed" }>;
}

export function PwaInstallPrompt() {
  const [deferredPrompt, setDeferredPrompt] = useState<BeforeInstallPromptEvent | null>(null);
  const [showPrompt, setShowPrompt] = useState(false);
  const [isIos, setIsIos] = useState(false);
  const [showIosGuide, setShowIosGuide] = useState(false);

  useEffect(() => {
    // 1. Check if already installed / in standalone mode
    const isStandalone =
      window.matchMedia("(display-mode: standalone)").matches ||
      (window.navigator as any).standalone === true;

    if (isStandalone) {
      return;
    }

    // 2. Check if user dismissed recently (within 3 days)
    const dismissedTime = localStorage.getItem("hmm-pwa-dismissed");
    if (dismissedTime && Date.now() - Number(dismissedTime) < 3 * 24 * 60 * 60 * 1000) {
      return;
    }

    // 3. Detect iOS Safari
    const userAgent = window.navigator.userAgent.toLowerCase();
    const isIosDevice = /iphone|ipad|ipod/.test(userAgent);
    setIsIos(isIosDevice);

    if (isIosDevice) {
      // On iOS Safari, beforeinstallprompt does not fire; show prompt after slight delay
      const timer = setTimeout(() => {
        setShowPrompt(true);
      }, 3000);
      return () => clearTimeout(timer);
    }

    // 4. Handle Android / Desktop Chrome / Edge
    const handleBeforeInstall = (e: Event) => {
      e.preventDefault();
      setDeferredPrompt(e as BeforeInstallPromptEvent);
      setShowPrompt(true);
    };

    window.addEventListener("beforeinstallprompt", handleBeforeInstall);

    // Also register Service Worker here
    if ("serviceWorker" in navigator) {
      navigator.serviceWorker
        .register("/sw.js")
        .then((reg) => {
          console.log("[PWA] Service Worker terdaftar dengan scope:", reg.scope);
        })
        .catch((err) => {
          console.warn("[PWA] Gagal mendaftarkan Service Worker:", err);
        });
    }

    return () => {
      window.removeEventListener("beforeinstallprompt", handleBeforeInstall);
    };
  }, []);

  const handleInstallClick = async () => {
    if (isIos) {
      setShowIosGuide(true);
      return;
    }

    if (!deferredPrompt) return;

    await deferredPrompt.prompt();
    const choice = await deferredPrompt.userChoice;
    if (choice.outcome === "accepted") {
      setShowPrompt(false);
    }
    setDeferredPrompt(null);
  };

  const handleDismiss = () => {
    setShowPrompt(false);
    setShowIosGuide(false);
    localStorage.setItem("hmm-pwa-dismissed", Date.now().toString());
  };

  if (!showPrompt) return null;

  return (
    <div className="fixed bottom-4 left-4 right-4 z-50 mx-auto max-w-lg animate-in fade-in slide-in-from-bottom-5 duration-300">
      <div className="relative overflow-hidden rounded-2xl border border-primary/20 bg-card p-4 shadow-2xl backdrop-blur-md dark:bg-card/95">
        {/* Accent Top Bar */}
        <div className="absolute top-0 left-0 right-0 h-1.5 bg-gradient-to-r from-primary via-accent to-primary" />

        <div className="flex items-start gap-3 pt-1">
          {/* App Icon */}
          <div className="relative flex h-12 w-12 shrink-0 items-center justify-center overflow-hidden rounded-xl bg-white p-1 shadow-md border">
            <img src="/hmm-logo.png" alt="HMM KPI" className="h-full w-full object-contain" />
          </div>

          <div className="flex-1 min-w-0 pr-6">
            <h4 className="text-sm font-bold text-foreground flex items-center gap-1.5">
              <span>Pasang Aplikasi HMM KPI</span>
              <span className="inline-flex items-center gap-1 text-[10px] font-medium bg-primary/10 text-primary px-1.5 py-0.5 rounded-full">
                <Smartphone className="h-2.5 w-2.5" /> HP & <Laptop className="h-2.5 w-2.5" /> Laptop
              </span>
            </h4>
            <p className="text-xs text-muted-foreground mt-0.5 leading-snug">
              Buka aplikasi langsung dari layar tanpa perlu cari link website lagi.
            </p>

            {/* iOS Guide if clicked on iPhone */}
            {showIosGuide && (
              <div className="mt-2.5 rounded-lg bg-muted p-2.5 text-xs text-foreground space-y-1.5 border border-border">
                <p className="font-semibold text-primary">Langkah pasang di iPhone/iPad:</p>
                <div className="flex items-center gap-2 text-muted-foreground text-[11px]">
                  <span>1. Tekan tombol Bagikan</span>
                  <Share className="h-3.5 w-3.5 text-foreground shrink-0" />
                  <span>di bawah browser Safari.</span>
                </div>
                <div className="flex items-center gap-2 text-muted-foreground text-[11px]">
                  <span>2. Gulir ke bawah lalu pilih</span>
                  <span className="font-medium text-foreground inline-flex items-center gap-1">
                    <PlusSquare className="h-3.5 w-3.5" /> Tambahkan ke Layar Utama
                  </span>
                </div>
              </div>
            )}

            {/* Action Buttons */}
            <div className="mt-3 flex items-center gap-2">
              <Button
                size="sm"
                className="h-8 text-xs font-semibold bg-primary hover:bg-primary/90 text-primary-foreground gap-1.5 shadow-sm"
                onClick={handleInstallClick}
              >
                <Download className="h-3.5 w-3.5" />
                {isIos && !showIosGuide ? "Petunjuk Pasang di iPhone" : "Pasang Sekarang"}
              </Button>
              <Button
                variant="ghost"
                size="sm"
                className="h-8 text-xs text-muted-foreground hover:text-foreground"
                onClick={handleDismiss}
              >
                Nanti saja
              </Button>
            </div>
          </div>

          {/* Close button */}
          <button
            onClick={handleDismiss}
            className="absolute top-2.5 right-2.5 rounded-full p-1 text-muted-foreground hover:bg-muted hover:text-foreground transition-colors"
            aria-label="Tutup"
          >
            <X className="h-4 w-4" />
          </button>
        </div>
      </div>
    </div>
  );
}

