import Link from "next/link";
import { notFound } from "next/navigation";
import { SiteHeader } from "@/components/site-header";
import { TeamBadge } from "@/components/team-badge";
import { getMatchById, getMatchDetails, getTeam } from "@/lib/service";
import { MatchDetailsTabs } from "./match-details-tabs";

export const dynamic = "force-dynamic";

interface PageProps {
  params: Promise<{ id: string }>;
}

export default async function MatchDetailPage({ params }: PageProps) {
  const { id } = await params;
  
  const match = await getMatchById(id);
  if (!match) {
    notFound();
  }

  const details = await getMatchDetails(id);
  const homeTeam = await getTeam(match.homeTeamId);
  const awayTeam = await getTeam(match.awayTeamId);

  if (!details || !homeTeam || !awayTeam) {
    notFound();
  }

  return (
    <div className="min-h-screen bg-[#050b1d] text-white">
      <SiteHeader />
      <main className="mx-auto max-w-5xl px-6 pb-16 pt-10">
        {/* Botón de retroceso */}
        <Link
          href="/matches"
          className="inline-flex items-center gap-2 rounded-full bg-white/5 border border-white/10 px-4 py-2 text-sm font-semibold transition hover:bg-white/10 text-white/80 hover:text-white"
        >
          ← Volver a partidos
        </Link>

        {/* Cabecera del Partido */}
        <section className="mt-8 rounded-3xl border border-white/10 bg-[#0b1636]/50 p-6 md:p-10 backdrop-blur-md relative overflow-hidden shadow-2xl">
          {/* Luces de fondo de los colores de los equipos */}
          <div 
            className="absolute top-[-30%] left-[-10%] h-80 w-80 rounded-full blur-3xl opacity-20 pointer-events-none"
            style={{
              background: `radial-gradient(circle at center, ${homeTeam.colors.from}, transparent)`
            }}
          />
          <div 
            className="absolute top-[-30%] right-[-10%] h-80 w-80 rounded-full blur-3xl opacity-20 pointer-events-none"
            style={{
              background: `radial-gradient(circle at center, ${awayTeam.colors.from}, transparent)`
            }}
          />

          <div className="relative z-10 flex flex-col items-center">
            {/* Info de la ronda y fecha */}
            <span className="rounded-full bg-cyan-500/10 border border-cyan-500/25 px-4 py-1 text-xs font-semibold tracking-wider text-cyan-400 uppercase">
              {match.stage}
            </span>
            <span className="mt-2 text-xs text-white/50">{match.date}</span>

            {/* Marcador */}
            <div className="mt-8 flex w-full flex-col md:flex-row items-center justify-around gap-6">
              {/* Equipo Local */}
              <div className="flex flex-col items-center gap-3 w-full md:w-[35%] text-center">
                <TeamBadge team={homeTeam} size="lg" />
                <h2 className="text-xl md:text-2xl font-bold tracking-wide mt-2">
                  {homeTeam.name}
                </h2>
                <span className="text-xs uppercase tracking-widest text-white/40">{homeTeam.country}</span>
              </div>

              {/* Resultado */}
              <div className="flex flex-col items-center gap-2">
                <div className="flex items-center gap-4">
                  <span className="font-display text-5xl md:text-6xl font-extrabold tracking-tighter bg-clip-text text-transparent bg-gradient-to-b from-white to-white/70">
                    {match.homeScore}
                  </span>
                  <span className="text-2xl md:text-3xl font-light text-white/30">-</span>
                  <span className="font-display text-5xl md:text-6xl font-extrabold tracking-tighter bg-clip-text text-transparent bg-gradient-to-b from-white to-white/70">
                    {match.awayScore}
                  </span>
                </div>
                <span className="rounded-full bg-emerald-500/10 border border-emerald-500/30 px-3 py-0.5 text-[10px] font-bold tracking-widest text-emerald-400 uppercase">
                  {match.status}
                </span>
              </div>

              {/* Equipo Visitante */}
              <div className="flex flex-col items-center gap-3 w-full md:w-[35%] text-center">
                <TeamBadge team={awayTeam} size="lg" />
                <h2 className="text-xl md:text-2xl font-bold tracking-wide mt-2">
                  {awayTeam.name}
                </h2>
                <span className="text-xs uppercase tracking-widest text-white/40">{awayTeam.country}</span>
              </div>
            </div>
          </div>
        </section>

        {/* Detalle Pestañas */}
        <MatchDetailsTabs details={details} homeTeam={homeTeam} awayTeam={awayTeam} />
      </main>
    </div>
  );
}
