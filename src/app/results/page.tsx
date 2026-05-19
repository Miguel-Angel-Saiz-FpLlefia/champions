import { SiteHeader } from "@/components/site-header";
import { TeamBadge } from "@/components/team-badge";
import { getTeamById, latestResults } from "@/lib/champions-data";

export default function ResultsPage() {
  return (
    <div className="min-h-screen bg-[#050b1d] text-white">
      <SiteHeader />
      <main className="mx-auto max-w-5xl px-6 pb-16 pt-10">
        <div>
          <p className="text-xs uppercase tracking-[0.3em] text-white/60">
            Resultados
          </p>
          <h1 className="font-display text-4xl uppercase tracking-wide">
            Ultimos resultados
          </h1>
        </div>

        <div className="mt-8 space-y-4">
          {latestResults.map((match) => {
            const homeTeam = getTeamById(match.homeTeamId);
            const awayTeam = getTeamById(match.awayTeamId);

            if (!homeTeam || !awayTeam) {
              return null;
            }

            return (
              <div
                key={match.id}
                className="rounded-3xl border border-white/10 bg-white/5 p-6"
              >
                <div className="flex items-center justify-between text-xs text-white/60">
                  <span>{match.date}</span>
                  <span>{match.stage}</span>
                </div>
                <div className="mt-4 flex flex-wrap items-center justify-between gap-4">
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
                  <div className="text-2xl font-semibold">
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
      </main>
    </div>
  );
}
