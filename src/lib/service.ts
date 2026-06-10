import { supabase } from "./supabase";
import {
  Team,
  MatchResult,
  StandingsRow,
  MatchDetails,
  teams as localTeams,
  latestResults as localMatches,
  standings as localStandings,
  generateMatchDetails,
  getTeamSquad
} from "./champions-data";

// Mapeadores de base de datos a modelos TypeScript
const mapTeam = (row: any): Team => ({
  id: row.id,
  name: row.name,
  shortName: row.short_name,
  country: row.country,
  code: row.code,
  colors: {
    from: row.color_from,
    to: row.color_to
  },
  logoUrl: row.logo_url || undefined
});

const mapMatch = (row: any): MatchResult => ({
  id: row.id,
  stage: row.stage,
  date: row.date,
  homeTeamId: row.home_team_id,
  awayTeamId: row.away_team_id,
  homeScore: row.home_score,
  awayScore: row.away_score,
  status: row.status as "Finalizado" | "En juego"
});

const mapStanding = (row: any): StandingsRow => ({
  position: row.position,
  teamId: row.team_id,
  played: row.played,
  gd: row.gd,
  points: row.points
});

export const getMatches = async (): Promise<MatchResult[]> => {
  const { data, error } = await supabase
    .from("matches")
    .select("*");

  if (error || !data) {
    console.warn("Error fetching matches from Supabase, falling back to local data.");
    return localMatches;
  }
  return data.map(mapMatch);
};

export const getUpcomingMatches = async (): Promise<any[]> => {
  // Actualmente la edición 24/25 está terminada y no hay próximos partidos programados
  return [];
};

export const getStandings = async (): Promise<StandingsRow[]> => {
  const { data, error } = await supabase
    .from("standings")
    .select("*")
    .order("position", { ascending: true });

  if (error || !data) {
    console.warn("Error fetching standings from Supabase, falling back to local data.");
    return localStandings;
  }
  return data.map(mapStanding);
};

export const getTeams = async (): Promise<Team[]> => {
  const { data, error } = await supabase
    .from("teams")
    .select("*");

  if (error || !data) {
    console.warn("Error fetching teams from Supabase, falling back to local data.");
    return localTeams;
  }
  return data.map(mapTeam);
};

export const getTeam = async (id: string): Promise<Team | null> => {
  const { data, error } = await supabase
    .from("teams")
    .select("*")
    .eq("id", id)
    .single();

  if (error || !data) {
    const local = localTeams.find((t) => t.id === id);
    return local || null;
  }
  return mapTeam(data);
};

export const getMatchById = async (id: string): Promise<MatchResult | null> => {
  const { data, error } = await supabase
    .from("matches")
    .select("*")
    .eq("id", id)
    .single();

  if (error || !data) {
    const local = localMatches.find((m) => m.id === id);
    return local || null;
  }
  return mapMatch(data);
};

