import Link from "next/link";
import { SiteHeader } from "@/components/site-header";
import { TeamBadge } from "@/components/team-badge";
import { getMatches, getTeam } from "@/lib/service";

export default async function ResultsPage() {
  const latestResults = await getMatches();

  const resultsWithTeams = await Promise.all(
    latestResults.map(async (match) => {
      const homeTeam = await getTeam(match.homeTeamId);
      const awayTeam = await getTeam(match.awayTeamId);
      return { match, homeTeam, awayTeam };
    })
  );

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
          {resultsWithTeams.map(({ match, homeTeam, awayTeam }) => {
            if (!homeTeam || !awayTeam) {
              return null;
            }

            return (
              <Link
                key={match.id}
                href={`/matches/${match.id}`}
                className="block rounded-3xl border border-white/10 bg-white/5 p-6 transition-all duration-300 hover:border-cyan-500/50 hover:bg-[#0e1d47]/80 hover:shadow-[0_0_20px_rgba(6,182,212,0.15)] hover:-translate-y-0.5"
              >
                <div className="flex items-center justify-between text-xs text-white/60">
                  <span>{match.date}</span>
                  <span className="flex items-center gap-1.5">
                    {match.stage}
                    <span className="text-[10px] bg-cyan-500/10 text-cyan-400 px-1.5 py-0.5 rounded border border-cyan-500/25">Detalles</span>
                  </span>
                </div>
                <div className="mt-4 flex items-center justify-between">
                  <div className="flex items-center gap-3 w-[35%] min-w-0">
                    <TeamBadge team={homeTeam} size="sm" />
                    <div className="min-w-0">
                      <p className="text-sm font-semibold truncate">
                        {homeTeam.shortName}
                      </p>
                      <p className="text-xs text-white/50 truncate">
                        {homeTeam.country}
                      </p>
                    </div>
                  </div>
                  <div className="text-2xl font-semibold bg-white/10 px-4 py-1.5 rounded-lg whitespace-nowrap flex-shrink-0 mx-2">
                    {match.homeScore} - {match.awayScore}
                  </div>
                  <div className="flex items-center gap-3 w-[35%] min-w-0 justify-end">
                    <div className="text-right min-w-0">
                      <p className="text-sm font-semibold truncate">
                        {awayTeam.shortName}
                      </p>
                      <p className="text-xs text-white/50 truncate">
                        {awayTeam.country}
                      </p>
                    </div>
                    <TeamBadge team={awayTeam} size="sm" />
                  </div>
                </div>
                <div className="mt-3 text-xs font-semibold text-cyan-300">
                  {match.status}
                </div>
              </Link>
            );
          })}
        </div>
      </main>
    </div>
  );
}
