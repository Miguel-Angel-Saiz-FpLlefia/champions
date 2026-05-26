"use client";

import { useState } from "react";
import type { MatchDetails, Team } from "@/lib/champions-data";

interface MatchDetailsTabsProps {
  details: MatchDetails;
  homeTeam: Team;
  awayTeam: Team;
}

export function MatchDetailsTabs({ details, homeTeam, awayTeam }: MatchDetailsTabsProps) {
  const [activeTab, setActiveTab] = useState<"lineups" | "stats" | "events">("lineups");

  const homeColor = homeTeam.colors.from;
  const awayColor = awayTeam.colors.from;

  // Separar los eventos por equipo
  const homeEvents = details.events.filter((e) => e.teamId === homeTeam.id);
  const awayEvents = details.events.filter((e) => e.teamId === awayTeam.id);

  return (
    <div className="mt-8">
      {/* Selector de pestañas */}
      <div className="flex border-b border-white/10">
        <button
          onClick={() => setActiveTab("lineups")}
          className={`flex-1 pb-4 text-sm font-semibold tracking-wider uppercase transition border-b-2 ${
            activeTab === "lineups"
              ? "border-cyan-400 text-cyan-400"
              : "border-transparent text-white/50 hover:text-white"
          }`}
        >
          Alineaciones
        </button>
        <button
          onClick={() => setActiveTab("stats")}
          className={`flex-1 pb-4 text-sm font-semibold tracking-wider uppercase transition border-b-2 ${
            activeTab === "stats"
              ? "border-cyan-400 text-cyan-400"
              : "border-transparent text-white/50 hover:text-white"
          }`}
        >
          Estadísticas
        </button>
        <button
          onClick={() => setActiveTab("events")}
          className={`flex-1 pb-4 text-sm font-semibold tracking-wider uppercase transition border-b-2 ${
            activeTab === "events"
              ? "border-cyan-400 text-cyan-400"
              : "border-transparent text-white/50 hover:text-white"
          }`}
        >
          Goles y Tarjetas
        </button>
      </div>

      {/* Contenido de la pestaña activa */}
      <div className="mt-8">
        {activeTab === "lineups" && (
          <div className="grid gap-8 md:grid-cols-2">
            {/* Alineación Local */}
            <div className="rounded-3xl border border-white/10 bg-white/5 p-6 backdrop-blur-sm relative overflow-hidden">
              <div 
                className="absolute top-0 left-0 w-2 h-full"
                style={{ backgroundColor: homeColor }}
              />
              <div className="flex items-center justify-between border-b border-white/10 pb-4">
                <h3 className="font-semibold text-lg">{homeTeam.name}</h3>
                <span className="rounded-full bg-white/10 px-3 py-1 text-xs font-mono text-white/70">
                  {details.homeLineup.formation}
                </span>
              </div>
              
              <div className="mt-6">
                <h4 className="text-xs font-bold uppercase tracking-wider text-white/40 mb-3">Titulares</h4>
                <div className="space-y-3">
                  {details.homeLineup.starters.map((starter, i) => (
                    <div key={i} className="flex items-center justify-between py-1.5 border-b border-white/5">
                      <div className="flex items-center gap-3">
                        <span className="flex h-6 w-6 items-center justify-center rounded-full bg-white/10 text-xs font-bold text-white/80">
                          {starter.player.number}
                        </span>
                        <span className="text-sm font-medium">{starter.player.name}</span>
                      </div>
                      <span className="text-xs font-semibold text-cyan-400/80 bg-cyan-950/40 px-2 py-0.5 rounded">
                        {starter.position}
                      </span>
                    </div>
                  ))}
                </div>
              </div>

              <div className="mt-8">
                <h4 className="text-xs font-bold uppercase tracking-wider text-white/40 mb-3">Suplentes</h4>
                <div className="grid grid-cols-1 sm:grid-cols-2 gap-x-4 gap-y-2">
                  {details.homeLineup.substitutes.map((sub, i) => (
                    <div key={i} className="flex items-center gap-2 text-sm text-white/75 py-1">
                      <span className="text-xs font-mono text-white/40">#{sub.number}</span>
                      <span>{sub.name}</span>
                    </div>
                  ))}
                </div>
              </div>

              {details.homeLineup.substitutions.length > 0 && (
                <div className="mt-8 border-t border-white/10 pt-6">
                  <h4 className="text-xs font-bold uppercase tracking-wider text-white/40 mb-3">Cambios</h4>
                  <div className="space-y-3">
                    {details.homeLineup.substitutions.map((sub, i) => (
                      <div key={i} className="flex items-center gap-3 text-sm">
                        <span className="text-xs font-semibold bg-white/10 px-2 py-0.5 rounded text-white/60">
                          {sub.minute}&apos;
                        </span>
                        <div className="flex items-center gap-1.5 flex-1 min-w-0">
                          <span className="text-emerald-400 truncate">{sub.playerIn}</span>
                          <span className="text-white/40 text-xs">▲</span>
                        </div>
                        <div className="flex items-center gap-1.5 flex-1 min-w-0 justify-end text-right">
                          <span className="text-white/40 text-xs">▼</span>
                          <span className="text-rose-400 truncate">{sub.playerOut}</span>
                        </div>
                      </div>
                    ))}
                  </div>
                </div>
              )}
            </div>

            {/* Alineación Visitante */}
            <div className="rounded-3xl border border-white/10 bg-white/5 p-6 backdrop-blur-sm relative overflow-hidden">
              <div 
                className="absolute top-0 right-0 w-2 h-full"
                style={{ backgroundColor: awayColor }}
              />
              <div className="flex items-center justify-between border-b border-white/10 pb-4">
                <h3 className="font-semibold text-lg">{awayTeam.name}</h3>
                <span className="rounded-full bg-white/10 px-3 py-1 text-xs font-mono text-white/70">
                  {details.awayLineup.formation}
                </span>
              </div>
              
              <div className="mt-6">
                <h4 className="text-xs font-bold uppercase tracking-wider text-white/40 mb-3">Titulares</h4>
                <div className="space-y-3">
                  {details.awayLineup.starters.map((starter, i) => (
                    <div key={i} className="flex items-center justify-between py-1.5 border-b border-white/5">
                      <div className="flex items-center gap-3">
                        <span className="flex h-6 w-6 items-center justify-center rounded-full bg-white/10 text-xs font-bold text-white/80">
                          {starter.player.number}
                        </span>
                        <span className="text-sm font-medium">{starter.player.name}</span>
                      </div>
                      <span className="text-xs font-semibold text-cyan-400/80 bg-cyan-950/40 px-2 py-0.5 rounded">
                        {starter.position}
                      </span>
                    </div>
                  ))}
                </div>
              </div>

              <div className="mt-8">
                <h4 className="text-xs font-bold uppercase tracking-wider text-white/40 mb-3">Suplentes</h4>
                <div className="grid grid-cols-1 sm:grid-cols-2 gap-x-4 gap-y-2">
                  {details.awayLineup.substitutes.map((sub, i) => (
                    <div key={i} className="flex items-center gap-2 text-sm text-white/75 py-1">
                      <span className="text-xs font-mono text-white/40">#{sub.number}</span>
                      <span>{sub.name}</span>
                    </div>
                  ))}
                </div>
              </div>

              {details.awayLineup.substitutions.length > 0 && (
                <div className="mt-8 border-t border-white/10 pt-6">
                  <h4 className="text-xs font-bold uppercase tracking-wider text-white/40 mb-3">Cambios</h4>
                  <div className="space-y-3">
                    {details.awayLineup.substitutions.map((sub, i) => (
                      <div key={i} className="flex items-center gap-3 text-sm">
                        <span className="text-xs font-semibold bg-white/10 px-2 py-0.5 rounded text-white/60">
                          {sub.minute}&apos;
                        </span>
                        <div className="flex items-center gap-1.5 flex-1 min-w-0">
                          <span className="text-emerald-400 truncate">{sub.playerIn}</span>
                          <span className="text-white/40 text-xs">▲</span>
                        </div>
                        <div className="flex items-center gap-1.5 flex-1 min-w-0 justify-end text-right">
                          <span className="text-white/40 text-xs">▼</span>
                          <span className="text-rose-400 truncate">{sub.playerOut}</span>
                        </div>
                      </div>
                    ))}
                  </div>
                </div>
              )}
            </div>
          </div>
        )}

        {activeTab === "stats" && (
          <div className="rounded-3xl border border-white/10 bg-white/5 p-6 md:p-8 backdrop-blur-sm max-w-3xl mx-auto">
            <h3 className="font-semibold text-lg mb-8 text-center border-b border-white/10 pb-4">
              Estadísticas del Partido
            </h3>
            
            <div className="space-y-6">
              {/* Función para renderizar una fila de estadística */}
              {Object.entries({
                xg: { label: "xG (Goles Esperados)", isFloat: true },
                possession: { label: "Posesión de balón", suffix: "%" },
                shots: { label: "Remates totales" },
                shotsOnTarget: { label: "Remates al arco" },
                passes: { label: "Pases totales" },
                passAccuracy: { label: "Precisión de pases", suffix: "%" },
                fouls: { label: "Faltas cometidas" },
                yellowCards: { label: "Tarjetas amarillas" },
                redCards: { label: "Tarjetas rojas" },
                corners: { label: "Tiros de esquina" },
                offsides: { label: "Fueras de juego" }
              }).map(([key, config]) => {
                const homeVal = details.stats[key as keyof typeof details.stats][0];
                const awayVal = details.stats[key as keyof typeof details.stats][1];
                const total = homeVal + awayVal || 1;
                
                const homePercent = (homeVal / total) * 100;
                const awayPercent = (awayVal / total) * 100;

                const isHomeWin = homeVal > awayVal;
                const isAwayWin = awayVal > homeVal;

                return (
                  <div key={key} className="space-y-2">
                    <div className="flex justify-between text-sm font-semibold">
                      <span className={`text-base ${isHomeWin ? "text-white font-bold" : "text-white/60"}`}>
                        {config.isFloat ? homeVal.toFixed(1) : homeVal}
                        {config.suffix}
                      </span>
                      <span className="text-white/50 text-xs uppercase tracking-wider">{config.label}</span>
                      <span className={`text-base ${isAwayWin ? "text-white font-bold" : "text-white/60"}`}>
                        {config.isFloat ? awayVal.toFixed(1) : awayVal}
                        {config.suffix}
                      </span>
                    </div>
                    {/* Barra de progreso de dos extremos */}
                    <div className="h-2 w-full rounded-full bg-white/10 flex overflow-hidden">
                      <div
                        className="h-full transition-all duration-500"
                        style={{
                          width: `${homePercent}%`,
                          backgroundColor: homeColor,
                          opacity: isHomeWin ? 1 : 0.6
                        }}
                      />
                      <div
                        className="h-full transition-all duration-500 ml-auto"
                        style={{
                          width: `${awayPercent}%`,
                          backgroundColor: awayColor,
                          opacity: isAwayWin ? 1 : 0.6
                        }}
                      />
                    </div>
                  </div>
                );
              })}
            </div>
          </div>
        )}

        {activeTab === "events" && (
          <div className="rounded-3xl border border-white/10 bg-white/5 p-6 backdrop-blur-sm max-w-2xl mx-auto">
            <h3 className="font-semibold text-lg mb-8 text-center border-b border-white/10 pb-4">
              Cronología de Eventos
            </h3>
            
            {details.events.length === 0 ? (
              <p className="text-center text-white/50 py-8">No se registraron goles ni tarjetas en este partido.</p>
            ) : (
              <div className="relative border-l-2 border-white/10 pl-6 ml-4 md:ml-32 space-y-8">
                {details.events.map((event, index) => {
                  const isHome = event.teamId === homeTeam.id;
                  const team = isHome ? homeTeam : awayTeam;

                  return (
                    <div key={index} className="relative group">
                      {/* Círculo indicador del minuto */}
                      <span className="absolute -left-[35px] top-0 flex h-6.5 w-6.5 items-center justify-center rounded-full bg-[#050b1d] border-2 border-cyan-500 text-[10px] font-bold text-cyan-400">
                        {event.minute}&apos;
                      </span>

                      {/* Caja del evento */}
                      <div className="flex flex-col md:flex-row md:items-center gap-4 bg-white/5 rounded-2xl p-4 border border-white/5 hover:border-white/10 transition">
                        {/* Icono del evento */}
                        <div className="flex items-center gap-3">
                          {event.type === "goal" ? (
                            <span className="flex h-8 w-8 items-center justify-center rounded-full bg-emerald-500/20 text-emerald-400 text-lg">
                              ⚽
                            </span>
                          ) : event.detail?.includes("Roja") ? (
                            <span className="flex h-8 w-8 items-center justify-center rounded-full bg-rose-500/20 text-rose-500 text-lg">
                              🟥
                            </span>
                          ) : (
                            <span className="flex h-8 w-8 items-center justify-center rounded-full bg-yellow-500/20 text-yellow-400 text-lg">
                              🟨
                            </span>
                          )}
                          <div>
                            <span className="text-xs uppercase tracking-wider font-semibold text-white/40">
                              {team.name}
                            </span>
                            <p className="font-bold text-white">{event.player}</p>
                          </div>
                        </div>

                        {event.detail && (
                          <div className="md:ml-auto text-sm text-white/60 bg-white/5 px-3 py-1 rounded-full">
                            {event.detail}
                          </div>
                        )}
                      </div>
                    </div>
                  );
                })}
              </div>
            )}
          </div>
        )}
      </div>
    </div>
  );
}
