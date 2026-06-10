"use client";

import React, { useEffect, useState } from "react";
import { useAuth } from "@/lib/auth-context";
import { SiteHeader } from "@/components/site-header";
import {
  getMatches,
  getTeams,
  getAllProfiles,
  upsertMatch,
  deleteMatch,
  upsertTeam,
  deleteTeam,
  updateUserProfileRole,
  getMatchEvents,
  saveMatchEvents,
  getPlayersByTeamId,
  upsertPlayer,
  deletePlayer,
} from "@/lib/service";

export default function DashboardPage() {
  const { user, profile, loading: authLoading } = useAuth();
  const [activeTab, setActiveTab] = useState<"matches" | "teams" | "players" | "users">("matches");

  // Estados de datos
  const [matches, setMatches] = useState<any[]>([]);
  const [teams, setTeams] = useState<any[]>([]);
  const [profiles, setProfiles] = useState<any[]>([]);
  const [loadingData, setLoadingData] = useState(false);

  // Estados de formulario partidos
  const [editingMatch, setEditingMatch] = useState<any>(null);
  const [matchId, setMatchId] = useState("");
  const [matchStage, setMatchStage] = useState("Octavos de final");
  const [matchDate, setMatchDate] = useState("");
  const [homeTeamId, setHomeTeamId] = useState("");
  const [awayTeamId, setAwayTeamId] = useState("");
  const [homeScore, setHomeScore] = useState("0");
  const [awayScore, setAwayScore] = useState("0");
  const [matchStatus, setMatchStatus] = useState("Finalizado");

  // Sub-estados para eventos de partido
  const [matchEvents, setMatchEvents] = useState<any[]>([]);
  const [newEventType, setNewEventType] = useState<"goal" | "card">("goal");
  const [newEventTeamId, setNewEventTeamId] = useState("");
  const [newEventMinute, setNewEventMinute] = useState("");
  const [newEventPlayer, setNewEventPlayer] = useState("");
  const [newEventDetail, setNewEventDetail] = useState("");

  // Estados de formulario equipos
  const [editingTeam, setEditingTeam] = useState<any>(null);
  const [teamId, setTeamId] = useState("");
  const [teamName, setTeamName] = useState("");
  const [teamShortName, setTeamShortName] = useState("");
  const [teamCountry, setTeamCountry] = useState("");
  const [teamCode, setTeamCode] = useState("");
  const [teamColorFrom, setTeamColorFrom] = useState("#000000");
  const [teamColorTo, setTeamColorTo] = useState("#ffffff");
  const [teamLogoUrl, setTeamLogoUrl] = useState("");

  // Estados para pestaña de jugadores
  const [selectedTeamId, setSelectedTeamId] = useState("");
  const [players, setPlayers] = useState<any[]>([]);
  const [editingPlayer, setEditingPlayer] = useState<any>(null);
  const [playerName, setPlayerName] = useState("");
  const [playerNumber, setPlayerNumber] = useState("");
  const [playerPosition, setPlayerPosition] = useState("MED");

  const [notification, setNotification] = useState({ message: "", type: "" });

  const isAuthorized = profile?.role === "Administrador" || profile?.role === "editor";
  const isAdmin = profile?.role === "Administrador";

  // Cargar datos según la pestaña activa
  const loadData = async () => {
    setLoadingData(true);
    try {
      if (activeTab === "matches") {
        const data = await getMatches();
        setMatches(data);
      } else if (activeTab === "teams" || activeTab === "players") {
        const data = await getTeams();
        setTeams(data);
      } else if (activeTab === "users" && isAdmin) {
        const data = await getAllProfiles();
        setProfiles(data);
      }
    } catch (err) {
      showNotification("Error al cargar los datos.", "error");
    } finally {
      setLoadingData(false);
    }
  };

  // Cargar jugadores cuando cambia el equipo seleccionado en la pestaña de jugadores
  const loadPlayersForSelectedTeam = async () => {
    if (!selectedTeamId) {
      setPlayers([]);
      return;
    }
    setLoadingData(true);
    try {
      const data = await getPlayersByTeamId(selectedTeamId);
      setPlayers(data);
    } catch (err) {
      showNotification("Error al cargar jugadores del equipo.", "error");
    } finally {
      setLoadingData(false);
    }
  };

  useEffect(() => {
    if (isAuthorized && !authLoading) {
      loadData();
    }
  }, [activeTab, isAuthorized, authLoading]);

  useEffect(() => {
    if (activeTab === "players" && selectedTeamId) {
      loadPlayersForSelectedTeam();
    }
  }, [selectedTeamId, activeTab]);

  const showNotification = (message: string, type: "success" | "error" = "success") => {
    setNotification({ message, type });
    setTimeout(() => {
      setNotification({ message: "", type: "" });
    }, 4000);
  };

  // CRUD PARTIDOS
  const handleSaveMatch = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!homeTeamId || !awayTeamId) {
      showNotification("Selecciona los equipos local y visitante.", "error");
      return;
    }
    if (homeTeamId === awayTeamId) {
      showNotification("Un equipo no puede jugar contra sí mismo.", "error");
      return;
    }

    try {
      const finalMatchId = editingMatch
        ? editingMatch.id
        : matchId || `${homeTeamId}-${awayTeamId}-${new Date().toISOString().slice(0, 10)}`;

      const matchData = {
        id: finalMatchId,
        stage: matchStage,
        date: matchDate || new Date().toLocaleDateString("es-ES", { day: "numeric", month: "short", year: "numeric" }),
        homeTeamId,
        awayTeamId,
        homeScore,
        awayScore,
        status: matchStatus,
      };

      await upsertMatch(matchData);
      await saveMatchEvents(finalMatchId, matchEvents);

      showNotification(editingMatch ? "Partido y eventos actualizados." : "Partido y eventos creados.");
      resetMatchForm();
      loadData();
    } catch (err: any) {
      showNotification("Error al guardar el partido: " + err.message, "error");
    }
  };

  const handleEditMatchClick = async (match: any) => {
    setEditingMatch(match);
    setMatchId(match.id);
    setMatchStage(match.stage);
    setMatchDate(match.date);
    setHomeTeamId(match.homeTeamId);
    setAwayTeamId(match.awayTeamId);
    setHomeScore(match.homeScore.toString());
    setAwayScore(match.awayScore.toString());
    setMatchStatus(match.status);

    try {
      const events = await getMatchEvents(match.id);
      setMatchEvents(
        events.map((e) => ({
          type: e.type,
          teamId: e.team_id,
          minute: e.minute.toString(),
          player: e.player,
          detail: e.detail || "",
        }))
      );
    } catch (err) {
      setMatchEvents([]);
    }
  };

  const handleDeleteMatchClick = async (id: string) => {
    if (!confirm("¿Estás seguro de que deseas eliminar este partido?")) return;

    try {
      await deleteMatch(id);
      showNotification("Partido eliminado con éxito.");
      loadData();
    } catch (err: any) {
      showNotification("Error al eliminar el partido: " + err.message, "error");
    }
  };

  const resetMatchForm = () => {
    setEditingMatch(null);
    setMatchId("");
    setMatchStage("Octavos de final");
    setMatchDate("");
    setHomeTeamId("");
    setAwayTeamId("");
    setHomeScore("0");
    setAwayScore("0");
    setMatchStatus("Finalizado");
    setMatchEvents([]);
  };

  const handleAddEvent = () => {
    if (!newEventTeamId || !newEventMinute || !newEventPlayer) {
      showNotification("Rellena el equipo, minuto y jugador del evento.", "error");
      return;
    }

    const event = {
      type: newEventType,
      teamId: newEventTeamId,
      minute: newEventMinute,
      player: newEventPlayer,
      detail: newEventDetail,
    };

    setMatchEvents((prev) => [...prev, event].sort((a, b) => parseInt(a.minute) - parseInt(b.minute)));
    setNewEventMinute("");
    setNewEventPlayer("");
    setNewEventDetail("");
  };

  const handleRemoveEvent = (index: number) => {
    setMatchEvents((prev) => prev.filter((_, i) => i !== index));
  };

  // CRUD EQUIPOS
  const handleSaveTeam = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!teamId || !teamName || !teamShortName || !teamCode) {
      showNotification("Rellena todos los campos obligatorios.", "error");
      return;
    }

    try {
      const teamData = {
        id: teamId,
        name: teamName,
        shortName: teamShortName,
        country: teamCountry,
        code: teamCode.toUpperCase(),
        colors: {
          from: teamColorFrom,
          to: teamColorTo,
        },
        logoUrl: teamLogoUrl,
      };

      await upsertTeam(teamData);
      showNotification(editingTeam ? "Equipo actualizado con éxito." : "Equipo creado con éxito.");
      setEditingTeam(null);
      resetTeamForm();
      loadData();
    } catch (err: any) {
      showNotification("Error al guardar el equipo: " + err.message, "error");
    }
  };

  const handleEditTeamClick = (team: any) => {
    setEditingTeam(team);
    setTeamId(team.id);
    setTeamName(team.name);
    setTeamShortName(team.shortName);
    setTeamCountry(team.country);
    setTeamCode(team.code);
    setTeamColorFrom(team.colors.from);
    setTeamColorTo(team.colors.to);
    setTeamLogoUrl(team.logoUrl || "");
  };

  const handleDeleteTeamClick = async (id: string) => {
    if (!confirm("¿Estás seguro de que deseas eliminar este equipo?")) return;

    try {
      await deleteTeam(id);
      showNotification("Equipo eliminado con éxito.");
      loadData();
    } catch (err: any) {
      showNotification("Error al eliminar el equipo: " + err.message, "error");
    }
  };

  const resetTeamForm = () => {
    setEditingTeam(null);
    setTeamId("");
    setTeamName("");
    setTeamShortName("");
    setTeamCountry("");
    setTeamCode("");
    setTeamColorFrom("#000000");
    setTeamColorTo("#ffffff");
    setTeamLogoUrl("");
  };

  // CRUD JUGADORES
  const handleSavePlayer = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!selectedTeamId) {
      showNotification("Selecciona un equipo primero.", "error");
      return;
    }
    if (!playerName || !playerNumber || !playerPosition) {
      showNotification("Rellena todos los campos del jugador.", "error");
      return;
    }

    try {
      const playerData = {
        id: editingPlayer ? editingPlayer.id : undefined,
        teamId: selectedTeamId,
        name: playerName,
        number: playerNumber,
        position: playerPosition,
      };

      await upsertPlayer(playerData);
      showNotification(editingPlayer ? "Jugador actualizado." : "Jugador agregado.");
      resetPlayerForm();
      loadPlayersForSelectedTeam();
    } catch (err: any) {
      showNotification("Error al guardar jugador: " + err.message, "error");
    }
  };

  const handleEditPlayerClick = (player: any) => {
    setEditingPlayer(player);
    setPlayerName(player.name);
    setPlayerNumber(player.number.toString());
    setPlayerPosition(player.position);
  };

  const handleDeletePlayerClick = async (id: string) => {
    if (!confirm("¿Estás seguro de que deseas eliminar este jugador?")) return;

    try {
      await deletePlayer(id);
      showNotification("Jugador eliminado con éxito.");
      loadPlayersForSelectedTeam();
    } catch (err: any) {
      showNotification("Error al eliminar jugador: " + err.message, "error");
    }
  };

  const resetPlayerForm = () => {
    setEditingPlayer(null);
    setPlayerName("");
    setPlayerNumber("");
    setPlayerPosition("MED");
  };

  // CRUD USUARIOS (CAMBIAR ROLES)
  const handleRoleChange = async (userId: string, newRole: any) => {
    try {
      await updateUserProfileRole(userId, newRole);
      showNotification("Rol de usuario actualizado con éxito.");
      loadData();
    } catch (err: any) {
      showNotification("Error al actualizar el rol: " + err.message, "error");
    }
  };

  if (authLoading) {
    return (
      <div className="min-h-screen bg-[#050b1d] text-white flex flex-col">
        <SiteHeader />
        <main className="flex-grow flex items-center justify-center">
          <p className="text-white/60">Verificando credenciales...</p>
        </main>
      </div>
    );
  }

  if (!isAuthorized) {
    return (
      <div className="min-h-screen bg-[#050b1d] text-white flex flex-col">
        <SiteHeader />
        <main className="flex-grow flex flex-col items-center justify-center p-6 text-center">
          <span className="text-5xl mb-4">🚫</span>
          <h1 className="font-display text-3xl tracking-wide uppercase text-red-400">Acceso Denegado</h1>
          <p className="text-white/60 max-w-sm mt-2">
            No tienes los permisos necesarios para acceder a esta sección. Debes ser Administrador o Editor.
          </p>
        </main>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-[#050b1d] text-white flex flex-col justify-between">
      <SiteHeader />

      <main className="relative flex-grow mx-auto w-full max-w-6xl px-6 py-10">
        <div className="pointer-events-none absolute right-[-10%] top-[-10%] h-80 w-80 rounded-full bg-[radial-gradient(circle_at_center,rgba(76,155,255,0.3),rgba(7,18,46,0))] blur-3xl" />
        
        {/* Banner de Notificaciones */}
        {notification.message && (
          <div
            className={`fixed bottom-6 right-6 z-50 px-6 py-4 rounded-xl border text-sm shadow-2xl transition-all duration-300 ${
              notification.type === "error"
                ? "bg-red-500/10 border-red-500/20 text-red-300"
                : "bg-emerald-500/10 border-emerald-500/20 text-emerald-300"
            }`}
          >
            {notification.type === "error" ? "❌ " : "✅ "} {notification.message}
          </div>
        )}

        <div className="flex flex-col md:flex-row items-start md:items-center justify-between gap-4 border-b border-white/10 pb-6 mb-8">
          <div>
            <h1 className="font-display text-4xl tracking-wide uppercase">Panel de Control</h1>
            <p className="text-white/50 text-sm mt-1">
              Gestiona los partidos, equipos, plantillas de jugadores y roles de usuario.
            </p>
          </div>
          <span className="px-3 py-1 rounded-full bg-yellow-500/10 text-yellow-400 border border-yellow-500/25 text-xs font-bold uppercase tracking-wider">
            Sesión: {profile?.role}
          </span>
        </div>

        {/* Pestañas del Dashboard */}
        <div className="flex border-b border-white/10 mb-8 overflow-x-auto whitespace-nowrap">
          <button
            onClick={() => { setActiveTab("matches"); resetMatchForm(); }}
            className={`flex-1 pb-4 text-center text-sm font-semibold uppercase tracking-wider border-b-2 transition min-w-[100px] ${
              activeTab === "matches"
                ? "border-cyan-400 text-cyan-400"
                : "border-transparent text-white/50 hover:text-white"
            }`}
          >
            Partidos
          </button>
          <button
            onClick={() => { setActiveTab("teams"); resetTeamForm(); }}
            className={`flex-1 pb-4 text-center text-sm font-semibold uppercase tracking-wider border-b-2 transition min-w-[100px] ${
              activeTab === "teams"
                ? "border-cyan-400 text-cyan-400"
                : "border-transparent text-white/50 hover:text-white"
            }`}
          >
            Equipos
          </button>
          <button
            onClick={() => { setActiveTab("players"); resetPlayerForm(); }}
            className={`flex-1 pb-4 text-center text-sm font-semibold uppercase tracking-wider border-b-2 transition min-w-[100px] ${
              activeTab === "players"
                ? "border-cyan-400 text-cyan-400"
                : "border-transparent text-white/50 hover:text-white"
            }`}
          >
            Jugadores
          </button>
          {isAdmin && (
            <button
              onClick={() => setActiveTab("users")}
              className={`flex-1 pb-4 text-center text-sm font-semibold uppercase tracking-wider border-b-2 transition min-w-[100px] ${
                activeTab === "users"
                  ? "border-cyan-400 text-cyan-400"
                  : "border-transparent text-white/50 hover:text-white"
              }`}
            >
              Usuarios
            </button>
          )}
        </div>

        {/* Tab 1: PARTIDOS */}
        {activeTab === "matches" && (
          <div className="grid gap-8 lg:grid-cols-[1.1fr_1.4fr]">
            <div className="rounded-3xl border border-white/10 bg-white/5 p-6 backdrop-blur-md h-fit space-y-6">
              <div>
                <h2 className="text-lg font-bold uppercase tracking-wider text-cyan-400">
                  {editingMatch ? "Editar Partido" : "Agregar Partido"}
                </h2>
                <p className="text-xs text-white/40 mt-0.5">Define los datos del encuentro y sus goles o tarjetas.</p>
              </div>

              <form onSubmit={handleSaveMatch} className="space-y-4">
                {!editingMatch && (
                  <div>
                    <label className="block text-xs font-semibold uppercase tracking-wider text-white/60 mb-2">
                      ID del Partido (opcional)
                    </label>
                    <input
                      type="text"
                      value={matchId}
                      onChange={(e) => setMatchId(e.target.value)}
                      placeholder="Ej: rma-bar-2025"
                      className="w-full rounded-xl border border-white/10 bg-[#050b1d]/50 px-3 py-2 text-sm text-white placeholder-white/30 focus:border-cyan-400 focus:outline-none transition"
                    />
                  </div>
                )}
                <div className="grid grid-cols-2 gap-4">
                  <div>
                    <label className="block text-xs font-semibold uppercase tracking-wider text-white/60 mb-2">
                      Fase
                    </label>
                    <select
                      value={matchStage}
                      onChange={(e) => setMatchStage(e.target.value)}
                      className="w-full rounded-xl border border-white/10 bg-[#050b1d]/80 px-3 py-2 text-sm text-white focus:border-cyan-400 focus:outline-none transition"
                    >
                      <option value="Fase de liga">Fase de liga</option>
                      <option value="Octavos de final">Octavos de final</option>
                      <option value="Cuartos de final">Cuartos de final</option>
                      <option value="Semifinales">Semifinales</option>
                      <option value="Final">Final</option>
                    </select>
                  </div>
                  <div>
                    <label className="block text-xs font-semibold uppercase tracking-wider text-white/60 mb-2">
                      Fecha
                    </label>
                    <input
                      type="text"
                      value={matchDate}
                      onChange={(e) => setMatchDate(e.target.value)}
                      placeholder="Ej: 4 Mar 2025"
                      className="w-full rounded-xl border border-white/10 bg-[#050b1d]/50 px-3 py-2 text-sm text-white placeholder-white/30 focus:border-cyan-400 focus:outline-none transition"
                    />
                  </div>
                </div>
                <div className="grid grid-cols-2 gap-4">
                  <div>
                    <label className="block text-xs font-semibold uppercase tracking-wider text-white/60 mb-2">
                      Equipo Local
                    </label>
                    <select
                      value={homeTeamId}
                      onChange={(e) => setHomeTeamId(e.target.value)}
                      className="w-full rounded-xl border border-white/10 bg-[#050b1d]/80 px-3 py-2 text-sm text-white focus:border-cyan-400 focus:outline-none transition"
                    >
                      <option value="">Seleccionar...</option>
                      {teams.map((t) => (
                        <option key={t.id} value={t.id}>{t.name}</option>
                      ))}
                    </select>
                  </div>
                  <div>
                    <label className="block text-xs font-semibold uppercase tracking-wider text-white/60 mb-2">
                      Equipo Visitante
                    </label>
                    <select
                      value={awayTeamId}
                      onChange={(e) => setAwayTeamId(e.target.value)}
                      className="w-full rounded-xl border border-white/10 bg-[#050b1d]/80 px-3 py-2 text-sm text-white focus:border-cyan-400 focus:outline-none transition"
                    >
                      <option value="">Seleccionar...</option>
                      {teams.map((t) => (
                        <option key={t.id} value={t.id}>{t.name}</option>
                      ))}
                    </select>
                  </div>
                </div>
                <div className="grid grid-cols-3 gap-4">
                  <div>
                    <label className="block text-xs font-semibold uppercase tracking-wider text-white/60 mb-2">
                      Goles Local
                    </label>
                    <input
                      type="number"
                      min="0"
                      value={homeScore}
                      onChange={(e) => setHomeScore(e.target.value)}
                      className="w-full rounded-xl border border-white/10 bg-[#050b1d]/50 px-3 py-2 text-sm text-white focus:border-cyan-400 focus:outline-none transition"
                    />
                  </div>
                  <div>
                    <label className="block text-xs font-semibold uppercase tracking-wider text-white/60 mb-2">
                      Goles Visitante
                    </label>
                    <input
                      type="number"
                      min="0"
                      value={awayScore}
                      onChange={(e) => setAwayScore(e.target.value)}
                      className="w-full rounded-xl border border-white/10 bg-[#050b1d]/50 px-3 py-2 text-sm text-white focus:border-cyan-400 focus:outline-none transition"
                    />
                  </div>
                  <div>
                    <label className="block text-xs font-semibold uppercase tracking-wider text-white/60 mb-2">
                      Estado
                    </label>
                    <select
                      value={matchStatus}
                      onChange={(e) => setMatchStatus(e.target.value)}
                      className="w-full rounded-xl border border-white/10 bg-[#050b1d]/80 px-3 py-2 text-sm text-white focus:border-cyan-400 focus:outline-none transition"
                    >
                      <option value="Finalizado">Finalizado</option>
                      <option value="En juego">En juego</option>
                    </select>
                  </div>
                </div>

                {/* Sub-formulario para agregar eventos */}
                <div className="border-t border-white/10 pt-4 space-y-3">
                  <h3 className="text-xs font-bold uppercase tracking-wider text-cyan-300">
                    Cronología (Goles y Tarjetas)
                  </h3>

                  <div className="space-y-2 max-h-[150px] overflow-y-auto pr-1">
                    {matchEvents.length === 0 ? (
                      <p className="text-[11px] text-white/40 italic">No hay eventos añadidos.</p>
                    ) : (
                      matchEvents.map((evt, idx) => (
                        <div
                          key={idx}
                          className="flex items-center justify-between text-xs bg-[#050b1d]/60 border border-white/5 p-2 rounded-lg"
                        >
                          <span className="font-semibold text-cyan-400">{evt.minute}&apos;</span>
                          <span className="text-lg">{evt.type === "goal" ? "⚽" : "🟨"}</span>
                          <span className="truncate max-w-[100px] font-medium">{evt.player}</span>
                          <span className="text-white/40 truncate max-w-[100px]">{evt.detail}</span>
                          <button
                            type="button"
                            onClick={() => handleRemoveEvent(idx)}
                            className="text-rose-400 hover:text-rose-300 font-bold px-1.5"
                          >
                            ×
                          </button>
                        </div>
                      ))
                    )}
                  </div>

                  <div className="bg-[#050b1d]/40 p-3 rounded-xl border border-white/5 space-y-2">
                    <div className="grid grid-cols-2 gap-2">
                      <select
                        value={newEventType}
                        onChange={(e: any) => setNewEventType(e.target.value)}
                        className="rounded-lg border border-white/10 bg-[#050b1d] px-2 py-1 text-xs text-white"
                      >
                        <option value="goal">Gol ⚽</option>
                        <option value="card">Tarjeta 🟨</option>
                      </select>
                      <select
                        value={newEventTeamId}
                        onChange={(e) => setNewEventTeamId(e.target.value)}
                        className="rounded-lg border border-white/10 bg-[#050b1d] px-2 py-1 text-xs text-white"
                      >
                        <option value="">Equipo...</option>
                        {homeTeamId && (
                          <option value={homeTeamId}>Local ({homeTeamId.substring(0,3).toUpperCase()})</option>
                        )}
                        {awayTeamId && (
                          <option value={awayTeamId}>Visitante ({awayTeamId.substring(0,3).toUpperCase()})</option>
                        )}
                      </select>
                    </div>
                    <div className="grid grid-cols-3 gap-2">
                      <input
                        type="number"
                        min="1"
                        max="120"
                        placeholder="Minuto"
                        value={newEventMinute}
                        onChange={(e) => setNewEventMinute(e.target.value)}
                        className="rounded-lg border border-white/10 bg-[#050b1d] px-2 py-1 text-xs text-white"
                      />
                      <input
                        type="text"
                        placeholder="Jugador"
                        value={newEventPlayer}
                        onChange={(e) => setNewEventPlayer(e.target.value)}
                        className="col-span-2 rounded-lg border border-white/10 bg-[#050b1d] px-2 py-1 text-xs text-white"
                      />
                    </div>
                    <div className="flex gap-2">
                      <input
                        type="text"
                        placeholder="Detalle (Asist., Amarilla, Roja)"
                        value={newEventDetail}
                        onChange={(e) => setNewEventDetail(e.target.value)}
                        className="flex-grow rounded-lg border border-white/10 bg-[#050b1d] px-2 py-1 text-xs text-white"
                      />
                      <button
                        type="button"
                        onClick={handleAddEvent}
                        className="px-3 py-1 rounded-lg bg-cyan-500/10 text-cyan-400 font-semibold border border-cyan-500/30 text-xs hover:bg-cyan-500/20"
                      >
                        + Añadir
                      </button>
                    </div>
                  </div>
                </div>

                <div className="flex gap-2 pt-2 border-t border-white/10">
                  <button
                    type="submit"
                    className="flex-1 py-2.5 rounded-xl bg-cyan-500 font-semibold text-[#050b1d] text-xs hover:bg-cyan-400 transition"
                  >
                    Guardar Partido
                  </button>
                  {editingMatch && (
                    <button
                      type="button"
                      onClick={resetMatchForm}
                      className="px-4 py-2.5 rounded-xl border border-white/10 bg-white/5 font-semibold text-white text-xs hover:bg-white/10 transition"
                    >
                      Cancelar
                    </button>
                  )}
                </div>
              </form>
            </div>

            {/* Listado */}
            <div className="rounded-3xl border border-white/10 bg-white/5 p-6 backdrop-blur-md overflow-x-auto">
              <h2 className="text-lg font-bold mb-4 uppercase tracking-wider text-white">
                Partidos Registrados ({matches.length})
              </h2>
              {loadingData ? (
                <p className="text-white/40 text-sm">Cargando partidos...</p>
              ) : (
                <table className="w-full text-left text-sm border-collapse">
                  <thead>
                    <tr className="border-b border-white/10 text-white/50 text-xs uppercase">
                      <th className="py-2.5">Fase</th>
                      <th className="py-2.5">Encuentro</th>
                      <th className="py-2.5 text-center">Score</th>
                      <th className="py-2.5 text-right">Acciones</th>
                    </tr>
                  </thead>
                  <tbody>
                    {matches.map((m) => (
                      <tr key={m.id} className="border-b border-white/5 hover:bg-white/5 transition">
                        <td className="py-3 font-semibold text-xs text-cyan-300">{m.stage}</td>
                        <td className="py-3 text-xs sm:text-sm">
                          {m.homeTeamId} <span className="text-white/40">vs</span> {m.awayTeamId}
                        </td>
                        <td className="py-3 text-center font-bold">{m.homeScore} - {m.awayScore}</td>
                        <td className="py-3 text-right">
                          <button
                            onClick={() => handleEditMatchClick(m)}
                            className="mr-2 px-2.5 py-1 rounded bg-cyan-500/10 text-cyan-400 text-xs font-semibold border border-cyan-500/20 hover:bg-cyan-500/20 transition"
                          >
                            Editar
                          </button>
                          <button
                            onClick={() => handleDeleteMatchClick(m.id)}
                            className="px-2.5 py-1 rounded bg-rose-500/10 text-rose-400 text-xs font-semibold border border-rose-500/20 hover:bg-rose-500/20 transition"
                          >
                            Borrar
                          </button>
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              )}
            </div>
          </div>
        )}

        {/* Tab 2: EQUIPOS */}
        {activeTab === "teams" && (
          <div className="grid gap-8 lg:grid-cols-[1fr_1.8fr]">
            <div className="rounded-3xl border border-white/10 bg-white/5 p-6 backdrop-blur-md h-fit">
              <h2 className="text-lg font-bold mb-4 uppercase tracking-wider text-cyan-400">
                {editingTeam ? "Editar Equipo" : "Agregar Equipo"}
              </h2>
              <form onSubmit={handleSaveTeam} className="space-y-4">
                <div>
                  <label className="block text-xs font-semibold uppercase tracking-wider text-white/60 mb-2">
                    ID del Equipo
                  </label>
                  <input
                    type="text"
                    value={teamId}
                    onChange={(e) => setTeamId(e.target.value)}
                    disabled={Boolean(editingTeam)}
                    placeholder="ej: real-madrid"
                    required
                    className="w-full rounded-xl border border-white/10 bg-[#050b1d]/50 px-3 py-2 text-sm text-white placeholder-white/30 focus:border-cyan-400 focus:outline-none transition disabled:opacity-50"
                  />
                </div>
                <div>
                  <label className="block text-xs font-semibold uppercase tracking-wider text-white/60 mb-2">
                    Nombre Completo
                  </label>
                  <input
                    type="text"
                    value={teamName}
                    onChange={(e) => setTeamName(e.target.value)}
                    placeholder="Real Madrid"
                    required
                    className="w-full rounded-xl border border-white/10 bg-[#050b1d]/50 px-3 py-2 text-sm text-white placeholder-white/30 focus:border-cyan-400 focus:outline-none transition"
                  />
                </div>
                <div>
                  <label className="block text-xs font-semibold uppercase tracking-wider text-white/60 mb-2">
                    Nombre Corto
                  </label>
                  <input
                    type="text"
                    value={teamShortName}
                    onChange={(e) => setTeamShortName(e.target.value)}
                    placeholder="Madrid"
                    required
                    className="w-full rounded-xl border border-white/10 bg-[#050b1d]/50 px-3 py-2 text-sm text-white placeholder-white/30 focus:border-cyan-400 focus:outline-none transition"
                  />
                </div>
                <div className="grid grid-cols-2 gap-4">
                  <div>
                    <label className="block text-xs font-semibold uppercase tracking-wider text-white/60 mb-2">
                      País
                    </label>
                    <input
                      type="text"
                      value={teamCountry}
                      onChange={(e) => setTeamCountry(e.target.value)}
                      placeholder="Espana"
                      required
                      className="w-full rounded-xl border border-white/10 bg-[#050b1d]/50 px-3 py-2 text-sm text-white placeholder-white/30 focus:border-cyan-400 focus:outline-none transition"
                    />
                  </div>
                  <div>
                    <label className="block text-xs font-semibold uppercase tracking-wider text-white/60 mb-2">
                      Código
                    </label>
                    <input
                      type="text"
                      maxLength={3}
                      value={teamCode}
                      onChange={(e) => setTeamCode(e.target.value)}
                      placeholder="RMA"
                      required
                      className="w-full rounded-xl border border-white/10 bg-[#050b1d]/50 px-3 py-2 text-sm text-white placeholder-white/30 focus:border-cyan-400 focus:outline-none transition"
                    />
                  </div>
                </div>
                <div className="grid grid-cols-2 gap-4">
                  <div>
                    <label className="block text-xs font-semibold uppercase tracking-wider text-white/60 mb-2">
                      Color de inicio
                    </label>
                    <input
                      type="color"
                      value={teamColorFrom}
                      onChange={(e) => setTeamColorFrom(e.target.value)}
                      className="w-full h-10 rounded-xl border border-white/10 bg-[#050b1d]/50 px-1 py-1 focus:border-cyan-400 focus:outline-none transition cursor-pointer"
                    />
                  </div>
                  <div>
                    <label className="block text-xs font-semibold uppercase tracking-wider text-white/60 mb-2">
                      Color de fin
                    </label>
                    <input
                      type="color"
                      value={teamColorTo}
                      onChange={(e) => setTeamColorTo(e.target.value)}
                      className="w-full h-10 rounded-xl border border-white/10 bg-[#050b1d]/50 px-1 py-1 focus:border-cyan-400 focus:outline-none transition cursor-pointer"
                    />
                  </div>
                </div>
                <div>
                  <label className="block text-xs font-semibold uppercase tracking-wider text-white/60 mb-2">
                    URL del Logotipo
                  </label>
                  <input
                    type="url"
                    value={teamLogoUrl}
                    onChange={(e) => setTeamLogoUrl(e.target.value)}
                    placeholder="https://..."
                    className="w-full rounded-xl border border-white/10 bg-[#050b1d]/50 px-3 py-2 text-sm text-white placeholder-white/30 focus:border-cyan-400 focus:outline-none transition"
                  />
                </div>
                <div className="flex gap-2 pt-2">
                  <button
                    type="submit"
                    className="flex-1 py-2.5 rounded-xl bg-cyan-500 font-semibold text-[#050b1d] text-xs hover:bg-cyan-400 transition"
                  >
                    Guardar
                  </button>
                  {editingTeam && (
                    <button
                      type="button"
                      onClick={resetTeamForm}
                      className="px-4 py-2.5 rounded-xl border border-white/10 bg-white/5 font-semibold text-white text-xs hover:bg-white/10 transition"
                    >
                      Cancelar
                    </button>
                  )}
                </div>
              </form>
            </div>

            {/* Listado */}
            <div className="rounded-3xl border border-white/10 bg-white/5 p-6 backdrop-blur-md overflow-x-auto">
              <h2 className="text-lg font-bold mb-4 uppercase tracking-wider text-white">
                Equipos Registrados ({teams.length})
              </h2>
              {loadingData ? (
                <p className="text-white/40 text-sm">Cargando equipos...</p>
              ) : (
                <table className="w-full text-left text-sm border-collapse">
                  <thead>
                    <tr className="border-b border-white/10 text-white/50 text-xs uppercase">
                      <th className="py-2.5">Código</th>
                      <th className="py-2.5">Nombre</th>
                      <th className="py-2.5">País</th>
                      <th className="py-2.5 text-right">Acciones</th>
                    </tr>
                  </thead>
                  <tbody>
                    {teams.map((t) => (
                      <tr key={t.id} className="border-b border-white/5 hover:bg-white/5 transition">
                        <td className="py-3 font-semibold text-xs text-cyan-300">{t.code}</td>
                        <td className="py-3 text-sm font-semibold">{t.name}</td>
                        <td className="py-3 text-xs text-white/60">{t.country}</td>
                        <td className="py-3 text-right">
                          <button
                            onClick={() => handleEditTeamClick(t)}
                            className="mr-2 px-2.5 py-1 rounded bg-cyan-500/10 text-cyan-400 text-xs font-semibold border border-cyan-500/20 hover:bg-cyan-500/20 transition"
                          >
                            Editar
                          </button>
                          <button
                            onClick={() => handleDeleteTeamClick(t.id)}
                            className="px-2.5 py-1 rounded bg-rose-500/10 text-rose-400 text-xs font-semibold border border-rose-500/20 hover:bg-rose-500/20 transition"
                          >
                            Borrar
                          </button>
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              )}
            </div>
          </div>
        )}

        {/* Tab 3: JUGADORES */}
        {activeTab === "players" && (
          <div className="grid gap-8 lg:grid-cols-[1fr_1.8fr]">
            {/* Formulario */}
            <div className="rounded-3xl border border-white/10 bg-white/5 p-6 backdrop-blur-md h-fit space-y-4">
              <h2 className="text-lg font-bold uppercase tracking-wider text-cyan-400">
                {editingPlayer ? "Editar Jugador" : "Agregar Jugador"}
              </h2>

              <div>
                <label className="block text-xs font-semibold uppercase tracking-wider text-white/60 mb-2">
                  Seleccionar Equipo
                </label>
                <select
                  value={selectedTeamId}
                  onChange={(e) => setSelectedTeamId(e.target.value)}
                  className="w-full rounded-xl border border-white/10 bg-[#050b1d]/85 px-3 py-2.5 text-sm text-white focus:border-cyan-400 focus:outline-none transition"
                >
                  <option value="">Selecciona un equipo...</option>
                  {teams.map((t) => (
                    <option key={t.id} value={t.id}>{t.name}</option>
                  ))}
                </select>
              </div>

              {selectedTeamId && (
                <form onSubmit={handleSavePlayer} className="space-y-4 pt-2 border-t border-white/10">
                  <div>
                    <label className="block text-xs font-semibold uppercase tracking-wider text-white/60 mb-2">
                      Nombre del Jugador
                    </label>
                    <input
                      type="text"
                      value={playerName}
                      onChange={(e) => setPlayerName(e.target.value)}
                      placeholder="Ej: Ousmane Dembélé"
                      required
                      className="w-full rounded-xl border border-white/10 bg-[#050b1d]/50 px-3 py-2 text-sm text-white focus:border-cyan-400 focus:outline-none transition"
                    />
                  </div>
                  <div className="grid grid-cols-2 gap-4">
                    <div>
                      <label className="block text-xs font-semibold uppercase tracking-wider text-white/60 mb-2">
                        Dorsal (#)
                      </label>
                      <input
                        type="number"
                        min="1"
                        max="99"
                        value={playerNumber}
                        onChange={(e) => setPlayerNumber(e.target.value)}
                        placeholder="Ej: 10"
                        required
                        className="w-full rounded-xl border border-white/10 bg-[#050b1d]/50 px-3 py-2 text-sm text-white focus:border-cyan-400 focus:outline-none transition"
                      />
                    </div>
                    <div>
                      <label className="block text-xs font-semibold uppercase tracking-wider text-white/60 mb-2">
                        Demarcación
                      </label>
                      <select
                        value={playerPosition}
                        onChange={(e) => setPlayerPosition(e.target.value)}
                        className="w-full rounded-xl border border-white/10 bg-[#050b1d]/85 px-3 py-2 text-sm text-white focus:border-cyan-400 focus:outline-none transition"
                      >
                        <option value="POR">Portero (POR)</option>
                        <option value="DEF">Defensa (DEF)</option>
                        <option value="MED">Centrocampista (MED)</option>
                        <option value="DEL">Delantero (DEL)</option>
                        <option value="SUB">Suplente (SUB)</option>
                      </select>
                    </div>
                  </div>

                  <div className="flex gap-2 pt-2">
                    <button
                      type="submit"
                      className="flex-grow py-2.5 rounded-xl bg-cyan-500 font-semibold text-[#050b1d] text-xs hover:bg-cyan-400 transition"
                    >
                      Guardar Jugador
                    </button>
                    {editingPlayer && (
                      <button
                        type="button"
                        onClick={resetPlayerForm}
                        className="px-4 py-2.5 rounded-xl border border-white/10 bg-white/5 font-semibold text-white text-xs hover:bg-white/10 transition"
                      >
                        Cancelar
                      </button>
                    )}
                  </div>
                </form>
              )}
            </div>

            {/* Listado */}
            <div className="rounded-3xl border border-white/10 bg-white/5 p-6 backdrop-blur-md overflow-x-auto">
              <h2 className="text-lg font-bold mb-4 uppercase tracking-wider text-white">
                Plantilla del Equipo
              </h2>
              {!selectedTeamId ? (
                <p className="text-white/40 text-sm">Selecciona un equipo a la izquierda para cargar sus jugadores.</p>
              ) : loadingData ? (
                <p className="text-white/40 text-sm">Cargando plantilla...</p>
              ) : players.length === 0 ? (
                <p className="text-white/40 text-sm">No hay jugadores registrados para este equipo.</p>
              ) : (
                <table className="w-full text-left text-sm border-collapse">
                  <thead>
                    <tr className="border-b border-white/10 text-white/50 text-xs uppercase">
                      <th className="py-2.5">#</th>
                      <th className="py-2.5">Nombre</th>
                      <th className="py-2.5">Posición</th>
                      <th className="py-2.5 text-right">Acciones</th>
                    </tr>
                  </thead>
                  <tbody>
                    {players.map((p) => (
                      <tr key={p.id} className="border-b border-white/5 hover:bg-white/5 transition">
                        <td className="py-3 font-mono text-cyan-300 font-semibold">#{p.number}</td>
                        <td className="py-3 text-sm font-semibold">{p.name}</td>
                        <td className="py-3">
                          <span className="px-2 py-0.5 rounded text-[10px] font-bold uppercase bg-white/10 text-white/70">
                            {p.position}
                          </span>
                        </td>
                        <td className="py-3 text-right">
                          <button
                            onClick={() => handleEditPlayerClick(p)}
                            className="mr-2 px-2.5 py-1 rounded bg-cyan-500/10 text-cyan-400 text-xs font-semibold border border-cyan-500/20 hover:bg-cyan-500/20 transition"
                          >
                            Editar
                          </button>
                          <button
                            onClick={() => handleDeletePlayerClick(p.id)}
                            className="px-2.5 py-1 rounded bg-rose-500/10 text-rose-400 text-xs font-semibold border border-rose-500/20 hover:bg-rose-500/20 transition"
                          >
                            Borrar
                          </button>
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              )}
            </div>
          </div>
        )}

        {/* Tab 4: USUARIOS (Solo Admin) */}
        {activeTab === "users" && isAdmin && (
          <div className="rounded-3xl border border-white/10 bg-white/5 p-6 backdrop-blur-md overflow-x-auto">
            <h2 className="text-lg font-bold mb-4 uppercase tracking-wider text-cyan-400">
              Gestión de Roles de Usuario
            </h2>
            {loadingData ? (
              <p className="text-white/40 text-sm">Cargando perfiles...</p>
            ) : (
              <table className="w-full text-left text-sm border-collapse">
                <thead>
                  <tr className="border-b border-white/10 text-white/50 text-xs uppercase">
                    <th className="py-2.5">ID del Usuario</th>
                    <th className="py-2.5">Correo</th>
                    <th className="py-2.5">Rol Actual</th>
                    <th className="py-2.5 text-right">Asignar Nuevo Rol</th>
                  </tr>
                </thead>
                <tbody>
                  {profiles.map((p) => (
                    <tr key={p.id} className="border-b border-white/5 hover:bg-white/5 transition">
                      <td className="py-3 font-mono text-[10px] text-white/50 max-w-[120px] truncate">{p.id}</td>
                      <td className="py-3 font-medium text-xs sm:text-sm">{p.email}</td>
                      <td className="py-3">
                        <span className="px-2 py-0.5 rounded text-[10px] font-bold uppercase bg-white/10 text-white">
                          {p.role}
                        </span>
                      </td>
                      <td className="py-3 text-right">
                        {p.id === user?.id ? (
                          <span className="text-[10px] text-white/40 font-semibold italic">
                            (Tu propia cuenta)
                          </span>
                        ) : (
                          <select
                            value={p.role}
                            onChange={(e) => handleRoleChange(p.id, e.target.value)}
                            className="rounded-xl border border-white/10 bg-[#050b1d] px-2.5 py-1 text-xs text-white focus:border-cyan-400 focus:outline-none transition cursor-pointer"
                          >
                            <option value="usuario normal">usuario normal</option>
                            <option value="editor">editor</option>
                            <option value="Administrador">Administrador</option>
                          </select>
                        )}
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            )}
          </div>
        )}
      </main>

      <footer className="py-6 border-t border-white/5 text-center text-xs text-white/45">
        &copy; {new Date().getFullYear()} Fútbol 360. Panel de Administración.
      </footer>
    </div>
  );
}
