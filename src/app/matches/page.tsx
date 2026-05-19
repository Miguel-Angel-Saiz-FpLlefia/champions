import { SiteHeader } from "@/components/site-header";
import { getMatches } from "@/lib/service";
import { MatchesClient } from "./matches-client";

export default async function MatchesPage() {
  const results = await getMatches();

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

        <MatchesClient results={results} />
      </main>
    </div>
  );
}
