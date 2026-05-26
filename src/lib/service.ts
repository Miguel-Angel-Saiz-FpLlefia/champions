import {
  getTeamById,
  latestResults,
  standings,
  upcomingMatches,
  teams,
  generateMatchDetails,
  getTeamSquad,
} from "./champions-data";

export const getMatches = async () => {
  // Simular latencia de red
  return latestResults;
};

export const getUpcomingMatches = async () => {
  return upcomingMatches;
};

export const getStandings = async () => {
  return standings;
};

export const getTeams = async () => {
  return teams;
};

export const getTeam = async (id: string) => {
  return getTeamById(id);
};

export const getMatchById = async (id: string) => {
  return latestResults.find((m) => m.id === id) || null;
};

export const getMatchDetails = async (id: string) => {
  const match = latestResults.find((m) => m.id === id);
  if (!match) return null;
  return generateMatchDetails(match);
};

export const getTeamSquadById = async (teamId: string) => {
  return getTeamSquad(teamId);
};

