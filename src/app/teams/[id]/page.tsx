import Link from "next/link";
import { notFound } from "next/navigation";

import { SiteHeader } from "@/components/site-header";
import { TeamBadge } from "@/components/team-badge";
import {
  getTeamById,
  getTeamBySlug,
  latestResults,
  standings,
  teams,
  upcomingMatches,
} from "@/lib/champions-data";

export function generateStaticParams() {
  return teams.map((team) => ({ id: team.id }));
}

type TeamPageProps = {
  params: Promise<{ id: string }>;
};

export default async function TeamPage({ params }: TeamPageProps) {
  const { id } = await params;
  const team = getTeamBySlug(id);

  if (!team) {
    notFound();
  }

  const recentMatches = latestResults.filter(
    (match) => match.homeTeamId === team.id || match.awayTeamId === team.id,
  );
  const upcoming = upcomingMatches.filter(
    (match) => match.homeTeamId === team.id || match.awayTeamId === team.id,
  );
  const standing = standings.find((row) => row.teamId === team.id);

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
          <div className="rounded-3xl border border-white/10 bg-white/5 p-6">
            <h2 className="text-lg font-semibold">Resultados recientes</h2>
            <div className="mt-4 space-y-3">
              {recentMatches.length === 0 ? (
                <p className="text-sm text-white/60">
                  No hay resultados recientes disponibles.
                </p>
              ) : (
                recentMatches.map((match) => {
                  const home = getTeamById(match.homeTeamId);
                  const away = getTeamById(match.awayTeamId);

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
                        <span className="text-lg font-semibold">
                          {match.homeScore} - {match.awayScore}
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
                {upcoming.length === 0 ? (
                  <p className="text-sm text-white/60">
                    No hay partidos programados.
                  </p>
                ) : (
                  upcoming.map((match) => {
                    const home = getTeamById(match.homeTeamId);
                    const away = getTeamById(match.awayTeamId);

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