export const getMatchDetails = async (id: string): Promise<MatchDetails | null> => {
  const match = await getMatchById(id);
  if (!match) return null;

  // 1. Obtener detalles (alineación base, stats) si existen
  const { data: detailsRow } = await supabase
    .from("match_details")
    .select("*")
    .eq("match_id", id)
    .single();

  // 2. Obtener eventos reales
  const { data: eventsRows } = await supabase
    .from("match_events")
    .select("*")
    .eq("match_id", id)
    .order("minute", { ascending: true });

  // 3. Obtener jugadores reales de la base de datos para ambos equipos
  const { data: players } = await supabase
    .from("players")
    .select("*")
    .in("team_id", [match.homeTeamId, match.awayTeamId]);

  const homePlayers = players?.filter((p) => p.team_id === match.homeTeamId) || [];
  const awayPlayers = players?.filter((p) => p.team_id === match.awayTeamId) || [];

  // Si no hay ningún jugador en la base de datos para estos equipos, es un equipo offline; caemos en el generador estático
  if (homePlayers.length === 0 && awayPlayers.length === 0) {
    console.warn("No players found in DB for matches, falling back to local generator.");
    return generateMatchDetails(match);
  }

  // Construir alineación local (dinámica basada en BD o con placeholders si no hay)
  const homeLineup = {
    formation: detailsRow?.home_formation || "4-3-3",
    starters: homePlayers.length > 0
      ? homePlayers
        .filter((p) => p.position !== "SUB")
        .map((p) => ({ player: { name: p.name, number: p.number }, position: p.position }))
      : [],
    substitutes: homePlayers.length > 0
      ? homePlayers
        .filter((p) => p.position === "SUB")
        .map((p) => ({ name: p.name, number: p.number }))
      : [],
    substitutions: detailsRow?.home_substitutions || []
  };

  // Construir alineación visitante
  const awayLineup = {
    formation: detailsRow?.away_formation || "4-3-3",
    starters: awayPlayers.length > 0
      ? awayPlayers
        .filter((p) => p.position !== "SUB")
        .map((p) => ({ player: { name: p.name, number: p.number }, position: p.position }))
      : [],
    substitutes: awayPlayers.length > 0
      ? awayPlayers
        .filter((p) => p.position === "SUB")
        .map((p) => ({ name: p.name, number: p.number }))
      : [],
    substitutions: detailsRow?.away_substitutions || []
  };

  // Construir estadísticas (reales o a cero por defecto)
  const stats = detailsRow?.stats || {
    xg: [0.0, 0.0],
    shots: [0, 0],
    corners: [0, 0],
    passes: [0, 0],
    fouls: [0, 0],
    offsides: [0, 0],
    possession: [50, 50],
    redCards: [0, 0],
    yellowCards: [0, 0],
    passAccuracy: [0, 0],
    shotsOnTarget: [0, 0]
  };

  // Mapear eventos reales
  const events = (eventsRows || []).map((e) => ({
    type: e.type as "goal" | "card",
    teamId: e.team_id,
    minute: e.minute,
    player: e.player,
    detail: e.detail || undefined
  }));

  return {
    matchId: id,
    homeLineup,
    awayLineup,
    stats,
    events
  };
};

export const getTeamSquadById = async (teamId: string): Promise<any> => {
  const { data: playersRows, error } = await supabase
    .from("players")
    .select("*")
    .eq("team_id", teamId);

  if (error || !playersRows || playersRows.length === 0) {
    return getTeamSquad(teamId);
  }

  const starters = playersRows
    .filter((p) => p.position !== "SUB")
    .map((p) => ({ name: p.name, number: p.number, pos: p.position }));

  const substitutes = playersRows
    .filter((p) => p.position === "SUB")
    .map((p) => ({ name: p.name, number: p.number }));

  return { starters, substitutes };
};

export const getCommentsByMatchId = async (matchId: string): Promise<any[]> => {
  const { data, error } = await supabase
    .from("comments")
    .select("*, profiles(email, role)")
    .eq("match_id", matchId)
    .order("created_at", { ascending: true });

  if (error) {
    console.error("Error fetching comments from Supabase:", error.message);
    return [];
  }
  return data || [];
};

export const createComment = async (
  matchId: string,
  userId: string,
  content: string
): Promise<any> => {
  const { data, error } = await supabase
    .from("comments")
    .insert([
      {
        match_id: matchId,
        user_id: userId,
        content: content
      }
    ])
    .select("*, profiles(email, role)")
    .single();

  if (error) {
    console.error("Error creating comment in Supabase:", error.message);
    throw error;
  }
  return data;
};

export const upsertMatch = async (matchData: any): Promise<any> => {
  const { data, error } = await supabase
    .from("matches")
    .upsert({
      id: matchData.id,
      stage: matchData.stage,
      date: matchData.date,
      home_team_id: matchData.homeTeamId,
      away_team_id: matchData.awayTeamId,
      home_score: parseInt(matchData.homeScore),
      away_score: parseInt(matchData.awayScore),
      status: matchData.status
    })
    .select()
    .single();

  if (error) {
    console.error("Error saving match in Supabase:", error.message);
    throw error;
  }
  return data;
};

