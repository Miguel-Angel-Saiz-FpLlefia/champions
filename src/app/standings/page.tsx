import { SiteHeader } from "@/components/site-header";
import { TeamBadge } from "@/components/team-badge";
import { getTeamById, standings } from "@/lib/champions-data";

export default function StandingsPage() {
  return (
    <div className="min-h-screen bg-[#050b1d] text-white">
      <SiteHeader />
      <main className="mx-auto max-w-5xl px-6 pb-16 pt-10">
        <div>
          <p className="text-xs uppercase tracking-[0.3em] text-white/60">
            Clasificacion
          </p>
          <h1 className="font-display text-4xl uppercase tracking-wide">
            Tabla de la fase de liga
          </h1>
        </div>

        <div className="mt-8 rounded-3xl border border-white/10 bg-white/5 p-6">
          <div className="grid grid-cols-[40px_1fr_60px_60px] text-xs text-white/50">
            <span>#</span>
            <span>Equipo</span>
            <span className="text-right">DG</span>
            <span className="text-right">PTS</span>
          </div>
          <div className="mt-3 space-y-3">
            {standings.map((row) => {
              const team = getTeamById(row.teamId);
              if (!team) {
                return null;
              }

              return (
                <div
                  key={row.teamId}
                  className="grid grid-cols-[40px_1fr_60px_60px] items-center rounded-2xl border border-white/10 bg-[#0b1636]/70 px-4 py-3"
                >
                  <span className="text-white/70">{row.position}</span>
                  <div className="flex items-center gap-3">
                    <TeamBadge team={team} size="sm" />
                    <div>
                      <p className="text-sm font-semibold">{team.name}</p>
                      <p className="text-xs text-white/50">{team.country}</p>
                    </div>
                  </div>
                  <span className="text-right text-white/70">+{row.gd}</span>
                  <span className="text-right text-sm font-semibold">
                    {row.points}
                  </span>
                </div>
              );
            })}
          </div>
        </div>
      </main>
    </div>
  );
}
