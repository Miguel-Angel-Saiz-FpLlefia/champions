"use client";

import { useState } from "react";
import Link from "next/link";
import { TeamBadge } from "@/components/team-badge";
import { MatchResult, Team } from "@/lib/champions-data";

interface ResultsFilterProps {
  initialResults: Array<{
    match: MatchResult;
    homeTeam: Team | null;
    awayTeam: Team | null;
  }>;
}

const STAGE_FILTERS = [
  { label: "Todos", value: "all" },
  { label: "Fase de liga / grupos", value: "liga" },
  { label: "Octavos", value: "octavos" },
  { label: "Cuartos", value: "cuartos" },
  { label: "Semifinales", value: "semifinales" },
  { label: "Final", value: "final" }
];

export function ResultsFilter({ initialResults }: ResultsFilterProps) {
  const [activeFilter, setActiveFilter] = useState("all");

  const filteredResults = initialResults.filter(({ match }) => {
    if (activeFilter === "all") return true;
    
    const stageLower = match.stage.toLowerCase();
    
    if (activeFilter === "liga") {
      return (
        stageLower.includes("liga") ||
        stageLower.includes("grupo") ||
        stageLower.includes("jornada")
      );
    }
    
    if (activeFilter === "octavos") {
      return stageLower.includes("octavo");
    }
    
    if (activeFilter === "cuartos") {
      return stageLower.includes("cuarto");
    }
    
    if (activeFilter === "semifinales") {
      return stageLower.includes("semifinal");
    }
    
    if (activeFilter === "final") {
      // Avoid matching "semifinal" or "octavos de final" when filtering for just "final"
      return stageLower === "final" || (stageLower.includes("final") && !stageLower.includes("semi") && !stageLower.includes("octavo") && !stageLower.includes("cuarto"));
    }

    return true;
  });

  return (
    <div className="space-y-8">
      {/* Selector de filtros */}
      <div className="flex flex-wrap gap-2 p-1.5 bg-white/5 rounded-2xl border border-white/5 backdrop-blur-md">
        {STAGE_FILTERS.map((filter) => (
          <button
            key={filter.value}
            onClick={() => setActiveFilter(filter.value)}
            className={`px-4 py-2 text-xs font-semibold rounded-xl transition-all duration-300 ${
              activeFilter === filter.value
                ? "bg-cyan-500 text-[#050b1d] shadow-[0_0_12px_rgba(6,182,212,0.3)] font-bold"
                : "text-white/70 hover:text-white hover:bg-white/5"
            }`}
          >
            {filter.label}
          </button>
        ))}
      </div>

      {/* Resultados filtrados */}
      <div className="space-y-4">
        {filteredResults.length === 0 ? (
          <div className="text-center py-12 rounded-3xl border border-white/5 bg-white/5">
            <p className="text-sm text-white/50">No hay partidos en esta fase.</p>
          </div>
        ) : (
          filteredResults.map(({ match, homeTeam, awayTeam }) => {
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
                    <span className="text-[10px] bg-cyan-500/10 text-cyan-400 px-1.5 py-0.5 rounded border border-cyan-500/25 font-medium">
                      Detalles
                    </span>
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
          })
        )}
      </div>
    </div>
  );
}