export const deleteMatch = async (id: string): Promise<void> => {
  const { error } = await supabase
    .from("matches")
    .delete()
    .eq("id", id);

  if (error) {
    console.error("Error deleting match in Supabase:", error.message);
    throw error;
  }
};

export const upsertTeam = async (teamData: any): Promise<any> => {
  const { data, error } = await supabase
    .from("teams")
    .upsert({
      id: teamData.id,
      name: teamData.name,
      short_name: teamData.shortName,
      country: teamData.country,
      code: teamData.code,
      color_from: teamData.colors.from,
      color_to: teamData.colors.to,
      logo_url: teamData.logoUrl || null
    })
    .select()
    .single();

  if (error) {
    console.error("Error saving team in Supabase:", error.message);
    throw error;
  }
  return data;
};

export const deleteTeam = async (id: string): Promise<void> => {
  const { error } = await supabase
    .from("teams")
    .delete()
    .eq("id", id);

  if (error) {
    console.error("Error deleting team in Supabase:", error.message);
    throw error;
  }
};

export const getAllProfiles = async (): Promise<any[]> => {
  const { data, error } = await supabase
    .from("profiles")
    .select("*")
    .order("created_at", { ascending: true });

  if (error) {
    console.error("Error fetching profiles from Supabase:", error.message);
    return [];
  }
  return data || [];
};

export const updateUserProfileRole = async (
  userId: string,
  newRole: "Administrador" | "editor" | "usuario normal"
): Promise<any> => {
  const { data, error } = await supabase
    .from("profiles")
    .update({ role: newRole })
    .eq("id", userId)
    .select()
    .single();

  if (error) {
    console.error("Error updating user role in Supabase:", error.message);
    throw error;
  }
  return data;
};

export const getMatchEvents = async (matchId: string): Promise<any[]> => {
  const { data, error } = await supabase
    .from("match_events")
    .select("*")
    .eq("match_id", matchId)
    .order("minute", { ascending: true });

  if (error) {
    console.error("Error fetching match events from Supabase:", error.message);
    return [];
  }
  return data || [];
};

export const saveMatchEvents = async (matchId: string, events: any[]): Promise<void> => {
  // Eliminar eventos anteriores
  const { error: deleteError } = await supabase
    .from("match_events")
    .delete()
    .eq("match_id", matchId);

  if (deleteError) {
    console.error("Error clearing existing match events:", deleteError.message);
    throw deleteError;
  }

  if (events.length === 0) return;

  // Insertar nuevos eventos
  const { error: insertError } = await supabase
    .from("match_events")
    .insert(
      events.map((e) => ({
        match_id: matchId,
        type: e.type,
        team_id: e.team_id || e.teamId,
        minute: parseInt(e.minute),
        player: e.player,
        detail: e.detail || null
      }))
    );

  if (insertError) {
    console.error("Error saving match events:", insertError.message);
    throw insertError;
  }
};

export const getPlayersByTeamId = async (teamId: string): Promise<any[]> => {
  const { data, error } = await supabase
    .from("players")
    .select("*")
    .eq("team_id", teamId)
    .order("number", { ascending: true });

  if (error) {
    console.error("Error fetching players from Supabase:", error.message);
    return [];
  }
  return data || [];
};

export const upsertPlayer = async (playerData: any): Promise<any> => {
  const { data, error } = await supabase
    .from("players")
    .upsert({
      id: playerData.id || undefined,
      team_id: playerData.teamId,
      name: playerData.name,
      number: parseInt(playerData.number),
      position: playerData.position
    })
    .select()
    .single();

  if (error) {
    console.error("Error saving player in Supabase:", error.message);
    throw error;
  }
  return data;
};

export const deletePlayer = async (id: string): Promise<void> => {
  const { error } = await supabase
    .from("players")
    .delete()
    .eq("id", id);

  if (error) {
    console.error("Error deleting player in Supabase:", error.message);
    throw error;
  }
};




