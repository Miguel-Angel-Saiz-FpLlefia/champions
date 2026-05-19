export type Team = {
  id: string;
  name: string;
  shortName: string;
  country: string;
  code: string;
  colors: {
    from: string;
    to: string;
  };
};

export type MatchResult = {
  id: string;
  stage: string;
  date: string;
  homeTeamId: string;
  awayTeamId: string;
  homeScore: number;
  awayScore: number;
  status: "Finalizado" | "En juego";
};

export type StandingsRow = {
  position: number;
  teamId: string;
  played: number;
  gd: number;
  points: number;
};

export type UpcomingMatch = {
  id: string;
  stage: string;
  date: string;
  time: string;
  homeTeamId: string;
  awayTeamId: string;
};

export const seasonLabel = "2024-25";

export const teams: Team[] = [
  {
    id: "real-madrid",
    name: "Real Madrid",
    shortName: "Madrid",
    country: "Espana",
    code: "RMA",
    colors: { from: "#0b1f5b", to: "#e5b94a" },
  },
  {
    id: "barcelona",
    name: "Barcelona",
    shortName: "Barcelona",
    country: "Espana",
    code: "BAR",
    colors: { from: "#8f1f2e", to: "#2450ff" },
  },
  {
    id: "atletico-madrid",
    name: "Atletico Madrid",
    shortName: "Atletico",
    country: "Espana",
    code: "ATM",
    colors: { from: "#b51e2a", to: "#2d6bff" },
  },
  {
    id: "girona",
    name: "Girona",
    shortName: "Girona",
    country: "Espana",
    code: "GIR",
    colors: { from: "#c2182b", to: "#f2f2f2" },
  },
  {
    id: "manchester-city",
    name: "Manchester City",
    shortName: "Man City",
    country: "Inglaterra",
    code: "MCI",
    colors: { from: "#3b9bff", to: "#cfe8ff" },
  },
  {
    id: "arsenal",
    name: "Arsenal",
    shortName: "Arsenal",
    country: "Inglaterra",
    code: "ARS",
    colors: { from: "#8d0f1b", to: "#ffcd59" },
  },
  {
    id: "liverpool",
    name: "Liverpool",
    shortName: "Liverpool",
    country: "Inglaterra",
    code: "LIV",
    colors: { from: "#930b23", to: "#ff6a6a" },
  },
  {
    id: "aston-villa",
    name: "Aston Villa",
    shortName: "Aston Villa",
    country: "Inglaterra",
    code: "AVL",
    colors: { from: "#7b1020", to: "#9ed6ff" },
  },
  {
    id: "bayern-munich",
    name: "Bayern Munich",
    shortName: "Bayern",
    country: "Alemania",
    code: "BAY",
    colors: { from: "#9b1022", to: "#e93e7b" },
  },
  {
    id: "bayer-leverkusen",
    name: "Bayer Leverkusen",
    shortName: "Leverkusen",
    country: "Alemania",
    code: "LEV",
    colors: { from: "#bf1b1b", to: "#f3d45a" },
  },
  {
    id: "vfb-stuttgart",
    name: "VfB Stuttgart",
    shortName: "Stuttgart",
    country: "Alemania",
    code: "STU",
    colors: { from: "#c8172d", to: "#ffffff" },
  },
  {
    id: "rb-leipzig",
    name: "RB Leipzig",
    shortName: "Leipzig",
    country: "Alemania",
    code: "RBL",
    colors: { from: "#c8102e", to: "#f7f7f7" },
  },
  {
    id: "borussia-dortmund",
    name: "Borussia Dortmund",
    shortName: "Dortmund",
    country: "Alemania",
    code: "BVB",
    colors: { from: "#f6d800", to: "#1a1a1a" },
  },
  {
    id: "inter-milan",
    name: "Inter Milan",
    shortName: "Inter",
    country: "Italia",
    code: "INT",
    colors: { from: "#0c2b6b", to: "#2ec4ff" },
  },
  {
    id: "milan",
    name: "Milan",
    shortName: "Milan",
    country: "Italia",
    code: "MIL",
    colors: { from: "#b00020", to: "#1b1b1b" },
  },
  {
    id: "juventus",
    name: "Juventus",
    shortName: "Juventus",
    country: "Italia",
    code: "JUV",
    colors: { from: "#111111", to: "#f2f2f2" },
  },
  {
    id: "atalanta",
    name: "Atalanta",
    shortName: "Atalanta",
    country: "Italia",
    code: "ATA",
    colors: { from: "#123a7a", to: "#0a0a0a" },
  },
  {
    id: "bologna",
    name: "Bologna",
    shortName: "Bologna",
    country: "Italia",
    code: "BOL",
    colors: { from: "#a11a2a", to: "#153a6b" },
  },
  {
    id: "paris-saint-germain",
    name: "Paris Saint-Germain",
    shortName: "PSG",
    country: "Francia",
    code: "PSG",
    colors: { from: "#1d2a7a", to: "#ff5ea8" },
  },
  {
    id: "monaco",
    name: "Monaco",
    shortName: "Monaco",
    country: "Francia",
    code: "MON",
    colors: { from: "#c51a2d", to: "#f7c75d" },
  },
  {
    id: "brest",
    name: "Brest",
    shortName: "Brest",
    country: "Francia",
    code: "BRE",
    colors: { from: "#b11d2e", to: "#f598a1" },
  },
  {
    id: "lille",
    name: "Lille",
    shortName: "Lille",
    country: "Francia",
    code: "LIL",
    colors: { from: "#99263b", to: "#f8a3b2" },
  },
  {
    id: "psv-eindhoven",
    name: "PSV Eindhoven",
    shortName: "PSV",
    country: "Paises Bajos",
    code: "PSV",
    colors: { from: "#d1102d", to: "#ffffff" },
  },
  {
    id: "feyenoord",
    name: "Feyenoord",
    shortName: "Feyenoord",
    country: "Paises Bajos",
    code: "FEY",
    colors: { from: "#b80f2e", to: "#151515" },
  },
  {
    id: "sporting-cp",
    name: "Sporting CP",
    shortName: "Sporting",
    country: "Portugal",
    code: "SCP",
    colors: { from: "#0f7f43", to: "#c2f0d0" },
  },
  {
    id: "benfica",
    name: "Benfica",
    shortName: "Benfica",
    country: "Portugal",
    code: "BEN",
    colors: { from: "#c8142b", to: "#f7f7f7" },
  },
  {
    id: "club-brugge",
    name: "Club Brugge",
    shortName: "Club Brugge",
    country: "Belgica",
    code: "BRU",
    colors: { from: "#1546a0", to: "#6bb7ff" },
  },
  {
    id: "celtic",
    name: "Celtic",
    shortName: "Celtic",
    country: "Escocia",
    code: "CEL",
    colors: { from: "#0f8f5b", to: "#e7fff2" },
  },
  {
    id: "sturm-graz",
    name: "Sturm Graz",
    shortName: "Sturm",
    country: "Austria",
    code: "STG",
    colors: { from: "#111111", to: "#f3cf3b" },
  },
  {
    id: "red-bull-salzburg",
    name: "Red Bull Salzburg",
    shortName: "Salzburg",
    country: "Austria",
    code: "RBS",
    colors: { from: "#db1f2b", to: "#f5d0d0" },
  },
  {
    id: "shakhtar-donetsk",
    name: "Shakhtar Donetsk",
    shortName: "Shakhtar",
    country: "Ucrania",
    code: "SHA",
    colors: { from: "#ef6a1b", to: "#141414" },
  },
  {
    id: "red-star-belgrade",
    name: "Red Star Belgrade",
    shortName: "Red Star",
    country: "Serbia",
    code: "RSB",
    colors: { from: "#d0162b", to: "#f3f3f3" },
  },
  {
    id: "young-boys",
    name: "Young Boys",
    shortName: "Young Boys",
    country: "Suiza",
    code: "YB",
    colors: { from: "#f0d000", to: "#151515" },
  },
  {
    id: "dinamo-zagreb",
    name: "Dinamo Zagreb",
    shortName: "Dinamo",
    country: "Croacia",
    code: "DNZ",
    colors: { from: "#0f2f8f", to: "#6bb8ff" },
  },
  {
    id: "slovan-bratislava",
    name: "Slovan Bratislava",
    shortName: "Slovan",
    country: "Eslovaquia",
    code: "SLO",
    colors: { from: "#1e4fa8", to: "#d9e8ff" },
  },
  {
    id: "sparta-prague",
    name: "Sparta Prague",
    shortName: "Sparta",
    country: "Republica Checa",
    code: "SPA",
    colors: { from: "#7d0f22", to: "#f5c542" },
  },
];

