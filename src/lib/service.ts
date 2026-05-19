import {
  getTeamById,
  latestResults,
  standings,
  upcomingMatches,
  teams,
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
