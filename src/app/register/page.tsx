"use client";

import React, { useState } from "react";
import Link from "next/link";
import { useRouter } from "next/navigation";
import { supabase } from "@/lib/supabase";
import { SiteHeader } from "@/components/site-header";

export default function RegisterPage() {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [confirmPassword, setConfirmPassword] = useState("");
  const [errorMsg, setErrorMsg] = useState("");
  const [successMsg, setSuccessMsg] = useState("");
  const [loading, setLoading] = useState(false);
  const router = useRouter();

  const handleRegister = async (e: React.FormEvent) => {
    e.preventDefault();
    setLoading(true);
    setErrorMsg("");
    setSuccessMsg("");

    if (password !== confirmPassword) {
      setErrorMsg("Las contraseñas no coinciden.");
      setLoading(false);
      return;
    }

    try {
      const { data, error } = await supabase.auth.signUp({
        email,
        password,
        options: {
          // El trigger en Supabase leerá esta metadata para asignar el rol
          data: {
            role: "usuario normal",
          },
        },
      });

      if (error) {
        setErrorMsg(error.message || "Error al registrarse.");
      } else {
        setSuccessMsg(
          "¡Registro exitoso! Ya puedes iniciar sesión con tus credenciales."
        );
        setEmail("");
        setPassword("");
        setConfirmPassword("");
        // Opcional: Redirigir al login después de unos segundos
        setTimeout(() => {
          router.push("/login");
        }, 3000);
      }
    } catch (err: any) {
      setErrorMsg("Ocurrió un error inesperado al registrarse.");
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="min-h-screen bg-[#050b1d] text-white flex flex-col justify-between">
      <SiteHeader />

      <main className="relative flex-grow flex items-center justify-center px-6 py-12 overflow-hidden">
        {/* Gradients decorativos */}
        <div className="pointer-events-none absolute right-[-10%] bottom-[-10%] h-96 w-96 rounded-full bg-[radial-gradient(circle_at_center,rgba(76,155,255,0.35),rgba(7,18,46,0))] blur-3xl" />
        <div className="pointer-events-none absolute left-[-10%] top-[-10%] h-96 w-96 rounded-full bg-[radial-gradient(circle_at_center,rgba(39,214,255,0.45),rgba(7,18,46,0))] blur-3xl" />

        <div className="relative w-full max-w-md z-10">
          <div className="rounded-3xl border border-white/10 bg-white/5 p-8 backdrop-blur-md shadow-2xl">
            <div className="text-center mb-8">
              <span className="text-3xl">🏆</span>
              <h1 className="mt-4 font-display text-3xl tracking-wide uppercase">
                Crear Cuenta
              </h1>
              <p className="text-white/60 text-sm mt-1">
                Regístrate para participar en la comunidad de Fútbol 360
              </p>
            </div>

            {errorMsg && (
              <div className="mb-6 p-4 rounded-xl border border-red-500/20 bg-red-500/10 text-red-300 text-xs text-center">
                {errorMsg}
              </div>
            )}

            {successMsg && (
              <div className="mb-6 p-4 rounded-xl border border-green-500/20 bg-green-500/10 text-green-300 text-xs text-center font-semibold">
                {successMsg}
              </div>
            )}

            <form onSubmit={handleRegister} className="space-y-5">
              <div>
                <label className="block text-xs font-semibold uppercase tracking-wider text-white/77 mb-2">
                  Correo Electrónico
                </label>
                <input
                  type="email"
                  value={email}
                  onChange={(e) => setEmail(e.target.value)}
                  placeholder="tu@correo.com"
                  required
                  className="w-full rounded-xl border border-white/10 bg-white/5 px-4 py-3 text-sm text-white placeholder-white/30 focus:border-cyan-400 focus:bg-white/10 focus:outline-none transition"
                />
              </div>

              <div>
                <label className="block text-xs font-semibold uppercase tracking-wider text-white/70 mb-2">
                  Contraseña
                </label>
                <input
                  type="password"
                  value={password}
                  onChange={(e) => setPassword(e.target.value)}
                  placeholder="Mínimo 6 caracteres"
                  required
                  minLength={6}
                  className="w-full rounded-xl border border-white/10 bg-white/5 px-4 py-3 text-sm text-white placeholder-white/30 focus:border-cyan-400 focus:bg-white/10 focus:outline-none transition"
                />
              </div>

              <div>
                <label className="block text-xs font-semibold uppercase tracking-wider text-white/70 mb-2">
                  Confirmar Contraseña
                </label>
                <input
                  type="password"
                  value={confirmPassword}
                  onChange={(e) => setConfirmPassword(e.target.value)}
                  placeholder="Repite tu contraseña"
                  required
                  className="w-full rounded-xl border border-white/10 bg-white/5 px-4 py-3 text-sm text-white placeholder-white/30 focus:border-cyan-400 focus:bg-white/10 focus:outline-none transition"
                />
              </div>

              <div className="text-[11px] text-white/50 bg-white/5 p-3 rounded-lg border border-white/5">
                💡 Por defecto, tu cuenta se creará con el rol de <strong>usuario normal</strong>, permitiéndote publicar comentarios en los partidos.
              </div>

              <button
                type="submit"
                disabled={loading}
                className="w-full py-3 rounded-xl bg-gradient-to-r from-cyan-400 to-blue-500 font-semibold text-[#050b1d] shadow-[0_15px_40px_rgba(66,181,255,0.25)] transition hover:opacity-90 active:scale-[0.98] disabled:opacity-50 flex items-center justify-center"
              >
                {loading ? "Creando cuenta..." : "Crear Cuenta"}
              </button>
            </form>

            <div className="mt-6 text-center text-xs text-white/60">
              ¿Ya tienes una cuenta?{" "}
              <Link href="/login" className="text-cyan-300 hover:underline">
                Inicia sesión aquí
              </Link>
            </div>
          </div>
        </div>
      </main>

      <footer className="py-6 border-t border-white/5 text-center text-xs text-white/45">
        &copy; {new Date().getFullYear()} Fútbol 360. Todos los derechos reservados.
      </footer>
    </div>
  );
}
