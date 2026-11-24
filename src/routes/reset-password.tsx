import { createFileRoute, useNavigate } from "@tanstack/react-router";
import { useEffect, useState } from "react";
import { supabase } from "@/integrations/supabase/client";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";
import { toast } from "sonner";
import { KeyRound, CheckCircle2 } from "lucide-react";

export const Route = createFileRoute("/reset-password")({
  component: ResetPasswordPage,
  head: () => ({
    meta: [
      { title: "Atur Ulang Kata Sandi — KPI HMM FEB UNPAK" },
      {
        name: "description",
        content: "Atur ulang kata sandi akun HMM FEB UNPAK.",
      },
    ],
  }),
});

function ResetPasswordPage() {
  const navigate = useNavigate();
  const [loading, setLoading] = useState(false);
  const [password, setPassword] = useState("");
  const [confirmPassword, setConfirmPassword] = useState("");
  const [success, setSuccess] = useState(false);

  useEffect(() => {
    // Check if recovery event or active session exists
    const {
      data: { subscription },
    } = supabase.auth.onAuthStateChange(async (event) => {
      if (event === "PASSWORD_RECOVERY") {
        // Recovery session established
      }
    });

    return () => {
      subscription.unsubscribe();
    };
  }, []);

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault();
    if (password.length < 6) {
      toast.error("Kata sandi minimal 6 karakter");
      return;
    }
    if (password !== confirmPassword) {
      toast.error("Konfirmasi kata sandi tidak cocok");
      return;
    }

    setLoading(true);
    const { error } = await supabase.auth.updateUser({ password });
    setLoading(false);

    if (error) {
      toast.error(error.message);
      return;
    }

    setSuccess(true);
    toast.success("Kata sandi berhasil diperbarui!");
  }

  return (
    <div className="flex min-h-screen items-center justify-center p-6 bg-muted/30">
      <Card className="w-full max-w-md">
        <CardHeader className="text-center">
          <div className="mx-auto mb-2 flex h-12 w-12 items-center justify-center rounded-full bg-primary/10 text-primary">
            {success ? (
              <CheckCircle2 className="h-6 w-6 text-emerald-600" />
            ) : (
              <KeyRound className="h-6 w-6" />
            )}
          </div>
          <CardTitle className="text-xl">
            {success ? "Kata Sandi Diperbarui!" : "Atur Ulang Kata Sandi"}
          </CardTitle>
          <CardDescription>
            {success
              ? "Kata sandi Anda telah berhasil diubah. Silakan masuk dengan kata sandi baru Anda."
              : "Masukkan kata sandi baru untuk akun HMM Anda."}
          </CardDescription>
        </CardHeader>
        <CardContent>
          {success ? (
            <Button
              className="w-full"
              onClick={() => navigate({ to: "/auth", replace: true })}
            >
              Masuk Sekarang
            </Button>
          ) : (
            <form onSubmit={handleSubmit} className="space-y-4">
              <div>
                <Label htmlFor="new-password">Kata Sandi Baru</Label>
                <Input
                  id="new-password"
                  type="password"
                  required
                  minLength={6}
                  value={password}
                  onChange={(e) => setPassword(e.target.value)}
                  placeholder="Minimal 6 karakter"
                />
              </div>
              <div>
                <Label htmlFor="confirm-password">Konfirmasi Kata Sandi Baru</Label>
                <Input
                  id="confirm-password"
                  type="password"
                  required
                  minLength={6}
                  value={confirmPassword}
                  onChange={(e) => setConfirmPassword(e.target.value)}
                  placeholder="Ulangi kata sandi baru"
                />
              </div>
              <Button type="submit" className="w-full" disabled={loading}>
                {loading ? "Menyimpan..." : "Simpan Kata Sandi Baru"}
              </Button>
              <Button
                type="button"
                variant="ghost"
                className="w-full"
                onClick={() => navigate({ to: "/auth", replace: true })}
              >
                Kembali ke Halaman Masuk
              </Button>
            </form>
          )}
        </CardContent>
      </Card>
    </div>
  );
}
