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
  logoUrl?: string;
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

export type Player = {
  name: string;
  number: number;
};

export type Substitution = {
  playerIn: string;
  playerOut: string;
  minute: number;
};

export type Lineup = {
  formation: string;
  starters: { player: Player; position: string }[];
  substitutes: Player[];
  substitutions: Substitution[];
};

export type MatchStats = {
  xg: [number, number]; // [home, away]
  shots: [number, number];
  shotsOnTarget: [number, number];
  possession: [number, number]; // e.g. [55, 45]
  passes: [number, number];
  passAccuracy: [number, number]; // e.g. [85, 82]
  fouls: [number, number];
  yellowCards: [number, number];
  redCards: [number, number];
  offsides: [number, number];
  corners: [number, number];
};

export type MatchEvent = {
  type: "goal" | "card";
  teamId: string;
  minute: number;
  player: string;
  detail?: string; // e.g., "Penalti", "Tarjeta Amarilla", "Asistencia: Dembélé"
};

export type MatchDetails = {
  matchId: string;
  homeLineup: Lineup;
  awayLineup: Lineup;
  stats: MatchStats;
  events: MatchEvent[];
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
    logoUrl: "https://upload.wikimedia.org/wikipedia/en/5/56/Real_Madrid_CF.svg",
  },
  {
    id: "barcelona",
    name: "Barcelona",
    shortName: "Barcelona",
    country: "Espana",
    code: "BAR",
    colors: { from: "#8f1f2e", to: "#2450ff" },
    logoUrl: "https://upload.wikimedia.org/wikipedia/en/4/47/FC_Barcelona_%28crest%29.svg",
  },
  {
    id: "atletico-madrid",
    name: "Atletico Madrid",
    shortName: "Atletico",
    country: "Espana",
    code: "ATM",
    colors: { from: "#b51e2a", to: "#2d6bff" },
    logoUrl: "https://imageio.forbes.com/i-forbesimg/media/lists/teams/atletico-de-madrid_416x416.jpg?format=jpg",
  },
  {
    id: "girona",
    name: "Girona",
    shortName: "Girona",
    country: "Espana",
    code: "GIR",
    colors: { from: "#c2182b", to: "#f2f2f2" },
    logoUrl: "https://upload.wikimedia.org/wikipedia/en/9/90/Girona_FC_logo.svg",
  },
  {
    id: "manchester-city",
    name: "Manchester City",
    shortName: "Man City",
    country: "Inglaterra",
    code: "MCI",
    colors: { from: "#3b9bff", to: "#cfe8ff" },
    logoUrl: "https://upload.wikimedia.org/wikipedia/en/e/eb/Manchester_City_FC_badge.svg",
  },
  {
    id: "arsenal",
    name: "Arsenal",
    shortName: "Arsenal",
    country: "Inglaterra",
    code: "ARS",
    colors: { from: "#8d0f1b", to: "#ffcd59" },
    logoUrl: "https://upload.wikimedia.org/wikipedia/en/5/53/Arsenal_FC.svg",
  },
  {
    id: "liverpool",
    name: "Liverpool",
    shortName: "Liverpool",
    country: "Inglaterra",
    code: "LIV",
    colors: { from: "#930b23", to: "#ff6a6a" },
    logoUrl: "https://upload.wikimedia.org/wikipedia/en/0/0c/Liverpool_FC.svg",
  },
  {
    id: "aston-villa",
    name: "Aston Villa",
    shortName: "Aston Villa",
    country: "Inglaterra",
    code: "AVL",
    colors: { from: "#7b1020", to: "#9ed6ff" },
    logoUrl: "https://upload.wikimedia.org/wikipedia/en/thumb/9/9a/Aston_Villa_FC_new_crest.svg/250px-Aston_Villa_FC_new_crest.svg.png",
  },
  {
    id: "bayern-munich",
    name: "Bayern Munich",
    shortName: "Bayern",
    country: "Alemania",
    code: "BAY",
    colors: { from: "#9b1022", to: "#e93e7b" },
    logoUrl: "https://upload.wikimedia.org/wikipedia/commons/1/1b/FC_Bayern_M%C3%BCnchen_logo_%282017%29.svg",
  },
  {
    id: "bayer-leverkusen",
    name: "Bayer Leverkusen",
    shortName: "Leverkusen",
    country: "Alemania",
    code: "LEV",
    colors: { from: "#bf1b1b", to: "#f3d45a" },
    logoUrl: "https://upload.wikimedia.org/wikipedia/en/5/59/Bayer_04_Leverkusen_logo.svg",
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
    logoUrl: "https://upload.wikimedia.org/wikipedia/commons/6/67/Borussia_Dortmund_logo.svg",
  },
  {
    id: "inter-milan",
    name: "Inter Milan",
    shortName: "Inter",
    country: "Italia",
    code: "INT",
    colors: { from: "#0c2b6b", to: "#2ec4ff" },
    logoUrl: "https://upload.wikimedia.org/wikipedia/commons/0/05/FC_Internazionale_Milano_2021.svg",
  },
  {
    id: "milan",
    name: "Milan",
    shortName: "Milan",
    country: "Italia",
    code: "MIL",
    colors: { from: "#b00020", to: "#1b1b1b" },
    logoUrl: "https://upload.wikimedia.org/wikipedia/commons/d/d0/Logo_of_AC_Milan.svg",
  },
  {
    id: "juventus",
    name: "Juventus",
    shortName: "Juventus",
    country: "Italia",
    code: "JUV",
    colors: { from: "#111111", to: "#f2f2f2" },
    logoUrl: "https://image-service.onefootball.com/transform?w=256&dpr=2&image=https%3A%2F%2Fimages.onefootball.com%2Ficons%2Fteams%2F164%2F17.png",
  },
  {
    id: "atalanta",
    name: "Atalanta",
    shortName: "Atalanta",
    country: "Italia",
    code: "ATA",
    colors: { from: "#123a7a", to: "#0a0a0a" },
    logoUrl: "https://upload.wikimedia.org/wikipedia/en/thumb/6/66/AtalantaBC.svg/960px-AtalantaBC.svg.png",
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
    logoUrl: "https://upload.wikimedia.org/wikipedia/en/a/a7/Paris_Saint-Germain_F.C..svg",
  },
  {
    id: "monaco",
    name: "Monaco",
    shortName: "Monaco",
    country: "Francia",
    code: "MON",
    colors: { from: "#c51a2d", to: "#f7c75d" },
    logoUrl: "https://upload.wikimedia.org/wikipedia/en/thumb/c/cf/LogoASMonacoFC2021.svg/960px-LogoASMonacoFC2021.svg.png",
  },
  {
    id: "brest",
    name: "Brest",
    shortName: "Brest",
    country: "Francia",
    code: "BRE",
    colors: { from: "#b11d2e", to: "#f598a1" },
    logoUrl: "https://c.ndtvimg.com/gws/ms/why-ucl-newcomers-brest-cannot-play-at-home/assets/5.jpeg?1726572472",
  },
  {
    id: "lille",
    name: "Lille",
    shortName: "Lille",
    country: "Francia",
    code: "LIL",
    colors: { from: "#99263b", to: "#f8a3b2" },
    logoUrl: "https://upload.wikimedia.org/wikipedia/en/thumb/3/3f/Lille_OSC_2018_logo.svg/250px-Lille_OSC_2018_logo.svg.png",
  },
  {
    id: "psv-eindhoven",
    name: "PSV Eindhoven",
    shortName: "PSV",
    country: "Paises Bajos",
    code: "PSV",
    colors: { from: "#d1102d", to: "#ffffff" },
    logoUrl: "https://upload.wikimedia.org/wikipedia/en/thumb/0/05/PSV_Eindhoven.svg/1280px-PSV_Eindhoven.svg.png",
  },
  {
    id: "feyenoord",
    name: "Feyenoord",
    shortName: "Feyenoord",
    country: "Paises Bajos",
    code: "FEY",
    colors: { from: "#b80f2e", to: "#151515" },
    logoUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f9/Feyenoord_logo_since_2024.svg/1280px-Feyenoord_logo_since_2024.svg.png",
  },
  {
    id: "sporting-cp",
    name: "Sporting CP",
    shortName: "Sporting",
    country: "Portugal",
    code: "SCP",
    colors: { from: "#0f7f43", to: "#c2f0d0" },
    logoUrl: "https://upload.wikimedia.org/wikipedia/en/3/3e/Sporting_CP_logo.svg",
  },
  {
    id: "benfica",
    name: "Benfica",
    shortName: "Benfica",
    country: "Portugal",
    code: "BEN",
    colors: { from: "#c8142b", to: "#f7f7f7" },
    logoUrl: "https://upload.wikimedia.org/wikipedia/en/a/a2/SL_Benfica_logo.svg",
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

export const latestResults: MatchResult[] = [
  // JORNADAS
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

  // OCTAVOS DE FINAL
  {
    id: "liv-psg-2025-03-04",
    stage: "Octavos de final",
    date: "4 Mar 2025",
    homeTeamId: "liverpool",
    awayTeamId: "paris-saint-germain",
    homeScore: 1,
    awayScore: 0,
    status: "Finalizado",
  },
  {
    id: "psg-liv-2025-03-12",
    stage: "Octavos de final",
    date: "12 Mar 2025",
    homeTeamId: "paris-saint-germain",
    awayTeamId: "liverpool",
    homeScore: 1,
    awayScore: 0,
    status: "Finalizado",
  },
  {
    id: "ben-bar-2025-03-05",
    stage: "Octavos de final",
    date: "5 Mar 2025",
    homeTeamId: "benfica",
    awayTeamId: "barcelona",
    homeScore: 0,
    awayScore: 3,
    status: "Finalizado",
  },
  {
    id: "bar-ben-2025-03-13",
    stage: "Octavos de final",
    date: "13 Mar 2025",
    homeTeamId: "barcelona",
    awayTeamId: "benfica",
    homeScore: 2,
    awayScore: 0,
    status: "Finalizado",
  },
  {
    id: "psv-ars-2025-03-04",
    stage: "Octavos de final",
    date: "4 Mar 2025",
    homeTeamId: "psv-eindhoven",
    awayTeamId: "arsenal",
    homeScore: 1,
    awayScore: 4,
    status: "Finalizado",
  },
  {
    id: "ars-psv-2025-03-12",
    stage: "Octavos de final",
    date: "12 Mar 2025",
    homeTeamId: "arsenal",
    awayTeamId: "psv-eindhoven",
    homeScore: 5,
    awayScore: 2,
    status: "Finalizado",
  },
  {
    id: "fey-int-2025-03-05",
    stage: "Octavos de final",
    date: "5 Mar 2025",
    homeTeamId: "feyenoord",
    awayTeamId: "inter-milan",
    homeScore: 0,
    awayScore: 2,
    status: "Finalizado",
  },
  {
    id: "int-fey-2025-03-13",
    stage: "Octavos de final",
    date: "13 Mar 2025",
    homeTeamId: "inter-milan",
    awayTeamId: "feyenoord",
    homeScore: 2,
    awayScore: 1,
    status: "Finalizado",
  },
  {
    id: "atm-rma-2025-03-04",
    stage: "Octavos de final",
    date: "4 Mar 2025",
    homeTeamId: "atletico-madrid",
    awayTeamId: "real-madrid",
    homeScore: 1,
    awayScore: 0,
    status: "Finalizado",
  },
  {
    id: "rma-atm-2025-03-12",
    stage: "Octavos de final",
    date: "12 Mar 2025",
    homeTeamId: "real-madrid",
    awayTeamId: "atletico-madrid",
    homeScore: 1,
    awayScore: 0,
    status: "Finalizado",
  },
  {
    id: "lev-bay-2025-03-05",
    stage: "Octavos de final",
    date: "5 Mar 2025",
    homeTeamId: "bayer-leverkusen",
    awayTeamId: "bayern-munich",
    homeScore: 0,
    awayScore: 3,
    status: "Finalizado",
  },
  {
    id: "bay-lev-2025-03-13",
    stage: "Octavos de final",
    date: "13 Mar 2025",
    homeTeamId: "bayern-munich",
    awayTeamId: "bayer-leverkusen",
    homeScore: 2,
    awayScore: 0,
    status: "Finalizado",
  },
  {
    id: "lil-bvb-2025-03-04",
    stage: "Octavos de final",
    date: "4 Mar 2025",
    homeTeamId: "lille",
    awayTeamId: "borussia-dortmund",
    homeScore: 1,
    awayScore: 2,
    status: "Finalizado",
  },
  {
    id: "bvb-lil-2025-03-12",
    stage: "Octavos de final",
    date: "12 Mar 2025",
    homeTeamId: "borussia-dortmund",
    awayTeamId: "lille",
    homeScore: 1,
    awayScore: 1,
    status: "Finalizado",
  },
  {
    id: "bru-avl-2025-03-05",
    stage: "Octavos de final",
    date: "5 Mar 2025",
    homeTeamId: "club-brugge",
    awayTeamId: "aston-villa",
    homeScore: 0,
    awayScore: 3,
    status: "Finalizado",
  },
  {
    id: "avl-bru-2025-03-13",
    stage: "Octavos de final",
    date: "13 Mar 2025",
    homeTeamId: "aston-villa",
    awayTeamId: "club-brugge",
    homeScore: 3,
    awayScore: 1,
    status: "Finalizado",
  },
  // CUARTOS DE FINAL
  {
    id: "rma-ars-2025-04-08",
    stage: "Cuartos de final",
    date: "8 Apr 2025",
    homeTeamId: "real-madrid",
    awayTeamId: "arsenal",
    homeScore: 0,
    awayScore: 3,
    status: "Finalizado",
  },
  {
    id: "ars-rma-2025-04-16",
    stage: "Cuartos de final",
    date: "16 Apr 2025",
    homeTeamId: "arsenal",
    awayTeamId: "real-madrid",
    homeScore: 2,
    awayScore: 1,
    status: "Finalizado",
  },
  {
    id: "avl-psg-2025-04-09",
    stage: "Cuartos de final",
    date: "9 Apr 2025",
    homeTeamId: "aston-villa",
    awayTeamId: "paris-saint-germain",
    homeScore: 2,
    awayScore: 3,
    status: "Finalizado",
  },
  {
    id: "psg-avl-2025-04-17",
    stage: "Cuartos de final",
    date: "17 Apr 2025",
    homeTeamId: "paris-saint-germain",
    awayTeamId: "aston-villa",
    homeScore: 2,
    awayScore: 2,
    status: "Finalizado",
  },
  {
    id: "bvb-bar-2025-04-08",
    stage: "Cuartos de final",
    date: "8 Apr 2025",
    homeTeamId: "borussia-dortmund",
    awayTeamId: "barcelona",
    homeScore: 1,
    awayScore: 3,
    status: "Finalizado",
  },
  {
    id: "bar-bvb-2025-04-16",
    stage: "Cuartos de final",
    date: "16 Apr 2025",
    homeTeamId: "barcelona",
    awayTeamId: "borussia-dortmund",
    homeScore: 2,
    awayScore: 2,
    status: "Finalizado",
  },
  {
    id: "bay-int-2025-04-09",
    stage: "Cuartos de final",
    date: "9 Apr 2025",
    homeTeamId: "bayern-munich",
    awayTeamId: "inter-milan",
    homeScore: 1,
    awayScore: 2,
    status: "Finalizado",
  },
  {
    id: "int-bay-2025-04-17",
    stage: "Cuartos de final",
    date: "17 Apr 2025",
    homeTeamId: "inter-milan",
    awayTeamId: "bayern-munich",
    homeScore: 2,
    awayScore: 2,
    status: "Finalizado",
  },
  // SEMIFINALES
  {
    id: "ars-psg-2025-04-29",
    stage: "Semifinales",
    date: "29 Apr 2025",
    homeTeamId: "arsenal",
    awayTeamId: "paris-saint-germain",
    homeScore: 1,
    awayScore: 2,
    status: "Finalizado",
  },
  {
    id: "psg-ars-2025-05-07",
    stage: "Semifinales",
    date: "7 May 2025",
    homeTeamId: "paris-saint-germain",
    awayTeamId: "arsenal",
    homeScore: 1,
    awayScore: 1,
    status: "Finalizado",
  },
  {
    id: "bar-int-2025-04-30",
    stage: "Semifinales",
    date: "30 Apr 2025",
    homeTeamId: "barcelona",
    awayTeamId: "inter-milan",
    homeScore: 0,
    awayScore: 1,
    status: "Finalizado",
  },
  {
    id: "int-bar-2025-05-08",
    stage: "Semifinales",
    date: "8 May 2025",
    homeTeamId: "inter-milan",
    awayTeamId: "barcelona",
    homeScore: 1,
    awayScore: 1,
    status: "Finalizado",
  },
  // FINAL
  {
    id: "psg-int-2025-05-31",
    stage: "Final",
    date: "31 May 2025",
    homeTeamId: "paris-saint-germain",
    awayTeamId: "inter-milan",
    homeScore: 5,
    awayScore: 0,
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

export const upcomingMatches: UpcomingMatch[] = [];

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

// Plantillas de jugadores de los equipos principales para generar alineaciones realistas
const TEAM_SQUADS: Record<string, { starters: { name: string; number: number; pos: string }[]; substitutes: { name: string; number: number }[] }> = {
  "paris-saint-germain": {
    starters: [
      { name: "Gianluigi Donnarumma", number: 99, pos: "POR" },
      { name: "Achraf Hakimi", number: 2, pos: "DEF" },
      { name: "Marquinhos", number: 5, pos: "DEF" },
      { name: "Willian Pacho", number: 51, pos: "DEF" },
      { name: "Nuno Mendes", number: 25, pos: "DEF" },
      { name: "Vitinha", number: 17, pos: "MED" },
      { name: "Warren Zaïre-Emery", number: 33, pos: "MED" },
      { name: "João Neves", number: 87, pos: "MED" },
      { name: "Ousmane Dembélé", number: 10, pos: "DEL" },
      { name: "Bradley Barcola", number: 29, pos: "DEL" },
      { name: "Marco Asensio", number: 11, pos: "DEL" }
    ],
    substitutes: [
      { name: "Matvey Safonov", number: 39 },
      { name: "Lucas Beraldo", number: 20 },
      { name: "Milan Škriniar", number: 37 },
      { name: "Yoram Zague", number: 42 },
      { name: "Senny Mayulu", number: 24 },
      { name: "Fabián Ruiz", number: 8 },
      { name: "Kang-in Lee", number: 19 },
      { name: "Randal Kolo Muani", number: 23 }
    ]
  },
  "inter-milan": {
    starters: [
      { name: "Yann Sommer", number: 1, pos: "POR" },
      { name: "Benjamin Pavard", number: 28, pos: "DEF" },
      { name: "Francesco Acerbi", number: 15, pos: "DEF" },
      { name: "Alessandro Bastoni", number: 95, pos: "DEF" },
      { name: "Denzel Dumfries", number: 2, pos: "MED" },
      { name: "Nicolò Barella", number: 23, pos: "MED" },
      { name: "Hakan Çalhanoğlu", number: 20, pos: "MED" },
      { name: "Henrikh Mkhitaryan", number: 22, pos: "MED" },
      { name: "Federico Dimarco", number: 32, pos: "MED" },
      { name: "Marcus Thuram", number: 9, pos: "DEL" },
      { name: "Lautaro Martínez", number: 10, pos: "DEL" }
    ],
    substitutes: [
      { name: "Josep Martínez", number: 12 },
      { name: "Stefan de Vrij", number: 6 },
      { name: "Yann Bisseck", number: 31 },
      { name: "Matteo Darmian", number: 36 },
      { name: "Carlos Augusto", number: 30 },
      { name: "Kristjan Asllani", number: 21 },
      { name: "Davide Frattesi", number: 16 },
      { name: "Piotr Zieliński", number: 7 },
      { name: "Mehdi Taremi", number: 99 },
      { name: "Marko Arnautović", number: 8 }
    ]
  },
  "real-madrid": {
    starters: [
      { name: "Thibaut Courtois", number: 1, pos: "POR" },
      { name: "Dani Carvajal", number: 2, pos: "DEF" },
      { name: "Éder Militão", number: 3, pos: "DEF" },
      { name: "Antonio Rüdiger", number: 22, pos: "DEF" },
      { name: "Ferland Mendy", number: 23, pos: "DEF" },
      { name: "Federico Valverde", number: 8, pos: "MED" },
      { name: "Aurélien Tchouaméni", number: 14, pos: "MED" },
      { name: "Jude Bellingham", number: 5, pos: "MED" },
      { name: "Rodrygo Goes", number: 11, pos: "DEL" },
      { name: "Kylian Mbappé", number: 9, pos: "DEL" },
      { name: "Vinícius Júnior", number: 7, pos: "DEL" }
    ],
    substitutes: [
      { name: "Andriy Lunin", number: 13 },
      { name: "Lucas Vázquez", number: 17 },
      { name: "Fran García", number: 20 },
      { name: "Luka Modrić", number: 10 },
      { name: "Eduardo Camavinga", number: 6 },
      { name: "Arda Güler", number: 15 },
      { name: "Brahim Díaz", number: 21 },
      { name: "Endrick", number: 16 }
    ]
  },
  "barcelona": {
    starters: [
      { name: "Marc-André ter Stegen", number: 1, pos: "POR" },
      { name: "Jules Koundé", number: 23, pos: "DEF" },
      { name: "Pau Cubarsí", number: 2, pos: "DEF" },
      { name: "Íñigo Martínez", number: 5, pos: "DEF" },
      { name: "Alejandro Balde", number: 3, pos: "DEF" },
      { name: "Marc Casadó", number: 17, pos: "MED" },
      { name: "Pedri González", number: 20, pos: "MED" },
      { name: "Dani Olmo", number: 20, pos: "MED" },
      { name: "Lamine Yamal", number: 19, pos: "DEL" },
      { name: "Robert Lewandowski", number: 9, pos: "DEL" },
      { name: "Raphinha", number: 11, pos: "DEL" }
    ],
    substitutes: [
      { name: "Iñaki Peña", number: 13 },
      { name: "Héctor Fort", number: 32 },
      { name: "Sergi Domínguez", number: 36 },
      { name: "Gerard Martín", number: 35 },
      { name: "Frenkie de Jong", number: 21 },
      { name: "Fermín López", number: 16 },
      { name: "Gavi", number: 6 },
      { name: "Ansu Fati", number: 10 },
      { name: "Pau Víctor", number: 18 }
    ]
  },
  "bayern-munich": {
    starters: [
      { name: "Manuel Neuer", number: 1, pos: "POR" },
      { name: "Joshua Kimmich", number: 6, pos: "DEF" },
      { name: "Dayot Upamecano", number: 2, pos: "DEF" },
      { name: "Kim Min-jae", number: 3, pos: "DEF" },
      { name: "Alphonso Davies", number: 19, pos: "DEF" },
      { name: "Aleksandar Pavlović", number: 45, pos: "MED" },
      { name: "João Palhinha", number: 16, pos: "MED" },
      { name: "Michael Olise", number: 17, pos: "MED" },
      { name: "Jamal Musiala", number: 42, pos: "MED" },
      { name: "Serge Gnabry", number: 7, pos: "DEL" },
      { name: "Harry Kane", number: 9, pos: "DEL" }
    ],
    substitutes: [
      { name: "Sven Ulreich", number: 26 },
      { name: "Eric Dier", number: 15 },
      { name: "Raphaël Guerreiro", number: 22 },
      { name: "Konrad Laimer", number: 27 },
      { name: "Leon Goretzka", number: 8 },
      { name: "Thomas Müller", number: 25 },
      { name: "Leroy Sané", number: 10 },
      { name: "Kingsley Coman", number: 11 }
    ]
  },
  "manchester-city": {
    starters: [
      { name: "Ederson Moraes", number: 31, pos: "POR" },
      { name: "Kyle Walker", number: 2, pos: "DEF" },
      { name: "Manuel Akanji", number: 25, pos: "DEF" },
      { name: "Rúben Dias", number: 3, pos: "DEF" },
      { name: "Josko Gvardiol", number: 24, pos: "DEF" },
      { name: "Rodri Hernández", number: 16, pos: "MED" },
      { name: "Mateo Kovačić", number: 8, pos: "MED" },
      { name: "Bernardo Silva", number: 20, pos: "MED" },
      { name: "Kevin De Bruyne", number: 17, pos: "MED" },
      { name: "Phil Foden", number: 47, pos: "DEL" },
      { name: "Erling Haaland", number: 9, pos: "DEL" }
    ],
    substitutes: [
      { name: "Stefan Ortega", number: 18 },
      { name: "John Stones", number: 5 },
      { name: "Nathan Aké", number: 6 },
      { name: "Rico Lewis", number: 82 },
      { name: "Ilkay Gündogan", number: 19 },
      { name: "Matheus Nunes", number: 27 },
      { name: "Jack Grealish", number: 10 },
      { name: "Jeremy Doku", number: 11 },
      { name: "Savinho", number: 26 }
    ]
  },
  "arsenal": {
    starters: [
      { name: "David Raya", number: 22, pos: "POR" },
      { name: "Ben White", number: 4, pos: "DEF" },
      { name: "William Saliba", number: 2, pos: "DEF" },
      { name: "Gabriel Magalhães", number: 6, pos: "DEF" },
      { name: "Jurriën Timber", number: 12, pos: "DEF" },
      { name: "Thomas Partey", number: 5, pos: "MED" },
      { name: "Declan Rice", number: 41, pos: "MED" },
      { name: "Martin Ødegaard", number: 8, pos: "MED" },
      { name: "Bukayo Saka", number: 7, pos: "DEL" },
      { name: "Kai Havertz", number: 29, pos: "DEL" },
      { name: "Gabriel Martinelli", number: 11, pos: "DEL" }
    ],
    substitutes: [
      { name: "Neto", number: 32 },
      { name: "Jakub Kiwior", number: 15 },
      { name: "Oleksandr Zinchenko", number: 35 },
      { name: "Jorginho", number: 20 },
      { name: "Mikel Merino", number: 23 },
      { name: "Raheem Sterling", number: 30 },
      { name: "Leandro Trossard", number: 19 },
      { name: "Gabriel Jesus", number: 9 }
    ]
  },
  "liverpool": {
    starters: [
      { name: "Alisson Becker", number: 1, pos: "POR" },
      { name: "Trent Alexander-Arnold", number: 66, pos: "DEF" },
      { name: "Ibrahima Konaté", number: 5, pos: "DEF" },
      { name: "Virgil van Dijk", number: 4, pos: "DEF" },
      { name: "Andrew Robertson", number: 26, pos: "DEF" },
      { name: "Ryan Gravenberch", number: 38, pos: "MED" },
      { name: "Alexis Mac Allister", number: 10, pos: "MED" },
      { name: "Dominik Szoboszlai", number: 8, pos: "MED" },
      { name: "Mohamed Salah", number: 11, pos: "DEL" },
      { name: "Diogo Jota", number: 20, pos: "DEL" },
      { name: "Luis Díaz", number: 7, pos: "DEL" }
    ],
    substitutes: [
      { name: "Caoimhin Kelleher", number: 62 },
      { name: "Joe Gomez", number: 2 },
      { name: "Jarell Quansah", number: 78 },
      { name: "Conor Bradley", number: 84 },
      { name: "Wataru Endo", number: 3 },
      { name: "Curtis Jones", number: 17 },
      { name: "Harvey Elliott", number: 19 },
      { name: "Cody Gakpo", number: 18 },
      { name: "Darwin Núñez", number: 9 }
    ]
  },
  "atletico-madrid": {
    starters: [
      { name: "Jan Oblak", number: 13, pos: "POR" },
      { name: "Nahuel Molina", number: 16, pos: "DEF" },
      { name: "Robin Le Normand", number: 24, pos: "DEF" },
      { name: "José María Giménez", number: 2, pos: "DEF" },
      { name: "Reinildo Mandava", number: 23, pos: "DEF" },
      { name: "Rodrigo De Paul", number: 5, pos: "MED" },
      { name: "Koke Resurrección", number: 6, pos: "MED" },
      { name: "Conor Gallagher", number: 4, pos: "MED" },
      { name: "Antoine Griezmann", number: 7, pos: "DEL" },
      { name: "Julián Álvarez", number: 19, pos: "DEL" },
      { name: "Alexander Sørloth", number: 9, pos: "DEL" }
    ],
    substitutes: [
      { name: "Juan Musso", number: 1 },
      { name: "Axel Witsel", number: 20 },
      { name: "Clement Lenglet", number: 15 },
      { name: "Marcos Llorente", number: 14 },
      { name: "Pablo Barrios", number: 8 },
      { name: "Rodrigo Riquelme", number: 17 },
      { name: "Angel Correa", number: 10 },
      { name: "Giuliano Simeone", number: 22 }
    ]
  }
};

// Generador genérico de plantillas si no están definidas
function getGenericSquad(teamCode: string) {
  const positions = ["DEF", "DEF", "DEF", "DEF", "MED", "MED", "MED", "DEL", "DEL", "DEL"];
  const starters = [{ name: `Portero ${teamCode}`, number: 1, pos: "POR" }];
  
  for (let i = 0; i < 10; i++) {
    starters.push({
      name: `Jugador ${teamCode} ${i + 2}`,
      number: i + 2,
      pos: positions[i]
    });
  }

  const substitutes = [];
  for (let i = 0; i < 7; i++) {
    substitutes.push({
      name: `Suplente ${teamCode} ${i + 12}`,
      number: i + 12
    });
  }

  return { starters, substitutes };
}

export function getTeamSquad(teamId: string) {
  return TEAM_SQUADS[teamId] || getGenericSquad(teamId.substring(0, 3).toUpperCase());
}

// Genera detalles dinámicos basados en la información del partido
export function generateMatchDetails(match: MatchResult): MatchDetails {
  // 1. Datos reales de la Final (PSG 5 - 0 Inter)
  if (match.id === "psg-int-2025-05-31") {
    const psgSquad = TEAM_SQUADS["paris-saint-germain"];
    const interSquad = TEAM_SQUADS["inter-milan"];

    return {
      matchId: match.id,
      homeLineup: {
        formation: "4-3-3",
        starters: psgSquad.starters.map(s => ({ player: { name: s.name, number: s.number }, position: s.pos })),
        substitutes: psgSquad.substitutes.map(s => ({ name: s.name, number: s.number })),
        substitutions: [
          { playerIn: "Fabián Ruiz", playerOut: "Marco Asensio", minute: 65 },
          { playerIn: "Kang-in Lee", playerOut: "Ousmane Dembélé", minute: 72 },
          { playerIn: "Randal Kolo Muani", playerOut: "Bradley Barcola", minute: 78 },
          { playerIn: "Lucas Beraldo", playerOut: "Nuno Mendes", minute: 82 }
        ]
      },
      awayLineup: {
        formation: "3-5-2",
        starters: interSquad.starters.map(s => ({ player: { name: s.name, number: s.number }, position: s.pos })),
        substitutes: interSquad.substitutes.map(s => ({ name: s.name, number: s.number })),
        substitutions: [
          { playerIn: "Davide Frattesi", playerOut: "Henrikh Mkhitaryan", minute: 60 },
          { playerIn: "Carlos Augusto", playerOut: "Federico Dimarco", minute: 60 },
          { playerIn: "Piotr Zieliński", playerOut: "Hakan Çalhanoğlu", minute: 70 },
          { playerIn: "Matteo Darmian", playerOut: "Denzel Dumfries", minute: 70 },
          { playerIn: "Mehdi Taremi", playerOut: "Marcus Thuram", minute: 75 }
        ]
      },
      stats: {
        xg: [3.4, 0.4],
        shots: [18, 5],
        shotsOnTarget: [10, 1],
        possession: [58, 42],
        passes: [620, 440],
        passAccuracy: [91, 83],
        fouls: [9, 12],
        yellowCards: [1, 3],
        redCards: [0, 0],
        offsides: [2, 1],
        corners: [7, 3]
      },
      events: [
        { type: "goal", teamId: "paris-saint-germain", minute: 14, player: "Ousmane Dembélé", detail: "Asist: Bradley Barcola" },
        { type: "goal", teamId: "paris-saint-germain", minute: 32, player: "Bradley Barcola", detail: "Asist: Vitinha" },
        { type: "goal", teamId: "paris-saint-germain", minute: 55, player: "Vitinha", detail: "Penalti" },
        { type: "card", teamId: "inter-milan", minute: 54, player: "Benjamin Pavard", detail: "Tarjeta Amarilla" },
        { type: "goal", teamId: "paris-saint-germain", minute: 62, player: "Marco Asensio", detail: "Asist: Achraf Hakimi" },
        { type: "card", teamId: "paris-saint-germain", minute: 68, player: "Nuno Mendes", detail: "Tarjeta Amarilla" },
        { type: "card", teamId: "inter-milan", minute: 71, player: "Nicolò Barella", detail: "Tarjeta Amarilla" },
        { type: "goal", teamId: "paris-saint-germain", minute: 84, player: "Randal Kolo Muani", detail: "Asist: Fabián Ruiz" },
        { type: "card", teamId: "inter-milan", minute: 87, player: "Alessandro Bastoni", detail: "Tarjeta Amarilla" }
      ]
    };
  }

  // 2. Generador dinámico para el resto de los partidos
  const homeSquad = TEAM_SQUADS[match.homeTeamId] || getGenericSquad(match.homeTeamId.substring(0, 3).toUpperCase());
  const awaySquad = TEAM_SQUADS[match.awayTeamId] || getGenericSquad(match.awayTeamId.substring(0, 3).toUpperCase());

  // Generamos estadísticas lógicas según el resultado del partido
  const totalGoals = match.homeScore + match.awayScore;
  const rawXgHome = Number((match.homeScore + Math.random() * 0.9).toFixed(1));
  const rawXgAway = Number((match.awayScore + Math.random() * 0.9).toFixed(1));

  // Generamos eventos de goles de manera correspondiente a los marcadores
  const events: MatchEvent[] = [];
  
  // Goles locales
  for (let i = 0; i < match.homeScore; i++) {
    const scorer = homeSquad.starters[7 + (i % 4)]?.name || `Atacante L ${i + 1}`;
    const assistant = homeSquad.starters[5 + (i % 3)]?.name;
    const min = Math.floor(Math.random() * 88) + 2;
    events.push({
      type: "goal",
      teamId: match.homeTeamId,
      minute: min,
      player: scorer,
      detail: assistant ? `Asist: ${assistant.split(" ").pop()}` : undefined
    });
  }

  // Goles visitantes
  for (let i = 0; i < match.awayScore; i++) {
    const scorer = awaySquad.starters[7 + (i % 4)]?.name || `Atacante V ${i + 1}`;
    const assistant = awaySquad.starters[5 + (i % 3)]?.name;
    const min = Math.floor(Math.random() * 88) + 2;
    events.push({
      type: "goal",
      teamId: match.awayTeamId,
      minute: min,
      player: scorer,
      detail: assistant ? `Asist: ${assistant.split(" ").pop()}` : undefined
    });
  }

  // Tarjetas aleatorias
  const homeYellows = Math.floor(Math.random() * 3) + 1;
  const awayYellows = Math.floor(Math.random() * 3) + 1;

  for (let i = 0; i < homeYellows; i++) {
    const min = Math.floor(Math.random() * 85) + 5;
    const player = homeSquad.starters[1 + (i % 6)].name;
    events.push({
      type: "card",
      teamId: match.homeTeamId,
      minute: min,
      player: player,
      detail: "Tarjeta Amarilla"
    });
  }

  for (let i = 0; i < awayYellows; i++) {
    const min = Math.floor(Math.random() * 85) + 5;
    const player = awaySquad.starters[1 + (i % 6)].name;
    events.push({
      type: "card",
      teamId: match.awayTeamId,
      minute: min,
      player: player,
      detail: "Tarjeta Amarilla"
    });
  }

  // Ordenar cronológicamente todos los eventos
  events.sort((a, b) => a.minute - b.minute);

  // Sustituciones simuladas (3 para cada equipo)
  const homeSubs: Substitution[] = [];
  const awaySubs: Substitution[] = [];
  
  for (let i = 0; i < 3; i++) {
    const playerIn = homeSquad.substitutes[i]?.name || `Suplente local ${i + 1}`;
    const playerOut = homeSquad.starters[8 - i]?.name || `Titular local ${9 - i}`;
    homeSubs.push({ playerIn, playerOut, minute: 60 + i * 8 });
  }

  for (let i = 0; i < 3; i++) {
    const playerIn = awaySquad.substitutes[i]?.name || `Suplente visitante ${i + 1}`;
    const playerOut = awaySquad.starters[8 - i]?.name || `Titular visitante ${9 - i}`;
    awaySubs.push({ playerIn, playerOut, minute: 62 + i * 7 });
  }

  // Posesiones aleatorias pero consistentes con los goles (más goles suele correlacionar con posesión o al revés)
  const posHome = 40 + Math.floor(Math.random() * 21);
  const posAway = 100 - posHome;

  return {
    matchId: match.id,
    homeLineup: {
      formation: "4-3-3",
      starters: homeSquad.starters.map(s => ({ player: { name: s.name, number: s.number }, position: s.pos })),
      substitutes: homeSquad.substitutes.map(s => ({ name: s.name, number: s.number })),
      substitutions: homeSubs
    },
    awayLineup: {
      formation: "4-3-3",
      starters: awaySquad.starters.map(s => ({ player: { name: s.name, number: s.number }, position: s.pos })),
      substitutes: awaySquad.substitutes.map(s => ({ name: s.name, number: s.number })),
      substitutions: awaySubs
    },
    stats: {
      xg: [rawXgHome, rawXgAway],
      shots: [10 + Math.floor(rawXgHome * 3), 6 + Math.floor(rawXgAway * 3)],
      shotsOnTarget: [match.homeScore + 1 + Math.floor(Math.random() * 4), match.awayScore + Math.floor(Math.random() * 3)],
      possession: [posHome, posAway],
      passes: [Math.floor(posHome * 9.5), Math.floor(posAway * 9.5)],
      passAccuracy: [75 + Math.floor(Math.random() * 15), 75 + Math.floor(Math.random() * 15)],
      fouls: [10 + Math.floor(Math.random() * 6), 10 + Math.floor(Math.random() * 6)],
      yellowCards: [homeYellows, awayYellows],
      redCards: [0, 0],
      offsides: [Math.floor(Math.random() * 4), Math.floor(Math.random() * 4)],
      corners: [3 + Math.floor(Math.random() * 6), 2 + Math.floor(Math.random() * 6)]
    },
    events
  };
}
