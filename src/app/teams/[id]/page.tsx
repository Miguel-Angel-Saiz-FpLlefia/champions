import Link from "next/link";
import { notFound } from "next/navigation";
import { SiteHeader } from "@/components/site-header";
import { TeamBadge } from "@/components/team-badge";
import {
  getTeam,
  getMatches,
  getUpcomingMatches,
  getStandings,
  getTeamSquadById,
  getTeams,
} from "@/lib/service";

export const dynamic = "force-dynamic";

type TeamPageProps = {
  params: Promise<{ id: string }>;
};

export default async function TeamPage({ params }: TeamPageProps) {
  const { id } = await params;
  const team = await getTeam(id);

  if (!team) {
    notFound();
  }

  const allMatches = await getMatches();
  const recentMatches = allMatches.filter(
    (match) => match.homeTeamId === team.id || match.awayTeamId === team.id,
  );

  const recentMatchesWithTeams = await Promise.all(
    recentMatches.map(async (match) => {
      const home = await getTeam(match.homeTeamId);
      const away = await getTeam(match.awayTeamId);
      return { match, home, away };
    })
  );

  const upcomingMatchesList = await getUpcomingMatches();
  const upcoming = upcomingMatchesList.filter(
    (match) => match.homeTeamId === team.id || match.awayTeamId === team.id,
  );

  // Pre-fetch teams for upcoming matches as well to ensure clean types
  const upcomingWithTeams = await Promise.all(
    upcoming.map(async (match) => {
      const home = await getTeam(match.homeTeamId);
      const away = await getTeam(match.awayTeamId);
      return { match, home, away };
    })
  );

  const allStandings = await getStandings();
  const standing = allStandings.find((row) => row.teamId === team.id);
  const squad = await getTeamSquadById(team.id);

  // Agrupación por posiciones
  const goalkeepers = squad.starters.filter((p: any) => p.pos === "POR");
  const defenders = squad.starters.filter((p: any) => p.pos === "DEF");
  const midfielders = squad.starters.filter((p: any) => p.pos === "MED");
  const forwards = squad.starters.filter((p: any) => p.pos === "DEL");

  return (
    <div className="min-h-screen bg-[#050b1d] text-white">
      <SiteHeader />
      <main className="mx-auto max-w-5xl px-6 pb-16 pt-10">
        <div className="flex flex-wrap items-center justify-between gap-6">
          <div className="flex items-center gap-4">
            <TeamBadge team={team} size="lg" />
            <div>
              <p className="text-xs uppercase tracking-[0.3em] text-white/60">
                Equipo
              </p>
              <h1 className="font-display text-4xl uppercase tracking-wide">
                {team.name}
              </h1>
              <p className="text-sm text-white/60">{team.country}</p>
            </div>
          </div>
          <Link
            href="/teams"
            className="rounded-full border border-white/15 px-5 py-2 text-sm font-semibold text-white/80 transition hover:border-white/30"
          >
            Volver a equipos
          </Link>
        </div>

        <div className="mt-8 grid gap-6 lg:grid-cols-[1.2fr_0.8fr]">
          <div className="space-y-6">
            {/* Resultados recientes */}
            <div className="rounded-3xl border border-white/10 bg-white/5 p-6">
              <h2 className="text-lg font-semibold">Resultados recientes</h2>
              <div className="mt-4 space-y-3">
                {recentMatchesWithTeams.length === 0 ? (
                  <p className="text-sm text-white/60">
                    No hay resultados recientes disponibles.
                  </p>
                ) : (
                  recentMatchesWithTeams.map(({ match, home, away }) => {
                    if (!home || !away) {
                      return null;
                    }

                    return (
                      <Link
                        key={match.id}
                        href={`/matches/${match.id}`}
                        className="block rounded-2xl border border-white/10 bg-[#0b1636]/70 p-4 transition-all duration-300 hover:border-cyan-500/50 hover:bg-[#0e1d47]/80 hover:shadow-[0_0_20px_rgba(6,182,212,0.15)] hover:-translate-y-0.5"
                      >
                        <div className="flex items-center justify-between text-xs text-white/60">
                          <span>{match.date}</span>
                          <span className="flex items-center gap-1.5">
                            {match.stage}
                            <span className="text-[10px] bg-cyan-500/10 text-cyan-400 px-1.5 py-0.5 rounded border border-cyan-500/25">Detalles</span>
                          </span>
                        </div>
                        <div className="mt-3 flex items-center justify-between">
                          <span className="text-sm font-semibold w-[35%] truncate">
                            {home.shortName}
                          </span>
                          <span className="text-lg font-semibold bg-white/10 px-3 py-1 rounded-md whitespace-nowrap flex-shrink-0 mx-2">
                            {match.homeScore} - {match.awayScore}
                          </span>
                          <span className="text-sm font-semibold w-[35%] text-right truncate">
                            {away.shortName}
                          </span>
                        </div>
                      </Link>
                    );
                  })
                )}
              </div>
            </div>

            {/* Plantilla del Equipo */}
            <div className="rounded-3xl border border-white/10 bg-white/5 p-6">
              <h2 className="text-lg font-semibold border-b border-white/10 pb-3 mb-6">Plantilla del Equipo</h2>
              <div className="grid gap-6 md:grid-cols-2">
                <div className="space-y-6">
                  {goalkeepers.length > 0 && (
                    <div>
                      <h3 className="text-xs font-bold uppercase tracking-wider text-cyan-400 mb-2">Porteros</h3>
                      <div className="space-y-1.5">
                        {goalkeepers.map((player: any, i: number) => (
                          <div key={i} className="flex items-center justify-between py-1 border-b border-white/5 text-sm">
                            <span className="font-medium text-white/90">{player.name}</span>
                            <span className="text-xs font-mono text-white/40">#{player.number}</span>
                          </div>
                        ))}
                      </div>
                    </div>
                  )}

                  {defenders.length > 0 && (
                    <div>
                      <h3 className="text-xs font-bold uppercase tracking-wider text-cyan-400 mb-2">Defensas</h3>
                      <div className="space-y-1.5">
                        {defenders.map((player: any, i: number) => (
                          <div key={i} className="flex items-center justify-between py-1 border-b border-white/5 text-sm">
                            <span className="font-medium text-white/90">{player.name}</span>
                            <span className="text-xs font-mono text-white/40">#{player.number}</span>
                          </div>
                        ))}
                      </div>
                    </div>
                  )}

                  {midfielders.length > 0 && (
                    <div>
                      <h3 className="text-xs font-bold uppercase tracking-wider text-cyan-400 mb-2">Centrocampistas</h3>
                      <div className="space-y-1.5">
                        {midfielders.map((player: any, i: number) => (
                          <div key={i} className="flex items-center justify-between py-1 border-b border-white/5 text-sm">
                            <span className="font-medium text-white/90">{player.name}</span>
                            <span className="text-xs font-mono text-white/40">#{player.number}</span>
                          </div>
                        ))}
                      </div>
                    </div>
                  )}

                  {forwards.length > 0 && (
                    <div>
                      <h3 className="text-xs font-bold uppercase tracking-wider text-cyan-400 mb-2">Delanteros</h3>
                      <div className="space-y-1.5">
                        {forwards.map((player: any, i: number) => (
                          <div key={i} className="flex items-center justify-between py-1 border-b border-white/5 text-sm">
                            <span className="font-medium text-white/90">{player.name}</span>
                            <span className="text-xs font-mono text-white/40">#{player.number}</span>
                          </div>
                        ))}
                      </div>
                    </div>
                  )}
                </div>

                <div>
                  <h3 className="text-xs font-bold uppercase tracking-wider text-yellow-400/90 mb-2">Suplentes habituales</h3>
                  <div className="space-y-1.5">
                    {squad.substitutes.map((player: any, i: number) => (
                      <div key={i} className="flex items-center justify-between py-1 border-b border-white/5 text-sm">
                        <span className="font-medium text-white/80">{player.name}</span>
                        <span className="text-xs font-mono text-white/40">#{player.number}</span>
                      </div>
                    ))}
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div className="space-y-6">
            <div className="rounded-3xl border border-white/10 bg-white/5 p-6">
              <h2 className="text-lg font-semibold">Posicion en liga</h2>
              {standing ? (
                <div className="mt-4 rounded-2xl border border-white/10 bg-[#0b1636]/70 p-4 text-sm">
                  <div className="flex items-center justify-between">
                    <span className="text-white/70">Posicion</span>
                    <span className="text-lg font-semibold">
                      #{standing.position}
                    </span>
                  </div>
                  <div className="mt-3 flex items-center justify-between text-white/70">
                    <span>PJ {standing.played}</span>
                    <span>DG +{standing.gd}</span>
                    <span>PTS {standing.points}</span>
                  </div>
                </div>
              ) : (
                <p className="mt-4 text-sm text-white/60">
                  No hay datos de clasificacion disponibles.
                </p>
              )}
            </div>

            <div className="rounded-3xl border border-white/10 bg-white/5 p-6">
              <h2 className="text-lg font-semibold">Proximos partidos</h2>
              <div className="mt-4 space-y-3">
                {upcomingWithTeams.length === 0 ? (
                  <p className="text-sm text-white/60">
                    No hay partidos programados.
                  </p>
                ) : (
                  upcomingWithTeams.map(({ match, home, away }) => {
                    if (!home || !away) {
                      return null;
                    }

                    return (
                      <div
                        key={match.id}
                        className="rounded-2xl border border-white/10 bg-[#0b1636]/70 p-4"
                      >
                        <div className="flex items-center justify-between text-xs text-white/60">
                          <span>{match.date}</span>
                          <span>{match.stage}</span>
                        </div>
                        <div className="mt-3 flex items-center justify-between">
                          <span className="text-sm font-semibold">
                            {home.shortName}
                          </span>
                          <span className="text-sm text-white/70">
                            {match.time}
                          </span>
                          <span className="text-sm font-semibold">
                            {away.shortName}
                          </span>
                        </div>
                      </div>
                    );
                  })
                )}
              </div>
            </div>
          </div>
        </div>
      </main>
    </div>
  );
}