export const featuredTeamIds = [
  "real-madrid",
  "barcelona",
  "bayern-munich",
  "inter-milan",
  "arsenal",
  "paris-saint-germain",
  "borussia-dortmund",
];

// Datos reales basados en la fase de liga 2024-25 (Jornada 1).
export const latestResults: MatchResult[] = [
  {
    id: "ybg-avl-2024-09-17",
    stage: "Fase de liga - Jornada 1",
    date: "17 Sep 2024",
    homeTeamId: "young-boys",
    awayTeamId: "aston-villa",
    homeScore: 0,
    awayScore: 3,
    status: "Finalizado",
  },
  {
    id: "juv-psv-2024-09-17",
    stage: "Fase de liga - Jornada 1",
    date: "17 Sep 2024",
    homeTeamId: "juventus",
    awayTeamId: "psv-eindhoven",
    homeScore: 3,
    awayScore: 1,
    status: "Finalizado",
  },
  {
    id: "mil-liv-2024-09-17",
    stage: "Fase de liga - Jornada 1",
    date: "17 Sep 2024",
    homeTeamId: "milan",
    awayTeamId: "liverpool",
    homeScore: 1,
    awayScore: 3,
    status: "Finalizado",
  },
  {
    id: "bay-dnz-2024-09-17",
    stage: "Fase de liga - Jornada 1",
    date: "17 Sep 2024",
    homeTeamId: "bayern-munich",
    awayTeamId: "dinamo-zagreb",
    homeScore: 9,
    awayScore: 2,
    status: "Finalizado",
  },
  {
    id: "rma-stu-2024-09-17",
    stage: "Fase de liga - Jornada 1",
    date: "17 Sep 2024",
    homeTeamId: "real-madrid",
    awayTeamId: "vfb-stuttgart",
    homeScore: 3,
    awayScore: 1,
    status: "Finalizado",
  },
  {
    id: "scp-lil-2024-09-17",
    stage: "Fase de liga - Jornada 1",
    date: "17 Sep 2024",
    homeTeamId: "sporting-cp",
    awayTeamId: "lille",
    homeScore: 2,
    awayScore: 0,
    status: "Finalizado",
  },
  {
    id: "spa-rbs-2024-09-17",
    stage: "Fase de liga - Jornada 1",
    date: "17 Sep 2024",
    homeTeamId: "sparta-prague",
    awayTeamId: "red-bull-salzburg",
    homeScore: 3,
    awayScore: 0,
    status: "Finalizado",
  },
  {
    id: "bol-sha-2024-09-17",
    stage: "Fase de liga - Jornada 1",
    date: "17 Sep 2024",
    homeTeamId: "bologna",
    awayTeamId: "shakhtar-donetsk",
    homeScore: 0,
    awayScore: 0,
    status: "Finalizado",
  },
  {
    id: "cel-slo-2024-09-18",
    stage: "Fase de liga - Jornada 1",
    date: "18 Sep 2024",
    homeTeamId: "celtic",
    awayTeamId: "slovan-bratislava",
    homeScore: 5,
    awayScore: 1,
    status: "Finalizado",
  },
  {
    id: "bru-bvb-2024-09-18",
    stage: "Fase de liga - Jornada 1",
    date: "18 Sep 2024",
    homeTeamId: "club-brugge",
    awayTeamId: "borussia-dortmund",
    homeScore: 0,
    awayScore: 3,
    status: "Finalizado",
  },
  {
    id: "mci-int-2024-09-18",
    stage: "Fase de liga - Jornada 1",
    date: "18 Sep 2024",
    homeTeamId: "manchester-city",
    awayTeamId: "inter-milan",
    homeScore: 0,
    awayScore: 0,
    status: "Finalizado",
  },
  {
    id: "psg-gir-2024-09-18",
    stage: "Fase de liga - Jornada 1",
    date: "18 Sep 2024",
    homeTeamId: "paris-saint-germain",
    awayTeamId: "girona",
    homeScore: 1,
    awayScore: 0,
    status: "Finalizado",
  },
  {
    id: "fey-lev-2024-09-18",
    stage: "Fase de liga - Jornada 1",
    date: "18 Sep 2024",
    homeTeamId: "feyenoord",
    awayTeamId: "bayer-leverkusen",
    homeScore: 0,
    awayScore: 4,
    status: "Finalizado",
  },
  {
    id: "rsb-ben-2024-09-18",
    stage: "Fase de liga - Jornada 1",
    date: "18 Sep 2024",
    homeTeamId: "red-star-belgrade",
    awayTeamId: "benfica",
    homeScore: 1,
    awayScore: 2,
    status: "Finalizado",
  },
  {
    id: "mon-bar-2024-09-18",
    stage: "Fase de liga - Jornada 1",
    date: "18 Sep 2024",
    homeTeamId: "monaco",
    awayTeamId: "barcelona",
    homeScore: 2,
    awayScore: 1,
    status: "Finalizado",
  },
  {
    id: "ata-ars-2024-09-18",
    stage: "Fase de liga - Jornada 1",
    date: "18 Sep 2024",
    homeTeamId: "atalanta",
    awayTeamId: "arsenal",
    homeScore: 0,
    awayScore: 0,
    status: "Finalizado",
  },
  {
    id: "atm-rbl-2024-09-18",
    stage: "Fase de liga - Jornada 1",
    date: "18 Sep 2024",
    homeTeamId: "atletico-madrid",
    awayTeamId: "rb-leipzig",
    homeScore: 2,
    awayScore: 1,
    status: "Finalizado",
  },
  {
    id: "bre-stg-2024-09-18",
    stage: "Fase de liga - Jornada 1",
    date: "18 Sep 2024",
    homeTeamId: "brest",
    awayTeamId: "sturm-graz",
    homeScore: 2,
    awayScore: 1,
    status: "Finalizado",
  },
];

