import { SiteHeader } from "@/components/site-header";
import { TeamBadge } from "@/components/team-badge";
import {
  getTeamById,
  latestResults,
  upcomingMatches,
} from "@/lib/champions-data";

export default function MatchesPage() {
  return (
    <div className="min-h-screen bg-[#050b1d] text-white">
      <SiteHeader />
      <main className="mx-auto max-w-5xl px-6 pb-16 pt-10">
        <div>
          <p className="text-xs uppercase tracking-[0.3em] text-white/60">
            Partidos
          </p>
          <h1 className="font-display text-4xl uppercase tracking-wide">
            Calendario y resultados
          </h1>
        </div>

        <section className="mt-8 rounded-3xl border border-white/10 bg-white/5 p-6">
          <h2 className="text-lg font-semibold">Proximos partidos</h2>
          <div className="mt-4 space-y-4">
            {upcomingMatches.map((match) => {
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
                  <div className="mt-3 flex items-center justify-between">
                    <div className="flex items-center gap-3">
                      <TeamBadge team={homeTeam} size="sm" />
                      <span className="text-sm font-semibold">
                        {homeTeam.shortName}
                      </span>
                    </div>
                    <span className="text-sm text-white/70">{match.time}</span>
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
        </section>

        <section className="mt-8 rounded-3xl border border-white/10 bg-white/5 p-6">
          <h2 className="text-lg font-semibold">Resultados recientes</h2>
          <div className="mt-4 space-y-4">
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
                  <div className="mt-3 flex items-center justify-between">
                    <div className="flex items-center gap-3">
                      <TeamBadge team={homeTeam} size="sm" />
                      <span className="text-sm font-semibold">
                        {homeTeam.shortName}
                      </span>
                    </div>
                    <span className="text-lg font-semibold">
                      {match.homeScore} - {match.awayScore}
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
        </section>
      </main>
    </div>
  );
}
