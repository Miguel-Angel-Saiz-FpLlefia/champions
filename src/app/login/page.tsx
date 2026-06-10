"use client";

import React, { useState } from "react";
import Link from "next/link";
import { useRouter } from "next/navigation";
import { supabase } from "@/lib/supabase";
import { SiteHeader } from "@/components/site-header";

export default function LoginPage() {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [errorMsg, setErrorMsg] = useState("");
  const [loading, setLoading] = useState(false);
  const router = useRouter();

  const handleLogin = async (e: React.FormEvent) => {
    e.preventDefault();
    setLoading(true);
    setErrorMsg("");

    try {
      const { data, error } = await supabase.auth.signInWithPassword({
        email,
        password,
      });

      if (error) {
        setErrorMsg(error.message || "Error al iniciar sesión");
      } else {
        router.push("/");
      }
    } catch (err: any) {
      setErrorMsg("Ocurrió un error inesperado al iniciar sesión.");
    } finally {
      setLoading(false);
    }
  };

  const autofill = (userEmail: string, userPass: string) => {
    setEmail(userEmail);
    setPassword(userPass);
  };

  return (
    <div className="min-h-screen bg-[#050b1d] text-white flex flex-col justify-between">
      <SiteHeader />

      <main className="relative flex-grow flex items-center justify-center px-6 py-12 overflow-hidden">
        {/* Gradients decorativos */}
        <div className="pointer-events-none absolute right-[-10%] top-[-10%] h-96 w-96 rounded-full bg-[radial-gradient(circle_at_center,rgba(76,155,255,0.4),rgba(7,18,46,0))] blur-3xl" />
        <div className="pointer-events-none absolute left-[-10%] bottom-[-10%] h-96 w-96 rounded-full bg-[radial-gradient(circle_at_center,rgba(39,214,255,0.3),rgba(7,18,46,0))] blur-3xl" />

        <div className="relative w-full max-w-md z-10">
          <div className="rounded-3xl border border-white/10 bg-white/5 p-8 backdrop-blur-md shadow-2xl">
            <div className="text-center mb-8">
              <span className="text-3xl">⚽</span>
              <h1 className="mt-4 font-display text-3xl tracking-wide uppercase">
                Iniciar Sesión
              </h1>
              <p className="text-white/60 text-sm mt-1">
                Accede a tu cuenta de Fútbol 360
              </p>
            </div>

            {errorMsg && (
              <div className="mb-6 p-4 rounded-xl border border-red-500/20 bg-red-500/10 text-red-300 text-xs text-center">
                {errorMsg}
              </div>
            )}

            <form onSubmit={handleLogin} className="space-y-6">
              <div>
                <label className="block text-xs font-semibold uppercase tracking-wider text-white/70 mb-2">
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
                  placeholder="••••••••"
                  required
                  className="w-full rounded-xl border border-white/10 bg-white/5 px-4 py-3 text-sm text-white placeholder-white/30 focus:border-cyan-400 focus:bg-white/10 focus:outline-none transition"
                />
              </div>

              <button
                type="submit"
                disabled={loading}
                className="w-full py-3 rounded-xl bg-gradient-to-r from-cyan-400 to-blue-500 font-semibold text-[#050b1d] shadow-[0_15px_40px_rgba(66,181,255,0.25)] transition hover:opacity-90 active:scale-[0.98] disabled:opacity-50 flex items-center justify-center"
              >
                {loading ? "Iniciando sesión..." : "Iniciar Sesión"}
              </button>
            </form>

            {/* Accesos rápidos de prueba */}
            <div className="mt-8 border-t border-white/10 pt-6">
              <p className="text-[10px] uppercase tracking-wider text-white/50 text-center mb-3">
                Usuarios de prueba rápidos
              </p>
              <div className="grid grid-cols-3 gap-2">
                <button
                  type="button"
                  onClick={() => autofill("admin@champions.com", "admin123")}
                  className="px-2 py-2 rounded-lg border border-yellow-500/20 bg-yellow-500/5 text-[11px] text-yellow-300 font-semibold hover:bg-yellow-500/10 transition"
                >
                  Admin
                </button>
                <button
                  type="button"
                  onClick={() => autofill("editor@champions.com", "editor123")}
                  className="px-2 py-2 rounded-lg border border-purple-500/20 bg-purple-500/5 text-[11px] text-purple-300 font-semibold hover:bg-purple-500/10 transition"
                >
                  Editor
                </button>
                <button
                  type="button"
                  onClick={() => autofill("user@champions.com", "user123")}
                  className="px-2 py-2 rounded-lg border border-cyan-500/20 bg-cyan-500/5 text-[11px] text-cyan-300 font-semibold hover:bg-cyan-500/10 transition"
                >
                  Normal
                </button>
              </div>
            </div>

            <div className="mt-6 text-center text-xs text-white/60">
              ¿No tienes una cuenta?{" "}
              <Link href="/register" className="text-cyan-300 hover:underline">
                Regístrate aquí
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
