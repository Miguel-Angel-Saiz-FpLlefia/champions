import Link from "next/link";
import { SiteHeader } from "@/components/site-header";
import { TeamBadge } from "@/components/team-badge";
import { featuredTeamIds, seasonLabel, type Team } from "@/lib/champions-data";
import { getMatches, getStandings, getUpcomingMatches, getTeam } from "@/lib/service";

export default async function Home() {
  const matches = await getMatches();
  const standings = await getStandings();
  const upcomingMatches = await getUpcomingMatches();

  const featuredTeams = (await Promise.all(
    featuredTeamIds.map((id) => getTeam(id))
  )).filter((team): team is Team => Boolean(team));

  const nextMatches = upcomingMatches.slice(0, 2);
  const latestResultsList = matches.slice(-4).reverse(); // Mostrar los últimos 4 resultados (final, semis...)

  const championTeam = await getTeam("paris-saint-germain");

  // Pre-fetch teams for latest results to avoid async inside map
  const resultsWithTeams = await Promise.all(
    latestResultsList.map(async (match) => {
      const homeTeam = await getTeam(match.homeTeamId);
      const awayTeam = await getTeam(match.awayTeamId);
      return { match, homeTeam, awayTeam };
    })
  );

  // Pre-fetch teams for standings
  const standingsWithTeams = await Promise.all(
    standings.slice(0, 5).map(async (row) => {
      const team = await getTeam(row.teamId);
      return { row, team };
    })
  );

  const nextMatchesWithTeams = await Promise.all(
    nextMatches.map(async (match) => {
      const homeTeam = await getTeam(match.homeTeamId);
      const awayTeam = await getTeam(match.awayTeamId);
      return { match, homeTeam, awayTeam };
    })
  );

  return (
    <div className="min-h-screen bg-[#050b1d] text-white">
      <div className="relative overflow-hidden">
        <div className="pointer-events-none absolute right-[-15%] top-[-10%] h-105 w-105 rounded-full bg-[radial-gradient(circle_at_center,rgba(76,155,255,0.6),rgba(7,18,46,0))] blur-2xl" />
        <div className="pointer-events-none absolute left-[-15%] top-[35%] h-90 w-90 rounded-full bg-[radial-gradient(circle_at_center,rgba(39,214,255,0.4),rgba(7,18,46,0))] blur-3xl" />

        <SiteHeader />

        <main className="relative mx-auto max-w-6xl px-6 pb-20 pt-10">
          
          {championTeam && (
            <section className="mb-12 rounded-3xl border border-yellow-500/30 bg-gradient-to-br from-yellow-500/20 to-yellow-900/10 p-8 shadow-[0_0_50px_rgba(234,179,8,0.15)] relative overflow-hidden backdrop-blur-sm">
              <div className="absolute -right-20 -top-20 w-64 h-64 bg-yellow-500/20 blur-3xl rounded-full" />
              <div className="absolute -left-20 -bottom-20 w-64 h-64 bg-yellow-400/10 blur-3xl rounded-full" />
              
              <div className="relative z-10 flex flex-col md:flex-row items-center justify-between gap-8">
                <div className="text-center md:text-left">
                  <p className="text-yellow-400 font-bold tracking-[0.2em] uppercase text-sm mb-2 flex items-center gap-2 justify-center md:justify-start">
                    <span className="text-xl">🏆</span> Campeones de Europa
                  </p>
                  <h2 className="text-4xl md:text-5xl font-display font-bold text-white mb-4">
                    {championTeam.name}
                  </h2>
                  <p className="text-yellow-100/70 max-w-md">
                    El Paris Saint-Germain conquista la UEFA Champions League {seasonLabel} tras un torneo espectacular, demostrando superioridad y coronandose en la gran final.
                  </p>
                </div>
                
                <div className="flex-shrink-0 relative">
                  <div className="absolute inset-0 bg-yellow-400/20 blur-xl rounded-full scale-150 animate-pulse" />
                  <TeamBadge team={championTeam} size="lg" />
                </div>
              </div>
            </section>
          )}

          <section className="grid gap-10 lg:grid-cols-[1.2fr_0.8fr] lg:items-center">
            <div className="space-y-6">
              <div className="inline-flex items-center gap-2 rounded-full border border-white/10 bg-white/5 px-4 py-2 text-xs font-semibold uppercase tracking-[0.2em] text-white/70">
                Temporada {seasonLabel}
                <span className="h-1 w-1 rounded-full bg-cyan-400" />
                Champions League
              </div>
              <h1 className="font-display text-5xl uppercase leading-[0.95] tracking-wide sm:text-6xl">
                Equipos y resultados
              </h1>
              <p className="max-w-xl text-base text-white/70 sm:text-lg">
                Revive los ultimos partidos, resultados y la historia de la
                UEFA Champions League en un panel inspirado en la noche europea.
              </p>
              <div className="flex flex-wrap gap-4">
                <Link
                  href="/matches"
                  className="inline-flex items-center gap-2 rounded-full bg-linear-to-r from-cyan-400 to-blue-500 px-6 py-3 text-sm font-semibold text-[#050b1d] shadow-[0_15px_40px_rgba(66,181,255,0.35)] transition hover:-translate-y-px"
                >
                  Ver todos los partidos
                </Link>
                <Link
                  href="/standings"
                  className="inline-flex items-center gap-2 rounded-full border border-white/15 bg-white/5 px-6 py-3 text-sm font-semibold text-white/90 transition hover:border-white/30"
                >
                  Ver clasificacion
                </Link>
              </div>
            </div>
            <div className="relative mx-auto h-64 w-64 sm:h-72 sm:w-72">
              <div className="absolute inset-0 rounded-full bg-[radial-gradient(circle_at_35%_30%,rgba(99,186,255,0.9),rgba(29,61,140,0.3)_55%,rgba(7,16,38,0.1)_70%)] shadow-[0_0_90px_rgba(74,156,255,0.35)]" />
              <div className="absolute inset-6 rounded-full border border-white/15" />
              <div className="absolute inset-10 rounded-full border border-white/10" />
              <div className="absolute -right-8 top-10 h-20 w-20 rounded-full bg-cyan-400/20 blur-2xl" />
            </div>
          </section>

          <section className="mt-12 rounded-3xl border border-white/10 bg-white/5 p-6 backdrop-blur">
            <div className="flex flex-wrap items-center justify-between gap-3">
              <h2 className="text-lg font-semibold">Equipos destacados</h2>
              <Link
                href="/teams"
                className="text-sm font-semibold text-cyan-300 transition hover:text-cyan-200"
              >
                Ver todos los equipos
              </Link>
            </div>
            <div className="mt-6 grid grid-cols-2 gap-4 sm:grid-cols-4 lg:grid-cols-7">
              {featuredTeams.map((team) =>
                team ? (
                  <div
                    key={team.id}
                    className="rounded-2xl border border-white/10 bg-white/5 px-3 py-4 text-center transition hover:border-white/25 hover:bg-white/10"
                  >
                    <div className="flex justify-center">
                      <TeamBadge team={team} />
                    </div>
                    <p className="mt-3 text-sm font-semibold">
                      {team.shortName}
                    </p>
                    <p className="text-xs text-white/60">{team.country}</p>
                  </div>
                ) : null,
              )}
            </div>
          </section>

          <section className="mt-8 grid gap-6 lg:grid-cols-[1.2fr_0.8fr]">
            <div className="rounded-3xl border border-white/10 bg-white/5 p-6 backdrop-blur">
              <div className="flex flex-wrap items-center justify-between gap-3">
                <h2 className="text-lg font-semibold">Ultimos resultados (Fase Final)</h2>
                <Link
                  href="/matches"
                  className="text-sm font-semibold text-cyan-300 transition hover:text-cyan-200"
                >
                  Ver todos
                </Link>
              </div>
              <div className="mt-6 grid gap-4 sm:grid-cols-2">
                {resultsWithTeams.map(({ match, homeTeam, awayTeam }) => {
                  if (!homeTeam || !awayTeam) {
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
                        <span className="font-bold text-yellow-400/80">{match.stage}</span>
                      </div>
                      <div className="mt-4 flex items-center justify-between">
                        <div className="flex items-center gap-3 w-[35%] min-w-0">
                          <TeamBadge team={homeTeam} size="sm" />
                          <div className="min-w-0">
                            <p className="text-sm font-semibold truncate hidden sm:block">
                              {homeTeam.shortName}
                            </p>
                            <p className="text-sm font-semibold sm:hidden truncate">
                              {homeTeam.code}
                            </p>
                          </div>
                        </div>
                        <div className="text-xl font-bold bg-white/10 px-4 py-1 rounded-lg whitespace-nowrap flex-shrink-0 mx-2">
                          {match.homeScore} - {match.awayScore}
                        </div>
                        <div className="flex items-center gap-3 w-[35%] min-w-0 justify-end">
                          <div className="text-right min-w-0">
                            <p className="text-sm font-semibold truncate hidden sm:block">
                              {awayTeam.shortName}
                            </p>
                            <p className="text-sm font-semibold sm:hidden text-right truncate">
                              {awayTeam.code}
                            </p>
                          </div>
                          <TeamBadge team={awayTeam} size="sm" />
                        </div>
                      </div>
                      <div className="mt-3 flex items-center justify-between text-xs font-semibold text-cyan-300">
                        <span>{match.status}</span>
                        <span className="text-[10px] bg-cyan-500/10 text-cyan-400 px-1.5 py-0.5 rounded border border-cyan-500/25">Detalles</span>
                      </div>
                    </Link>
                  );
                })}
              </div>
            </div>

            <div className="grid gap-6">
              <div className="rounded-3xl border border-white/10 bg-white/5 p-6 backdrop-blur">
                <div className="flex items-center justify-between">
                  <h2 className="text-lg font-semibold">Clasificacion Liga</h2>
                  <Link
                    href="/standings"
                    className="text-sm font-semibold text-cyan-300 transition hover:text-cyan-200"
                  >
                    Completa
                  </Link>
                </div>
                <div className="mt-4 space-y-3 text-sm">
                  <div className="grid grid-cols-[30px_1fr_50px_50px] text-xs text-white/50">
                    <span>#</span>
                    <span>Equipo</span>
                    <span className="text-right">DG</span>
                    <span className="text-right">PTS</span>
                  </div>
                  {standingsWithTeams.map(({ row, team }) => {
                    if (!team) return null;

                    return (
                      <div
                        key={row.teamId}
                        className="grid grid-cols-[30px_1fr_50px_50px] items-center rounded-xl border border-white/5 bg-[#0b1636]/60 px-3 py-2"
                      >
                        <span className="text-white/70">{row.position}</span>
                        <div className="flex items-center gap-2">
                          <TeamBadge team={team} size="sm" />
                          <span className="font-semibold truncate">
                            {team.shortName}
                          </span>
                        </div>
                        <span className="text-right text-white/70">
                          +{row.gd}
                        </span>
                        <span className="text-right font-semibold">
                          {row.points}
                        </span>
                      </div>
                    );
                  })}
                </div>
              </div>

              {nextMatchesWithTeams.length > 0 && (
                <div className="rounded-3xl border border-white/10 bg-white/5 p-6 backdrop-blur">
                  <div className="flex items-center justify-between">
                    <h2 className="text-lg font-semibold">Proximos partidos</h2>
                  </div>
                  <div className="mt-4 space-y-4">
                    {nextMatchesWithTeams.map(({ match, homeTeam, awayTeam }) => {
                      if (!homeTeam || !awayTeam) return null;

                      return (
                        <div
                          key={match.id}
                          className="rounded-2xl border border-white/10 bg-[#0b1636]/70 p-4"
                        >
                          <div className="flex items-center justify-between text-xs text-white/60">
                            <span>{match.date}</span>
                            <span>{match.stage}</span>
                          </div>
                          <div className="mt-4 flex items-center justify-between">
                            <div className="flex items-center gap-3">
                              <TeamBadge team={homeTeam} size="sm" />
                              <span className="text-sm font-semibold">
                                {homeTeam.shortName}
                              </span>
                            </div>
                            <span className="text-sm text-white/70">
                              {match.time}
                            </span>
                            <div className="flex items-center gap-3">
                              <span className="text-sm font-semibold">
                                {awayTeam.shortName}
                              </span>
                              <TeamBadge team={awayTeam} size="sm" />
                            </div>
                          </div>
                        </div>
                      );
                    })}
                  </div>
                </div>
              )}
            </div>
          </section>

          <section className="mt-8 grid gap-4 sm:grid-cols-3">
            <div className="rounded-2xl border border-white/10 bg-white/5 p-4 text-sm text-white/70">
              <div className="mb-2 h-1 w-8 rounded-full bg-cyan-400" />
              <p className="font-semibold text-white">Estadisticas de temporada</p>
              <p>Datos finales de la competicion.</p>
            </div>
            <div className="rounded-2xl border border-white/10 bg-white/5 p-4 text-sm text-white/70">
              <div className="mb-2 h-1 w-8 rounded-full bg-blue-400" />
              <p className="font-semibold text-white">Cobertura completa</p>
              <p>Fase de liga, eliminatorias y final.</p>
            </div>
            <div className="rounded-2xl border border-white/10 bg-white/5 p-4 text-sm text-white/70">
              <div className="mb-2 h-1 w-8 rounded-full bg-indigo-400" />
              <p className="font-semibold text-white">Disponible en la app</p>
              <p>Sigue la Champions donde estes.</p>
            </div>
          </section>
        </main>
      </div>
    </div>
  );
}
