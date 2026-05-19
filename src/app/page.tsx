import Link from "next/link";

import { SiteHeader } from "@/components/site-header";
import { TeamBadge } from "@/components/team-badge";
import {
  featuredTeamIds,
  type Team,
  getTeamById,
  latestResults,
  seasonLabel,
  standings,
  upcomingMatches,
} from "@/lib/champions-data";

const featuredTeams = featuredTeamIds
  .map((teamId) => getTeamById(teamId))
  .filter((team): team is Team => Boolean(team));

const nextMatches = upcomingMatches.slice(0, 2);

export default function Home() {
  return (
    <div className="min-h-screen bg-[#050b1d] text-white">
      <div className="relative overflow-hidden">
        <div className="pointer-events-none absolute right-[-15%] top-[-10%] h-105 w-105 rounded-full bg-[radial-gradient(circle_at_center,rgba(76,155,255,0.6),rgba(7,18,46,0))] blur-2xl" />
        <div className="pointer-events-none absolute left-[-15%] top-[35%] h-90 w-90 rounded-full bg-[radial-gradient(circle_at_center,rgba(39,214,255,0.4),rgba(7,18,46,0))] blur-3xl" />

        <SiteHeader />

        <main className="relative mx-auto max-w-6xl px-6 pb-20 pt-10">
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
                Sigue los ultimos partidos, resultados y clasificacion de la
                UEFA Champions League en un panel inspirado en la noche europea.
              </p>
              <div className="flex flex-wrap gap-4">
                <Link
                  href="/matches"
                  className="inline-flex items-center gap-2 rounded-full bg-linear-to-r from-cyan-400 to-blue-500 px-6 py-3 text-sm font-semibold text-[#050b1d] shadow-[0_15px_40px_rgba(66,181,255,0.35)] transition hover:-translate-y-px"
                >
                  Ver partidos
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
                <h2 className="text-lg font-semibold">Ultimos resultados</h2>
                <Link
                  href="/results"
                  className="text-sm font-semibold text-cyan-300 transition hover:text-cyan-200"
                >
                  Ver todos los resultados
                </Link>
              </div>
              <div className="mt-6 grid gap-4 sm:grid-cols-2">
                {latestResults.map((match) => {
                  const homeTeam = getTeamById(match.homeTeamId);
                  const awayTeam = getTeamById(match.awayTeamId);

                  if (!homeTeam || !awayTeam) {
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
                      <div className="mt-4 flex items-center justify-between">
                        <div className="flex items-center gap-3">
                          <TeamBadge team={homeTeam} size="sm" />
                          <div>
                            <p className="text-sm font-semibold">
                              {homeTeam.shortName}
                            </p>
                            <p className="text-xs text-white/50">
                              {homeTeam.country}
                            </p>
                          </div>
                        </div>
                        <div className="text-xl font-semibold">
                          {match.homeScore} - {match.awayScore}
                        </div>
                        <div className="flex items-center gap-3">
                          <div className="text-right">
                            <p className="text-sm font-semibold">
                              {awayTeam.shortName}
                            </p>
                            <p className="text-xs text-white/50">
                              {awayTeam.country}
                            </p>
                          </div>
                          <TeamBadge team={awayTeam} size="sm" />
                        </div>
                      </div>
                      <div className="mt-3 text-xs font-semibold text-cyan-300">
                        {match.status}
                      </div>
                    </div>
                  );
                })}
              </div>
              <div className="mt-6 flex justify-center">
                <Link
                  href="/results"
                  className="rounded-full border border-white/15 px-5 py-2 text-sm font-semibold text-white/80 transition hover:border-white/30"
                >
                  Ver mas resultados
                </Link>
              </div>
            </div>

            <div className="grid gap-6">
              <div className="rounded-3xl border border-white/10 bg-white/5 p-6 backdrop-blur">
                <div className="flex items-center justify-between">
                  <h2 className="text-lg font-semibold">Clasificacion</h2>
                  <Link
                    href="/standings"
                    className="text-sm font-semibold text-cyan-300 transition hover:text-cyan-200"
                  >
                    Ver clasificacion completa
                  </Link>
                </div>
                <div className="mt-4 space-y-3 text-sm">
                  <div className="grid grid-cols-[30px_1fr_50px_50px] text-xs text-white/50">
                    <span>#</span>
                    <span>Equipo</span>
                    <span className="text-right">DG</span>
                    <span className="text-right">PTS</span>
                  </div>
                  {standings.map((row) => {
                    const team = getTeamById(row.teamId);
                    if (!team) {
                      return null;
                    }

                    return (
                      <div
                        key={row.teamId}
                        className="grid grid-cols-[30px_1fr_50px_50px] items-center rounded-xl border border-white/5 bg-[#0b1636]/60 px-3 py-2"
                      >
                        <span className="text-white/70">{row.position}</span>
                        <div className="flex items-center gap-2">
                          <TeamBadge team={team} size="sm" />
                          <span className="font-semibold">
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

              <div className="rounded-3xl border border-white/10 bg-white/5 p-6 backdrop-blur">
                <div className="flex items-center justify-between">
                  <h2 className="text-lg font-semibold">Proximos partidos</h2>
                  <Link
                    href="/matches"
                    className="text-sm font-semibold text-cyan-300 transition hover:text-cyan-200"
                  >
                    Ver todos los partidos
                  </Link>
                </div>
                <div className="mt-4 space-y-4">
                  {nextMatches.map((match) => {
                    const homeTeam = getTeamById(match.homeTeamId);
                    const awayTeam = getTeamById(match.awayTeamId);

                    if (!homeTeam || !awayTeam) {
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
            </div>
          </section>

          <section className="mt-8 grid gap-4 sm:grid-cols-3">
            <div className="rounded-2xl border border-white/10 bg-white/5 p-4 text-sm text-white/70">
              <div className="mb-2 h-1 w-8 rounded-full bg-cyan-400" />
              <p className="font-semibold text-white">Estadisticas en vivo</p>
              <p>Datos actualizados en el minuto a minuto.</p>
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
