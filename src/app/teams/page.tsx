import Link from "next/link";
import { SiteHeader } from "@/components/site-header";
import { TeamBadge } from "@/components/team-badge";
import { getTeams } from "@/lib/service";

export default async function TeamsPage() {
  const teams = await getTeams();

  return (
    <div className="min-h-screen bg-[#050b1d] text-white">
      <SiteHeader />
      <main className="mx-auto max-w-6xl px-6 pb-16 pt-10">
        <div className="flex flex-wrap items-center justify-between gap-4">
          <div>
            <p className="text-xs uppercase tracking-[0.3em] text-white/60">
              Equipos
            </p>
            <h1 className="font-display text-4xl uppercase tracking-wide">
              Clubes en la Champions
            </h1>
          </div>
          <Link
            href="/standings"
            className="rounded-full border border-white/15 px-5 py-2 text-sm font-semibold text-white/80 transition hover:border-white/30"
          >
            Ver clasificacion
          </Link>
        </div>

        <div className="mt-8 grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
          {teams.map((team) => (
            <Link
              key={team.id}
              href={`/teams/${team.id}`}
              className="rounded-2xl border border-white/10 bg-white/5 p-4 transition hover:border-white/25 hover:bg-white/10"
            >
              <div className="flex items-center gap-3">
                <TeamBadge team={team} size="md" />
                <div>
                  <p className="text-sm font-semibold">{team.name}</p>
                  <p className="text-xs text-white/60">{team.country}</p>
                </div>
              </div>
            </Link>
          ))}
        </div>
      </main>
    </div>
  );
}
