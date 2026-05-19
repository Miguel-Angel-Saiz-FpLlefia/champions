import Link from "next/link";

const navItems = [
  { label: "Inicio", href: "/" },
  { label: "Equipos", href: "/teams" },
  { label: "Partidos", href: "/matches" },
  { label: "Resultados", href: "/results" },
  { label: "Clasificacion", href: "/standings" },
];

export function SiteHeader() {
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
        </nav>
        <div className="flex items-center gap-3 text-white/70">
          <button
            type="button"
            aria-label="Buscar"
            className="grid h-9 w-9 place-items-center rounded-full border border-white/10 bg-white/5 transition hover:text-white"
          >
            <svg
              width="16"
              height="16"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              strokeWidth="2"
              strokeLinecap="round"
              strokeLinejoin="round"
              aria-hidden="true"
            >
              <circle cx="11" cy="11" r="8" />
              <path d="M21 21l-4.3-4.3" />
            </svg>
          </button>
          <button
            type="button"
            aria-label="Notificaciones"
            className="grid h-9 w-9 place-items-center rounded-full border border-white/10 bg-white/5 transition hover:text-white"
          >
            <svg
              width="16"
              height="16"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              strokeWidth="2"
              strokeLinecap="round"
              strokeLinejoin="round"
              aria-hidden="true"
            >
              <path d="M18 8a6 6 0 10-12 0c0 7-3 7-3 7h18s-3 0-3-7" />
              <path d="M13.73 21a2 2 0 01-3.46 0" />
            </svg>
          </button>
          <div className="grid h-9 w-9 place-items-center rounded-full border border-white/10 bg-white/5 text-xs font-semibold">
            UCL
          </div>
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
      </nav>
    </header>
  );
}
