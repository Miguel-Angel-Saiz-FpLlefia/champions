-- ==========================================
-- SCRIPT DE BASE DE DATOS PARA SUPABASE
-- UEFA Champions League 2024/2025
-- ==========================================

-- Habilitar extensiones necesarias
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- 1. TABLA: teams
CREATE TABLE IF NOT EXISTS public.teams (
    id TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    short_name TEXT NOT NULL,
    country TEXT NOT NULL,
    code TEXT NOT NULL,
    color_from TEXT NOT NULL,
    color_to TEXT NOT NULL,
    logo_url TEXT
);

-- 2. TABLA: standings
CREATE TABLE IF NOT EXISTS public.standings (
    position INT PRIMARY KEY,
    team_id TEXT UNIQUE REFERENCES public.teams(id) ON DELETE CASCADE,
    played INT NOT NULL DEFAULT 8,
    gd INT NOT NULL DEFAULT 0,
    points INT NOT NULL DEFAULT 0
);

-- 3. TABLA: matches
CREATE TABLE IF NOT EXISTS public.matches (
    id TEXT PRIMARY KEY,
    stage TEXT NOT NULL,
    date TEXT NOT NULL,
    home_team_id TEXT REFERENCES public.teams(id) ON DELETE CASCADE,
    away_team_id TEXT REFERENCES public.teams(id) ON DELETE CASCADE,
    home_score INT NOT NULL,
    away_score INT NOT NULL,
    status TEXT NOT NULL DEFAULT 'Finalizado'
);

-- 4. TABLA: players (Plantillas de los equipos)
CREATE TABLE IF NOT EXISTS public.players (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    team_id TEXT REFERENCES public.teams(id) ON DELETE CASCADE,
    name TEXT NOT NULL,
    number INT NOT NULL,
    position TEXT NOT NULL -- 'POR', 'DEF', 'MED', 'DEL', 'SUB'
);

-- 5. TABLA: match_details (Alineaciones iniciales y estadísticas generales)
CREATE TABLE IF NOT EXISTS public.match_details (
    match_id TEXT PRIMARY KEY REFERENCES public.matches(id) ON DELETE CASCADE,
    home_formation TEXT NOT NULL DEFAULT '4-3-3',
    away_formation TEXT NOT NULL DEFAULT '4-3-3',
    stats JSONB NOT NULL, -- { xg: [1.2, 0.8], shots: [10, 6], ... }
    home_substitutions JSONB NOT NULL DEFAULT '[]'::jsonb, -- [{ playerIn, playerOut, minute }]
    away_substitutions JSONB NOT NULL DEFAULT '[]'::jsonb  -- [{ playerIn, playerOut, minute }]
);

-- 6. TABLA: match_events (Goles y Tarjetas)
CREATE TABLE IF NOT EXISTS public.match_events (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    match_id TEXT REFERENCES public.matches(id) ON DELETE CASCADE,
    type TEXT NOT NULL, -- 'goal', 'card'
    team_id TEXT REFERENCES public.teams(id) ON DELETE CASCADE,
    minute INT NOT NULL,
    player TEXT NOT NULL,
    detail TEXT -- "Asist: Dembélé", "Tarjeta Amarilla"
);

-- Habilitar Row Level Security (RLS) en Supabase
ALTER TABLE public.teams ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.standings ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.matches ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.players ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.match_details ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.match_events ENABLE ROW LEVEL SECURITY;

-- Crear políticas de lectura pública para todas las tablas
CREATE POLICY "Permitir lectura pública de equipos" ON public.teams FOR SELECT USING (true);
CREATE POLICY "Permitir lectura pública de clasificación" ON public.standings FOR SELECT USING (true);
CREATE POLICY "Permitir lectura pública de partidos" ON public.matches FOR SELECT USING (true);
CREATE POLICY "Permitir lectura pública de jugadores" ON public.players FOR SELECT USING (true);
CREATE POLICY "Permitir lectura pública de detalles de partido" ON public.match_details FOR SELECT USING (true);
CREATE POLICY "Permitir lectura pública de eventos de partido" ON public.match_events FOR SELECT USING (true);


