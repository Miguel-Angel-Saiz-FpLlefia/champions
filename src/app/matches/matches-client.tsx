"use client";

import { useState } from "react";
import Link from "next/link";
import { TeamBadge } from "@/components/team-badge";
import type { MatchResult } from "@/lib/champions-data";
import { getTeamById } from "@/lib/champions-data";

const PHASES = [
  "Todos",
  "Fase de liga",
  "Octavos de final",
  "Cuartos de final",
  "Semifinales",
  "Final"
];

export function MatchesClient({ results }: { results: MatchResult[] }) {
  const [filter, setFilter] = useState("Todos");

  const filteredResults = results.filter((match) => {
    if (filter === "Todos") return true;
    return match.stage.includes(filter);
  });

  return (
    <div>
      {/* Filtros */}
      <div className="mt-8 flex flex-wrap gap-2">
        {PHASES.map((phase) => (
          <button
            key={phase}
            onClick={() => setFilter(phase)}
            className={`rounded-full px-4 py-2 text-sm font-semibold transition ${
              filter === phase
                ? "bg-cyan-500 text-[#050b1d]"
                : "bg-white/10 text-white/70 hover:bg-white/20 hover:text-white"
            }`}
          >
            {phase}
          </button>
        ))}
      </div>

      <section className="mt-8 rounded-3xl border border-white/10 bg-white/5 p-6">
        <h2 className="text-lg font-semibold">
          {filter === "Todos" ? "Todos los partidos" : filter}
        </h2>
        
        {filteredResults.length === 0 ? (
          <p className="mt-4 text-white/50 text-sm">No hay partidos en esta fase.</p>
        ) : (
          <div className="mt-4 space-y-4">
            {filteredResults.map((match) => {
              const homeTeam = getTeamById(match.homeTeamId);
              const awayTeam = getTeamById(match.awayTeamId);

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
                    <span className="flex items-center gap-1.5">
                      {match.stage}
                      <span className="text-[10px] bg-cyan-500/10 text-cyan-400 px-1.5 py-0.5 rounded border border-cyan-500/25">Detalles</span>
                    </span>
                  </div>
                  <div className="mt-3 flex items-center justify-between">
                    <div className="flex items-center gap-3 w-[40%]">
                      <TeamBadge team={homeTeam} size="sm" />
                      <span className="text-sm font-semibold truncate hidden sm:block">
                        {homeTeam.name}
                      </span>
                      <span className="text-sm font-semibold sm:hidden">
                        {homeTeam.shortName}
                      </span>
                    </div>
                    <span className="text-xl font-bold bg-white/10 px-4 py-1 rounded-lg">
                      {match.homeScore} - {match.awayScore}
                    </span>
                    <div className="flex items-center gap-3 w-[40%] justify-end">
                      <span className="text-sm font-semibold truncate hidden sm:block text-right">
                        {awayTeam.name}
                      </span>
                      <span className="text-sm font-semibold sm:hidden text-right">
                        {awayTeam.shortName}
                      </span>
                      <TeamBadge team={awayTeam} size="sm" />
                    </div>
                  </div>
                </Link>
              );
            })}
          </div>
        )}
      </section>
    </div>
  );
}