export const standings: StandingsRow[] = [
  { position: 1, teamId: "liverpool", played: 8, gd: 12, points: 21 },
  { position: 2, teamId: "barcelona", played: 8, gd: 15, points: 19 },
  { position: 3, teamId: "arsenal", played: 8, gd: 13, points: 19 },
  { position: 4, teamId: "inter-milan", played: 8, gd: 10, points: 19 },
  { position: 5, teamId: "atletico-madrid", played: 8, gd: 8, points: 18 },
  { position: 6, teamId: "bayer-leverkusen", played: 8, gd: 8, points: 16 },
  { position: 7, teamId: "lille", played: 8, gd: 7, points: 16 },
  { position: 8, teamId: "aston-villa", played: 8, gd: 7, points: 16 },
  { position: 9, teamId: "atalanta", played: 8, gd: 14, points: 15 },
  { position: 10, teamId: "borussia-dortmund", played: 8, gd: 10, points: 15 },
  { position: 11, teamId: "real-madrid", played: 8, gd: 8, points: 15 },
  { position: 12, teamId: "bayern-munich", played: 8, gd: 8, points: 15 },
  { position: 13, teamId: "milan", played: 8, gd: 3, points: 15 },
  { position: 14, teamId: "psv-eindhoven", played: 8, gd: 4, points: 14 },
  { position: 15, teamId: "paris-saint-germain", played: 8, gd: 5, points: 13 },
  { position: 16, teamId: "benfica", played: 8, gd: 4, points: 13 },
  { position: 17, teamId: "monaco", played: 8, gd: 0, points: 13 },
  { position: 18, teamId: "brest", played: 8, gd: -1, points: 13 },
  { position: 19, teamId: "feyenoord", played: 8, gd: -3, points: 13 },
  { position: 20, teamId: "juventus", played: 8, gd: 2, points: 12 },
  { position: 21, teamId: "celtic", played: 8, gd: -1, points: 12 },
  { position: 22, teamId: "manchester-city", played: 8, gd: 4, points: 11 },
  { position: 23, teamId: "sporting-cp", played: 8, gd: 1, points: 11 },
  { position: 24, teamId: "club-brugge", played: 8, gd: -4, points: 11 },
  { position: 25, teamId: "dinamo-zagreb", played: 8, gd: -7, points: 11 },
  { position: 26, teamId: "vfb-stuttgart", played: 8, gd: -4, points: 10 },
  { position: 27, teamId: "shakhtar-donetsk", played: 8, gd: -8, points: 7 },
  { position: 28, teamId: "bologna", played: 8, gd: -5, points: 6 },
  { position: 29, teamId: "red-star-belgrade", played: 8, gd: -9, points: 6 },
  { position: 30, teamId: "sturm-graz", played: 8, gd: -9, points: 6 },
  { position: 31, teamId: "sparta-prague", played: 8, gd: -14, points: 4 },
  { position: 32, teamId: "rb-leipzig", played: 8, gd: -7, points: 3 },
  { position: 33, teamId: "girona", played: 8, gd: -8, points: 3 },
  { position: 34, teamId: "red-bull-salzburg", played: 8, gd: -22, points: 3 },
  { position: 35, teamId: "slovan-bratislava", played: 8, gd: -20, points: 0 },
  { position: 36, teamId: "young-boys", played: 8, gd: -21, points: 0 },
];