-- ==========================================
-- SEED DATA: INSERTAR EQUIPOS
-- ==========================================
INSERT INTO public.teams (id, name, short_name, country, code, color_from, color_to, logo_url) VALUES
('real-madrid', 'Real Madrid', 'Madrid', 'Espana', 'RMA', '#0b1f5b', '#e5b94a', 'https://upload.wikimedia.org/wikipedia/en/5/56/Real_Madrid_CF.svg'),
('barcelona', 'Barcelona', 'Barcelona', 'Espana', 'BAR', '#8f1f2e', '#2450ff', 'https://upload.wikimedia.org/wikipedia/en/4/47/FC_Barcelona_%28crest%29.svg'),
('atletico-madrid', 'Atletico Madrid', 'Atletico', 'Espana', 'ATM', '#b51e2a', '#2d6bff', 'https://imageio.forbes.com/i-forbesimg/media/lists/teams/atletico-de-madrid_416x416.jpg?format=jpg'),
('girona', 'Girona', 'Girona', 'Espana', 'GIR', '#c2182b', '#f2f2f2', 'https://upload.wikimedia.org/wikipedia/en/9/90/Girona_FC_logo.svg'),
('manchester-city', 'Manchester City', 'Man City', 'Inglaterra', 'MCI', '#3b9bff', '#cfe8ff', 'https://upload.wikimedia.org/wikipedia/en/e/eb/Manchester_City_FC_badge.svg'),
('arsenal', 'Arsenal', 'Arsenal', 'Inglaterra', 'ARS', '#8d0f1b', '#ffcd59', 'https://upload.wikimedia.org/wikipedia/en/5/53/Arsenal_FC.svg'),
('liverpool', 'Liverpool', 'Liverpool', 'Inglaterra', 'LIV', '#930b23', '#ff6a6a', 'https://upload.wikimedia.org/wikipedia/en/0/0c/Liverpool_FC.svg'),
('aston-villa', 'Aston Villa', 'Aston Villa', 'Inglaterra', 'AVL', '#7b1020', '#9ed6ff', 'https://upload.wikimedia.org/wikipedia/en/thumb/9/9a/Aston_Villa_FC_new_crest.svg/250px-Aston_Villa_FC_new_crest.svg.png'),
('bayern-munich', 'Bayern Munich', 'Bayern', 'Alemania', 'BAY', '#9b1022', '#e93e7b', 'https://upload.wikimedia.org/wikipedia/commons/1/1b/FC_Bayern_M%C3%BCnchen_logo_%282017%29.svg'),
('bayer-leverkusen', 'Bayer Leverkusen', 'Leverkusen', 'Alemania', 'LEV', '#bf1b1b', '#f3d45a', 'https://upload.wikimedia.org/wikipedia/en/5/59/Bayer_04_Leverkusen_logo.svg'),
('vfb-stuttgart', 'VfB Stuttgart', 'Stuttgart', 'Alemania', 'STU', '#c8172d', '#ffffff', NULL),
('rb-leipzig', 'RB Leipzig', 'Leipzig', 'Alemania', 'RBL', '#c8102e', '#f7f7f7', NULL),
('borussia-dortmund', 'Borussia Dortmund', 'Dortmund', 'Alemania', 'BVB', '#f6d800', '#1a1a1a', 'https://upload.wikimedia.org/wikipedia/commons/6/67/Borussia_Dortmund_logo.svg'),
('inter-milan', 'Inter Milan', 'Inter', 'Italia', 'INT', '#0c2b6b', '#2ec4ff', 'https://upload.wikimedia.org/wikipedia/commons/0/05/FC_Internazionale_Milano_2021.svg'),
('milan', 'Milan', 'Milan', 'Italia', 'MIL', '#b00020', '#1b1b1b', 'https://upload.wikimedia.org/wikipedia/commons/d/d0/Logo_of_AC_Milan.svg'),
('juventus', 'Juventus', 'Juventus', 'Italia', 'JUV', '#111111', '#f2f2f2', 'https://image-service.onefootball.com/transform?w=256&dpr=2&image=https%3A%2F%2Fimages.onefootball.com%2Ficons%2Fteams%2F164%2F17.png'),
('atalanta', 'Atalanta', 'Atalanta', 'Italia', 'ATA', '#123a7a', '#0a0a0a', 'https://upload.wikimedia.org/wikipedia/en/thumb/6/66/AtalantaBC.svg/960px-AtalantaBC.svg.png'),
('bologna', 'Bologna', 'Bologna', 'Italia', 'BOL', '#a11a2a', '#153a6b', NULL),
('paris-saint-germain', 'Paris Saint-Germain', 'PSG', 'Francia', 'PSG', '#1d2a7a', '#ff5ea8', 'https://upload.wikimedia.org/wikipedia/en/a/a7/Paris_Saint-Germain_F.C..svg'),
('monaco', 'Monaco', 'Monaco', 'Francia', 'MON', '#c51a2d', '#f7c75d', 'https://upload.wikimedia.org/wikipedia/en/thumb/c/cf/LogoASMonacoFC2021.svg/960px-LogoASMonacoFC2021.svg.png'),
('brest', 'Brest', 'Brest', 'Francia', 'BRE', '#b11d2e', '#f598a1', 'https://c.ndtvimg.com/gws/ms/why-ucl-newcomers-brest-cannot-play-at-home/assets/5.jpeg?1726572472'),
('lille', 'Lille', 'Lille', 'Francia', 'LIL', '#99263b', '#f8a3b2', 'https://upload.wikimedia.org/wikipedia/en/thumb/3/3f/Lille_OSC_2018_logo.svg/250px-Lille_OSC_2018_logo.svg.png'),
('psv-eindhoven', 'PSV Eindhoven', 'PSV', 'Paises Bajos', 'PSV', '#d1102d', '#ffffff', 'https://upload.wikimedia.org/wikipedia/en/thumb/0/05/PSV_Eindhoven.svg/1280px-PSV_Eindhoven.svg.png'),
('feyenoord', 'Feyenoord', 'Feyenoord', 'Paises Bajos', 'FEY', '#b80f2e', '#151515', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f9/Feyenoord_logo_since_2024.svg/1280px-Feyenoord_logo_since_2024.svg.png'),
('sporting-cp', 'Sporting CP', 'Sporting', 'Portugal', 'SCP', '#0f7f43', '#c2f0d0', 'https://upload.wikimedia.org/wikipedia/en/3/3e/Sporting_CP_logo.svg'),
('benfica', 'Benfica', 'Benfica', 'Portugal', 'BEN', '#c8142b', '#f7f7f7', 'https://upload.wikimedia.org/wikipedia/en/a/a2/SL_Benfica_logo.svg'),
('club-brugge', 'Club Brugge', 'Club Brugge', 'Belgica', 'BRU', '#1546a0', '#6bb7ff', NULL),
('celtic', 'Celtic', 'Celtic', 'Escocia', 'CEL', '#0f8f5b', '#e7fff2', NULL),
('sturm-graz', 'Sturm Graz', 'Sturm', 'Austria', 'STG', '#111111', '#f3cf3b', NULL),
('red-bull-salzburg', 'Red Bull Salzburg', 'Salzburg', 'Austria', 'RBS', '#db1f2b', '#f5d0d0', NULL),
('shakhtar-donetsk', 'Shakhtar Donetsk', 'Shakhtar', 'Ucrania', 'SHA', '#ef6a1b', '#141414', NULL),
('red-star-belgrade', 'Red Star Belgrade', 'Red Star', 'Serbia', 'RSB', '#d0162b', '#f3f3f3', NULL),
('young-boys', 'Young Boys', 'Young Boys', 'Suiza', 'YB', '#f0d000', '#151515', NULL),
('dinamo-zagreb', 'Dinamo Zagreb', 'Dinamo', 'Croacia', 'DNZ', '#0f2f8f', '#6bb8ff', NULL),
('slovan-bratislava', 'Slovan Bratislava', 'Slovan', 'Eslovaquia', 'SLO', '#1e4fa8', '#d9e8ff', NULL),
('sparta-prague', 'Sparta Prague', 'Sparta', 'Republica Checa', 'SPA', '#7d0f22', '#f5c542', NULL);


-- ==========================================
-- SEED DATA: CLASIFICACIÓN
-- ==========================================
INSERT INTO public.standings (position, team_id, played, gd, points) VALUES
(1, 'liverpool', 8, 12, 21),
(2, 'barcelona', 8, 15, 19),
(3, 'arsenal', 8, 13, 19),
(4, 'inter-milan', 8, 10, 19),
(5, 'atletico-madrid', 8, 8, 18),
(6, 'bayer-leverkusen', 8, 8, 16),
(7, 'lille', 8, 7, 16),
(8, 'aston-villa', 8, 7, 16),
(9, 'atalanta', 8, 14, 15),
(10, 'borussia-dortmund', 8, 10, 15),
(11, 'real-madrid', 8, 8, 15),
(12, 'bayern-munich', 8, 8, 15),
(13, 'milan', 8, 3, 15),
(14, 'psv-eindhoven', 8, 4, 14),
(15, 'paris-saint-germain', 8, 5, 13),
(16, 'benfica', 8, 4, 13),
(17, 'monaco', 8, 0, 13),
(18, 'brest', 8, -1, 13),
(19, 'feyenoord', 8, -3, 13),
(20, 'juventus', 8, 2, 12),
(21, 'celtic', 8, -1, 12),
(22, 'manchester-city', 8, 4, 11),
(23, 'sporting-cp', 8, 1, 11),
(24, 'club-brugge', 8, -4, 11),
(25, 'dinamo-zagreb', 8, -7, 11),
(26, 'vfb-stuttgart', 8, -4, 10),
(27, 'shakhtar-donetsk', 8, -8, 7),
(28, 'bologna', 8, -5, 6),
(29, 'red-star-belgrade', 8, -9, 6),
(30, 'sturm-graz', 8, -9, 6),
(31, 'sparta-prague', 8, -14, 4),
(32, 'rb-leipzig', 8, -7, 3),
(33, 'girona', 8, -8, 3),
(34, 'red-bull-salzburg', 8, -22, 3),
(35, 'slovan-bratislava', 8, -20, 0),
(36, 'young-boys', 8, -21, 0);


-- ==========================================
-- SEED DATA: PARTIDOS CLAVE (ELIMINATORIAS)
-- ==========================================
INSERT INTO public.matches (id, stage, date, home_team_id, away_team_id, home_score, away_score, status) VALUES
-- Octavos de final
('liv-psg-2025-03-04', 'Octavos de final', '4 Mar 2025', 'liverpool', 'paris-saint-germain', 1, 0, 'Finalizado'),
('psg-liv-2025-03-12', 'Octavos de final', '12 Mar 2025', 'paris-saint-germain', 'liverpool', 1, 0, 'Finalizado'),
('ben-bar-2025-03-05', 'Octavos de final', '5 Mar 2025', 'benfica', 'barcelona', 0, 3, 'Finalizado'),
('bar-ben-2025-03-13', 'Octavos de final', '13 Mar 2025', 'barcelona', 'benfica', 2, 0, 'Finalizado'),
('psv-ars-2025-03-04', 'Octavos de final', '4 Mar 2025', 'psv-eindhoven', 'arsenal', 1, 4, 'Finalizado'),
('ars-psv-2025-03-12', 'Octavos de final', '12 Mar 2025', 'arsenal', 'psv-eindhoven', 5, 2, 'Finalizado'),
('fey-int-2025-03-05', 'Octavos de final', '5 Mar 2025', 'feyenoord', 'inter-milan', 0, 2, 'Finalizado'),
('int-fey-2025-03-13', 'Octavos de final', '13 Mar 2025', 'inter-milan', 'feyenoord', 2, 1, 'Finalizado'),
('atm-rma-2025-03-04', 'Octavos de final', '4 Mar 2025', 'atletico-madrid', 'real-madrid', 1, 0, 'Finalizado'),
('rma-atm-2025-03-12', 'Octavos de final', '12 Mar 2025', 'real-madrid', 'atletico-madrid', 1, 0, 'Finalizado'),
('lev-bay-2025-03-05', 'Octavos de final', '5 Mar 2025', 'bayer-leverkusen', 'bayern-munich', 0, 3, 'Finalizado'),
('bay-lev-2025-03-13', 'Octavos de final', '13 Mar 2025', 'bayern-munich', 'bayer-leverkusen', 2, 0, 'Finalizado'),
('lil-bvb-2025-03-04', 'Octavos de final', '4 Mar 2025', 'lille', 'borussia-dortmund', 1, 2, 'Finalizado'),
('bvb-lil-2025-03-12', 'Octavos de final', '12 Mar 2025', 'borussia-dortmund', 'lille', 1, 1, 'Finalizado'),
('bru-avl-2025-03-05', 'Octavos de final', '5 Mar 2025', 'club-brugge', 'aston-villa', 0, 3, 'Finalizado'),
('avl-bru-2025-03-13', 'Octavos de final', '13 Mar 2025', 'aston-villa', 'club-brugge', 3, 1, 'Finalizado'),
-- Cuartos de final
('rma-ars-2025-04-08', 'Cuartos de final', '8 Apr 2025', 'real-madrid', 'arsenal', 0, 3, 'Finalizado'),
('ars-rma-2025-04-16', 'Cuartos de final', '16 Apr 2025', 'arsenal', 'real-madrid', 2, 1, 'Finalizado'),
('avl-psg-2025-04-09', 'Cuartos de final', '9 Apr 2025', 'aston-villa', 'paris-saint-germain', 2, 3, 'Finalizado'),
('psg-avl-2025-04-17', 'Cuartos de final', '17 Apr 2025', 'paris-saint-germain', 'aston-villa', 2, 2, 'Finalizado'),
('bvb-bar-2025-04-08', 'Cuartos de final', '8 Apr 2025', 'borussia-dortmund', 'barcelona', 1, 3, 'Finalizado'),
('bar-bvb-2025-04-16', 'Cuartos de final', '16 Apr 2025', 'barcelona', 'borussia-dortmund', 2, 2, 'Finalizado'),
('bay-int-2025-04-09', 'Cuartos de final', '9 Apr 2025', 'bayern-munich', 'inter-milan', 1, 2, 'Finalizado'),
('int-bay-2025-04-17', 'Cuartos de final', '17 Apr 2025', 'inter-milan', 'bayern-munich', 2, 2, 'Finalizado'),
-- Semifinales
('ars-psg-2025-04-29', 'Semifinales', '29 Apr 2025', 'arsenal', 'paris-saint-germain', 1, 2, 'Finalizado'),
('psg-ars-2025-05-07', 'Semifinales', '7 May 2025', 'paris-saint-germain', 'arsenal', 1, 1, 'Finalizado'),
('bar-int-2025-04-30', 'Semifinales', '30 Apr 2025', 'barcelona', 'inter-milan', 0, 1, 'Finalizado'),
('int-bar-2025-05-08', 'Semifinales', '8 May 2025', 'inter-milan', 'barcelona', 1, 1, 'Finalizado'),
-- Gran Final
('psg-int-2025-05-31', 'Final', '31 May 2025', 'paris-saint-germain', 'inter-milan', 5, 0, 'Finalizado');


-- ==========================================
-- SEED DATA: PLANTILLAS DE JUGADORES (PSG & INTER)
-- ==========================================
INSERT INTO public.players (team_id, name, number, position) VALUES
-- PSG Titulares
('paris-saint-germain', 'Gianluigi Donnarumma', 99, 'POR'),
('paris-saint-germain', 'Achraf Hakimi', 2, 'DEF'),
('paris-saint-germain', 'Marquinhos', 5, 'DEF'),
('paris-saint-germain', 'Willian Pacho', 51, 'DEF'),
('paris-saint-germain', 'Nuno Mendes', 25, 'DEF'),
('paris-saint-germain', 'Vitinha', 17, 'MED'),
('paris-saint-germain', 'Warren Zaïre-Emery', 33, 'MED'),
('paris-saint-germain', 'João Neves', 87, 'MED'),
('paris-saint-germain', 'Ousmane Dembélé', 10, 'DEL'),
('paris-saint-germain', 'Bradley Barcola', 29, 'DEL'),
('paris-saint-germain', 'Marco Asensio', 11, 'DEL'),
-- PSG Suplentes
('paris-saint-germain', 'Matvey Safonov', 39, 'SUB'),
('paris-saint-germain', 'Lucas Beraldo', 20, 'SUB'),
('paris-saint-germain', 'Milan Škriniar', 37, 'SUB'),
('paris-saint-germain', 'Yoram Zague', 42, 'SUB'),
('paris-saint-germain', 'Senny Mayulu', 24, 'SUB'),
('paris-saint-germain', 'Fabián Ruiz', 8, 'SUB'),
('paris-saint-germain', 'Kang-in Lee', 19, 'SUB'),
('paris-saint-germain', 'Randal Kolo Muani', 23, 'SUB'),

-- Inter Titulares
('inter-milan', 'Yann Sommer', 1, 'POR'),
('inter-milan', 'Benjamin Pavard', 28, 'DEF'),
('inter-milan', 'Francesco Acerbi', 15, 'DEF'),
('inter-milan', 'Alessandro Bastoni', 95, 'DEF'),
('inter-milan', 'Denzel Dumfries', 2, 'MED'),
('inter-milan', 'Nicolò Barella', 23, 'MED'),
('inter-milan', 'Hakan Çalhanoğlu', 20, 'MED'),
('inter-milan', 'Henrikh Mkhitaryan', 22, 'MED'),
('inter-milan', 'Federico Dimarco', 32, 'MED'),
('inter-milan', 'Marcus Thuram', 9, 'DEL'),
('inter-milan', 'Lautaro Martínez', 10, 'DEL'),
-- Inter Suplentes
('inter-milan', 'Josep Martínez', 12, 'SUB'),
('inter-milan', 'Stefan de Vrij', 6, 'SUB'),
('inter-milan', 'Yann Bisseck', 31, 'SUB'),
('inter-milan', 'Matteo Darmian', 36, 'SUB'),
('inter-milan', 'Carlos Augusto', 30, 'SUB'),
('inter-milan', 'Kristjan Asllani', 21, 'SUB'),
('inter-milan', 'Davide Frattesi', 16, 'SUB'),
('inter-milan', 'Piotr Zieliński', 7, 'SUB'),
('inter-milan', 'Mehdi Taremi', 99, 'SUB'),
('inter-milan', 'Marko Arnautović', 8, 'SUB');


-- ==========================================
-- SEED DATA: DETALLES DE LA FINAL (PSG 5 - 0 INTER)
-- ==========================================
INSERT INTO public.match_details (match_id, home_formation, away_formation, stats, home_substitutions, away_substitutions) VALUES
('psg-int-2025-05-31', 
 '4-3-3', 
 '3-5-2', 
 '{"xg": [3.4, 0.4], "shots": [18, 5], "corners": [7, 3], "passes": [620, 440], "fouls": [9, 12], "offsides": [2, 1], "possession": [58, 42], "redCards": [0, 0], "yellowCards": [1, 3], "passAccuracy": [91, 83], "shotsOnTarget": [10, 1]}'::jsonb,
 '[{"minute": 65, "playerIn": "Fabián Ruiz", "playerOut": "Marco Asensio"}, {"minute": 72, "playerIn": "Kang-in Lee", "playerOut": "Ousmane Dembélé"}, {"minute": 78, "playerIn": "Randal Kolo Muani", "playerOut": "Bradley Barcola"}, {"minute": 82, "playerIn": "Lucas Beraldo", "playerOut": "Nuno Mendes"}]'::jsonb,
 '[{"minute": 60, "playerIn": "Davide Frattesi", "playerOut": "Henrikh Mkhitaryan"}, {"minute": 60, "playerIn": "Carlos Augusto", "playerOut": "Federico Dimarco"}, {"minute": 70, "playerIn": "Piotr Zieliński", "playerOut": "Hakan Çalhanoğlu"}, {"minute": 70, "playerIn": "Matteo Darmian", "playerOut": "Denzel Dumfries"}, {"minute": 75, "playerIn": "Mehdi Taremi", "playerOut": "Marcus Thuram"}]'::jsonb
);


-- ==========================================
-- SEED DATA: EVENTOS DE LA FINAL
-- ==========================================
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES
('psg-int-2025-05-31', 'goal', 'paris-saint-germain', 14, 'Ousmane Dembélé', 'Asist: Bradley Barcola'),
('psg-int-2025-05-31', 'goal', 'paris-saint-germain', 32, 'Bradley Barcola', 'Asist: Vitinha'),
('psg-int-2025-05-31', 'card', 'inter-milan', 54, 'Benjamin Pavard', 'Tarjeta Amarilla'),
('psg-int-2025-05-31', 'goal', 'paris-saint-germain', 55, 'Vitinha', 'Penalti'),
('psg-int-2025-05-31', 'goal', 'paris-saint-germain', 62, 'Marco Asensio', 'Asist: Achraf Hakimi'),
('psg-int-2025-05-31', 'card', 'paris-saint-germain', 68, 'Nuno Mendes', 'Tarjeta Amarilla'),
('psg-int-2025-05-31', 'card', 'inter-milan', 71, 'Nicolò Barella', 'Tarjeta Amarilla'),
('psg-int-2025-05-31', 'goal', 'paris-saint-germain', 84, 'Randal Kolo Muani', 'Asist: Fabián Ruiz'),
('psg-int-2025-05-31', 'card', 'inter-milan', 87, 'Alessandro Bastoni', 'Tarjeta Amarilla');
