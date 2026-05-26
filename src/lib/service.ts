import { supabase } from "./supabase";
import type { Team, MatchResult, StandingsRow, MatchDetails } from "./champions-data";

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
    console.error("Error fetching matches from Supabase, falling back.", error);
    return [];
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
    console.error("Error fetching standings from Supabase", error);
    return [];
  }
  return data.map(mapStanding);
};

export const getTeams = async (): Promise<Team[]> => {
  const { data, error } = await supabase
    .from("teams")
    .select("*");

  if (error || !data) {
    console.error("Error fetching teams from Supabase", error);
    return [];
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
    return null;
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
    return null;
  }
  return mapMatch(data);
};

export const getMatchDetails = async (id: string): Promise<MatchDetails | null> => {
  const match = await getMatchById(id);
  if (!match) return null;

  // Obtener detalles reales de Supabase
  const { data: detailsRow, error: detailsError } = await supabase
    .from("match_details")
    .select("*")
    .eq("match_id", id)
    .single();

  if (detailsError || !detailsRow) {
    return null;
  }

  // Obtener eventos
  const { data: eventsRows } = await supabase
    .from("match_events")
    .select("*")
    .eq("match_id", id)
    .order("minute", { ascending: true });

  // Obtener jugadores de las plantillas (titulares y suplentes) para construir alineaciones
  const { data: players } = await supabase
    .from("players")
    .select("*")
    .in("team_id", [match.homeTeamId, match.awayTeamId]);

  const homePlayers = players?.filter((p) => p.team_id === match.homeTeamId) || [];
  const awayPlayers = players?.filter((p) => p.team_id === match.awayTeamId) || [];

  const homeLineup = {
    formation: detailsRow.home_formation,
    starters: homePlayers
      .filter((p) => p.position !== "SUB")
      .map((p) => ({ player: { name: p.name, number: p.number }, position: p.position })),
    substitutes: homePlayers
      .filter((p) => p.position === "SUB")
      .map((p) => ({ name: p.name, number: p.number })),
    substitutions: detailsRow.home_substitutions || []
  };

  const awayLineup = {
    formation: detailsRow.away_formation,
    starters: awayPlayers
      .filter((p) => p.position !== "SUB")
      .map((p) => ({ player: { name: p.name, number: p.number }, position: p.position })),
    substitutes: awayPlayers
      .filter((p) => p.position === "SUB")
      .map((p) => ({ name: p.name, number: p.number })),
    substitutions: detailsRow.away_substitutions || []
  };

  const stats = detailsRow.stats;
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
  const { data: playersRows } = await supabase
    .from("players")
    .select("*")
    .eq("team_id", teamId);

  if (!playersRows || playersRows.length === 0) {
    return { starters: [], substitutes: [] };
  }

  const starters = playersRows
    .filter((p) => p.position !== "SUB")
    .map((p) => ({ name: p.name, number: p.number, pos: p.position }));

  const substitutes = playersRows
    .filter((p) => p.position === "SUB")
    .map((p) => ({ name: p.name, number: p.number }));

  return { starters, substitutes };
};