// Datos reales basados en los cuartos de final (ida) 2025.
export const upcomingMatches: UpcomingMatch[] = [
  {
    id: "ars-rma-2025-04-08",
    stage: "Cuartos de final - Ida",
    date: "8 Apr 2025",
    time: "21:00",
    homeTeamId: "arsenal",
    awayTeamId: "real-madrid",
  },
  {
    id: "bay-int-2025-04-08",
    stage: "Cuartos de final - Ida",
    date: "8 Apr 2025",
    time: "21:00",
    homeTeamId: "bayern-munich",
    awayTeamId: "inter-milan",
  },
  {
    id: "psg-avl-2025-04-09",
    stage: "Cuartos de final - Ida",
    date: "9 Apr 2025",
    time: "21:00",
    homeTeamId: "paris-saint-germain",
    awayTeamId: "aston-villa",
  },
  {
    id: "bar-bvb-2025-04-09",
    stage: "Cuartos de final - Ida",
    date: "9 Apr 2025",
    time: "21:00",
    homeTeamId: "barcelona",
    awayTeamId: "borussia-dortmund",
  },
];

const teamMap = new Map(teams.map((team) => [team.id, team]));

const slugAliases: Record<string, string> = {
  psg: "paris-saint-germain",
  "man-city": "manchester-city",
  atleti: "atletico-madrid",
  inter: "inter-milan",
  bayern: "bayern-munich",
  barca: "barcelona",
  madrid: "real-madrid",
  "red-star": "red-star-belgrade",
  salzburg: "red-bull-salzburg",
};

const normalizeSlug = (value?: string) =>
  (value ?? "")
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, "-")
    .replace(/(^-|-$)/g, "");

export const getTeamById = (teamId: string) => teamMap.get(teamId);

export const getTeamBySlug = (slug: string) => {
  const normalized = normalizeSlug(slug);
  const alias = slugAliases[normalized];

  if (alias) {
    return teamMap.get(alias);
  }

  return (
    teamMap.get(normalized) ||
    teams.find(
      (team) =>
        normalizeSlug(team.name) === normalized ||
        normalizeSlug(team.shortName) === normalized ||
        team.code.toLowerCase() === normalized,
    )
  );
};
