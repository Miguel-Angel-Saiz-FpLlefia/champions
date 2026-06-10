"use client";

import Link from "next/link";
import { useAuth } from "@/lib/auth-context";

const navItems = [
  { label: "Inicio", href: "/" },
  { label: "Equipos", href: "/teams" },
  { label: "Resultados", href: "/results" },
  { label: "Clasificacion", href: "/standings" },
];

export function SiteHeader() {
  const { user, profile, loading, signOut } = useAuth();

  // Color de badge según rol
  const getRoleBadgeClass = (role?: string) => {
    switch (role) {
      case "Administrador":
        return "bg-yellow-500/15 text-yellow-400 border border-yellow-500/30";
      case "editor":
        return "bg-purple-500/15 text-purple-400 border border-purple-500/30";
      default:
        return "bg-cyan-500/15 text-cyan-400 border border-cyan-500/30";
    }
  };

  return (
    <header className="relative z-10 border-b border-white/10 bg-[#050b1d]/80 backdrop-blur">
      <div className="mx-auto flex max-w-6xl items-center justify-between px-6 py-4">
        <div className="flex items-center gap-3">
          <div className="grid h-10 w-10 place-items-center rounded-full border border-white/10 bg-white/5">
            <svg
              width="18"
              height="18"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              strokeWidth="1.5"
              strokeLinecap="round"
              strokeLinejoin="round"
              aria-hidden="true"
            >
              <circle cx="12" cy="12" r="9" />
              <path d="M12 3l3 4-1 5-4 2-4-2-1-5 3-4" />
              <path d="M3.5 10.5l5.5 2 3-3 3 3 5.5-2" />
              <path d="M8 21l4-2 4 2" />
            </svg>
          </div>
          <div className="leading-none">
            <p className="text-[11px] uppercase tracking-[0.35em] text-white/50">
              Futbol
            </p>
            <p className="font-display text-2xl tracking-wide">360</p>
          </div>
        </div>
        <nav className="hidden items-center gap-6 text-sm font-semibold text-white/80 lg:flex">
          {navItems.map((item) => (
            <Link
              key={item.href}
              href={item.href}
              className="transition hover:text-white"
            >
              {item.label}
            </Link>
          ))}
          {(profile?.role === "Administrador" || profile?.role === "editor") && (
            <Link
              href="/dashboard"
              className="text-yellow-400 font-bold transition hover:text-yellow-300"
            >
              Dashboard
            </Link>
          )}
        </nav>
        <div className="flex items-center gap-4 text-white/70">
          {!loading && user ? (
            <div className="flex items-center gap-3">
              <div className="hidden md:flex flex-col items-end text-xs">
                <span className="font-medium text-white/90 truncate max-w-[150px]">{profile?.email || user.email}</span>
                <span className={`px-1.5 py-0.5 mt-0.5 rounded text-[10px] font-bold uppercase ${getRoleBadgeClass(profile?.role)}`}>
                  {profile?.role || "usuario normal"}
                </span>
              </div>
              <button
                onClick={signOut}
                className="px-3 py-1.5 rounded-full border border-white/15 bg-white/5 text-xs font-semibold text-white/90 hover:bg-white/10 transition"
              >
                Cerrar Sesión
              </button>
            </div>
          ) : !loading ? (
            <div className="flex items-center gap-2">
              <Link
                href="/login"
                className="px-3 py-1.5 rounded-full border border-white/15 bg-[#0b1636] text-xs font-semibold text-cyan-300 hover:border-cyan-500/50 hover:bg-cyan-500/10 transition"
              >
                Iniciar Sesión
              </Link>
              <Link
                href="/register"
                className="hidden sm:inline-block px-3 py-1.5 rounded-full bg-cyan-500 text-[#050b1d] text-xs font-semibold hover:bg-cyan-400 transition"
              >
                Registrarse
              </Link>
            </div>
          ) : (
            <span className="text-xs text-white/40">Cargando...</span>
          )}
        </div>
      </div>
      <nav className="flex items-center justify-between gap-4 px-6 pb-3 text-xs font-semibold text-white/70 lg:hidden">
        {navItems.map((item) => (
          <Link
            key={item.href}
            href={item.href}
            className="transition hover:text-white"
          >
            {item.label}
          </Link>
        ))}
        {(profile?.role === "Administrador" || profile?.role === "editor") && (
          <Link
            href="/dashboard"
            className="text-yellow-400 font-bold transition hover:text-yellow-300"
          >
            Dashboard
          </Link>
        )}
      </nav>
    </header>
  );
}
