import { SiteHeader } from "@/components/site-header";
import { ResultsFilter } from "@/components/results-filter";
import { getMatches, getTeam } from "@/lib/service";

export const dynamic = "force-dynamic";

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
        <div className="mb-8">
          <p className="text-xs uppercase tracking-[0.3em] text-white/60">
            Resultados
          </p>
          <h1 className="font-display text-4xl uppercase tracking-wide">
            Resultados de Partidos
          </h1>
        </div>

        <ResultsFilter initialResults={resultsWithTeams} />
      </main>
    </div>
  );
}

