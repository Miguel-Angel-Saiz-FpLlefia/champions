-- ==========================================
-- DATOS ADICIONALES DE SQUAD Y DETALLES DE PARTIDOS (NOMBRES REALES)
-- ==========================================

-- Limpiar datos previos para evitar duplicados o conflictos
DELETE FROM public.match_events;
DELETE FROM public.match_details;
DELETE FROM public.players;
DELETE FROM public.matches;

-- 1. INSERTAR TODOS LOS PARTIDOS EN LA TABLA MATCHES
INSERT INTO public.matches (id, stage, date, home_team_id, away_team_id, home_score, away_score, status) VALUES ('ybg-avl-2024-09-17', 'Fase de liga - Jornada 1', '17 Sep 2024', 'young-boys', 'aston-villa', 0, 3, 'Finalizado');
INSERT INTO public.matches (id, stage, date, home_team_id, away_team_id, home_score, away_score, status) VALUES ('juv-psv-2024-09-17', 'Fase de liga - Jornada 1', '17 Sep 2024', 'juventus', 'psv-eindhoven', 3, 1, 'Finalizado');
INSERT INTO public.matches (id, stage, date, home_team_id, away_team_id, home_score, away_score, status) VALUES ('mil-liv-2024-09-17', 'Fase de liga - Jornada 1', '17 Sep 2024', 'milan', 'liverpool', 1, 3, 'Finalizado');
INSERT INTO public.matches (id, stage, date, home_team_id, away_team_id, home_score, away_score, status) VALUES ('bay-dnz-2024-09-17', 'Fase de liga - Jornada 1', '17 Sep 2024', 'bayern-munich', 'dinamo-zagreb', 9, 2, 'Finalizado');
INSERT INTO public.matches (id, stage, date, home_team_id, away_team_id, home_score, away_score, status) VALUES ('rma-stu-2024-09-17', 'Fase de liga - Jornada 1', '17 Sep 2024', 'real-madrid', 'vfb-stuttgart', 3, 1, 'Finalizado');
INSERT INTO public.matches (id, stage, date, home_team_id, away_team_id, home_score, away_score, status) VALUES ('scp-lil-2024-09-17', 'Fase de liga - Jornada 1', '17 Sep 2024', 'sporting-cp', 'lille', 2, 0, 'Finalizado');
INSERT INTO public.matches (id, stage, date, home_team_id, away_team_id, home_score, away_score, status) VALUES ('spa-rbs-2024-09-17', 'Fase de liga - Jornada 1', '17 Sep 2024', 'sparta-prague', 'red-bull-salzburg', 3, 0, 'Finalizado');
INSERT INTO public.matches (id, stage, date, home_team_id, away_team_id, home_score, away_score, status) VALUES ('bol-sha-2024-09-17', 'Fase de liga - Jornada 1', '17 Sep 2024', 'bologna', 'shakhtar-donetsk', 0, 0, 'Finalizado');
INSERT INTO public.matches (id, stage, date, home_team_id, away_team_id, home_score, away_score, status) VALUES ('cel-slo-2024-09-18', 'Fase de liga - Jornada 1', '18 Sep 2024', 'celtic', 'slovan-bratislava', 5, 1, 'Finalizado');
INSERT INTO public.matches (id, stage, date, home_team_id, away_team_id, home_score, away_score, status) VALUES ('bru-bvb-2024-09-18', 'Fase de liga - Jornada 1', '18 Sep 2024', 'club-brugge', 'borussia-dortmund', 0, 3, 'Finalizado');
INSERT INTO public.matches (id, stage, date, home_team_id, away_team_id, home_score, away_score, status) VALUES ('mci-int-2024-09-18', 'Fase de liga - Jornada 1', '18 Sep 2024', 'manchester-city', 'inter-milan', 0, 0, 'Finalizado');
INSERT INTO public.matches (id, stage, date, home_team_id, away_team_id, home_score, away_score, status) VALUES ('psg-gir-2024-09-18', 'Fase de liga - Jornada 1', '18 Sep 2024', 'paris-saint-germain', 'girona', 1, 0, 'Finalizado');
INSERT INTO public.matches (id, stage, date, home_team_id, away_team_id, home_score, away_score, status) VALUES ('fey-lev-2024-09-18', 'Fase de liga - Jornada 1', '18 Sep 2024', 'feyenoord', 'bayer-leverkusen', 0, 4, 'Finalizado');
INSERT INTO public.matches (id, stage, date, home_team_id, away_team_id, home_score, away_score, status) VALUES ('rsb-ben-2024-09-18', 'Fase de liga - Jornada 1', '18 Sep 2024', 'red-star-belgrade', 'benfica', 1, 2, 'Finalizado');
INSERT INTO public.matches (id, stage, date, home_team_id, away_team_id, home_score, away_score, status) VALUES ('mon-bar-2024-09-18', 'Fase de liga - Jornada 1', '18 Sep 2024', 'monaco', 'barcelona', 2, 1, 'Finalizado');
INSERT INTO public.matches (id, stage, date, home_team_id, away_team_id, home_score, away_score, status) VALUES ('ata-ars-2024-09-18', 'Fase de liga - Jornada 1', '18 Sep 2024', 'atalanta', 'arsenal', 0, 0, 'Finalizado');
INSERT INTO public.matches (id, stage, date, home_team_id, away_team_id, home_score, away_score, status) VALUES ('atm-rbl-2024-09-18', 'Fase de liga - Jornada 1', '18 Sep 2024', 'atletico-madrid', 'rb-leipzig', 2, 1, 'Finalizado');
INSERT INTO public.matches (id, stage, date, home_team_id, away_team_id, home_score, away_score, status) VALUES ('bre-stg-2024-09-18', 'Fase de liga - Jornada 1', '18 Sep 2024', 'brest', 'sturm-graz', 2, 1, 'Finalizado');
INSERT INTO public.matches (id, stage, date, home_team_id, away_team_id, home_score, away_score, status) VALUES ('liv-psg-2025-03-04', 'Octavos de final', '4 Mar 2025', 'liverpool', 'paris-saint-germain', 1, 0, 'Finalizado');
INSERT INTO public.matches (id, stage, date, home_team_id, away_team_id, home_score, away_score, status) VALUES ('psg-liv-2025-03-12', 'Octavos de final', '12 Mar 2025', 'paris-saint-germain', 'liverpool', 1, 0, 'Finalizado');
INSERT INTO public.matches (id, stage, date, home_team_id, away_team_id, home_score, away_score, status) VALUES ('ben-bar-2025-03-05', 'Octavos de final', '5 Mar 2025', 'benfica', 'barcelona', 0, 3, 'Finalizado');
INSERT INTO public.matches (id, stage, date, home_team_id, away_team_id, home_score, away_score, status) VALUES ('bar-ben-2025-03-13', 'Octavos de final', '13 Mar 2025', 'barcelona', 'benfica', 2, 0, 'Finalizado');
INSERT INTO public.matches (id, stage, date, home_team_id, away_team_id, home_score, away_score, status) VALUES ('psv-ars-2025-03-04', 'Octavos de final', '4 Mar 2025', 'psv-eindhoven', 'arsenal', 1, 4, 'Finalizado');
INSERT INTO public.matches (id, stage, date, home_team_id, away_team_id, home_score, away_score, status) VALUES ('ars-psv-2025-03-12', 'Octavos de final', '12 Mar 2025', 'arsenal', 'psv-eindhoven', 5, 2, 'Finalizado');
INSERT INTO public.matches (id, stage, date, home_team_id, away_team_id, home_score, away_score, status) VALUES ('fey-int-2025-03-05', 'Octavos de final', '5 Mar 2025', 'feyenoord', 'inter-milan', 0, 2, 'Finalizado');
INSERT INTO public.matches (id, stage, date, home_team_id, away_team_id, home_score, away_score, status) VALUES ('int-fey-2025-03-13', 'Octavos de final', '13 Mar 2025', 'inter-milan', 'feyenoord', 2, 1, 'Finalizado');
INSERT INTO public.matches (id, stage, date, home_team_id, away_team_id, home_score, away_score, status) VALUES ('atm-rma-2025-03-04', 'Octavos de final', '4 Mar 2025', 'atletico-madrid', 'real-madrid', 1, 0, 'Finalizado');
INSERT INTO public.matches (id, stage, date, home_team_id, away_team_id, home_score, away_score, status) VALUES ('rma-atm-2025-03-12', 'Octavos de final', '12 Mar 2025', 'real-madrid', 'atletico-madrid', 1, 0, 'Finalizado');
INSERT INTO public.matches (id, stage, date, home_team_id, away_team_id, home_score, away_score, status) VALUES ('lev-bay-2025-03-05', 'Octavos de final', '5 Mar 2025', 'bayer-leverkusen', 'bayern-munich', 0, 3, 'Finalizado');
INSERT INTO public.matches (id, stage, date, home_team_id, away_team_id, home_score, away_score, status) VALUES ('bay-lev-2025-03-13', 'Octavos de final', '13 Mar 2025', 'bayern-munich', 'bayer-leverkusen', 2, 0, 'Finalizado');
INSERT INTO public.matches (id, stage, date, home_team_id, away_team_id, home_score, away_score, status) VALUES ('lil-bvb-2025-03-04', 'Octavos de final', '4 Mar 2025', 'lille', 'borussia-dortmund', 1, 2, 'Finalizado');
INSERT INTO public.matches (id, stage, date, home_team_id, away_team_id, home_score, away_score, status) VALUES ('bvb-lil-2025-03-12', 'Octavos de final', '12 Mar 2025', 'borussia-dortmund', 'lille', 1, 1, 'Finalizado');
INSERT INTO public.matches (id, stage, date, home_team_id, away_team_id, home_score, away_score, status) VALUES ('bru-avl-2025-03-05', 'Octavos de final', '5 Mar 2025', 'club-brugge', 'aston-villa', 0, 3, 'Finalizado');
INSERT INTO public.matches (id, stage, date, home_team_id, away_team_id, home_score, away_score, status) VALUES ('avl-bru-2025-03-13', 'Octavos de final', '13 Mar 2025', 'aston-villa', 'club-brugge', 3, 1, 'Finalizado');
INSERT INTO public.matches (id, stage, date, home_team_id, away_team_id, home_score, away_score, status) VALUES ('rma-ars-2025-04-08', 'Cuartos de final', '8 Apr 2025', 'real-madrid', 'arsenal', 0, 3, 'Finalizado');
INSERT INTO public.matches (id, stage, date, home_team_id, away_team_id, home_score, away_score, status) VALUES ('ars-rma-2025-04-16', 'Cuartos de final', '16 Apr 2025', 'arsenal', 'real-madrid', 2, 1, 'Finalizado');
INSERT INTO public.matches (id, stage, date, home_team_id, away_team_id, home_score, away_score, status) VALUES ('avl-psg-2025-04-09', 'Cuartos de final', '9 Apr 2025', 'aston-villa', 'paris-saint-germain', 2, 3, 'Finalizado');
INSERT INTO public.matches (id, stage, date, home_team_id, away_team_id, home_score, away_score, status) VALUES ('psg-avl-2025-04-17', 'Cuartos de final', '17 Apr 2025', 'paris-saint-germain', 'aston-villa', 2, 2, 'Finalizado');
INSERT INTO public.matches (id, stage, date, home_team_id, away_team_id, home_score, away_score, status) VALUES ('bvb-bar-2025-04-08', 'Cuartos de final', '8 Apr 2025', 'borussia-dortmund', 'barcelona', 1, 3, 'Finalizado');
INSERT INTO public.matches (id, stage, date, home_team_id, away_team_id, home_score, away_score, status) VALUES ('bar-bvb-2025-04-16', 'Cuartos de final', '16 Apr 2025', 'barcelona', 'borussia-dortmund', 2, 2, 'Finalizado');
INSERT INTO public.matches (id, stage, date, home_team_id, away_team_id, home_score, away_score, status) VALUES ('bay-int-2025-04-09', 'Cuartos de final', '9 Apr 2025', 'bayern-munich', 'inter-milan', 1, 2, 'Finalizado');
INSERT INTO public.matches (id, stage, date, home_team_id, away_team_id, home_score, away_score, status) VALUES ('int-bay-2025-04-17', 'Cuartos de final', '17 Apr 2025', 'inter-milan', 'bayern-munich', 2, 2, 'Finalizado');
INSERT INTO public.matches (id, stage, date, home_team_id, away_team_id, home_score, away_score, status) VALUES ('ars-psg-2025-04-29', 'Semifinales', '29 Apr 2025', 'arsenal', 'paris-saint-germain', 1, 2, 'Finalizado');
INSERT INTO public.matches (id, stage, date, home_team_id, away_team_id, home_score, away_score, status) VALUES ('psg-ars-2025-05-07', 'Semifinales', '7 May 2025', 'paris-saint-germain', 'arsenal', 1, 1, 'Finalizado');
INSERT INTO public.matches (id, stage, date, home_team_id, away_team_id, home_score, away_score, status) VALUES ('bar-int-2025-04-30', 'Semifinales', '30 Apr 2025', 'barcelona', 'inter-milan', 0, 1, 'Finalizado');
INSERT INTO public.matches (id, stage, date, home_team_id, away_team_id, home_score, away_score, status) VALUES ('int-bar-2025-05-08', 'Semifinales', '8 May 2025', 'inter-milan', 'barcelona', 1, 1, 'Finalizado');
INSERT INTO public.matches (id, stage, date, home_team_id, away_team_id, home_score, away_score, status) VALUES ('psg-int-2025-05-31', 'Final', '31 May 2025', 'paris-saint-germain', 'inter-milan', 5, 0, 'Finalizado');

-- 2. INSERTAR JUGADORES PARA TODOS LOS EQUIPOS
INSERT INTO public.players (team_id, name, number, position) VALUES ('real-madrid', 'Thibaut Courtois', 1, 'POR');
INSERT INTO public.players (team_id, name, number, position) VALUES ('real-madrid', 'Dani Carvajal', 2, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('real-madrid', 'Éder Militão', 3, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('real-madrid', 'Antonio Rüdiger', 22, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('real-madrid', 'Ferland Mendy', 23, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('real-madrid', 'Federico Valverde', 8, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('real-madrid', 'Aurélien Tchouaméni', 14, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('real-madrid', 'Jude Bellingham', 5, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('real-madrid', 'Rodrygo Goes', 11, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('real-madrid', 'Kylian Mbappé', 9, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('real-madrid', 'Vinícius Júnior', 7, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('real-madrid', 'Andriy Lunin', 13, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('real-madrid', 'Lucas Vázquez', 17, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('real-madrid', 'Fran García', 20, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('real-madrid', 'Luka Modrić', 10, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('real-madrid', 'Eduardo Camavinga', 6, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('real-madrid', 'Arda Güler', 15, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('real-madrid', 'Brahim Díaz', 21, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('real-madrid', 'Endrick', 16, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('barcelona', 'Marc-André ter Stegen', 1, 'POR');
INSERT INTO public.players (team_id, name, number, position) VALUES ('barcelona', 'Jules Koundé', 23, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('barcelona', 'Pau Cubarsí', 2, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('barcelona', 'Íñigo Martínez', 5, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('barcelona', 'Alejandro Balde', 3, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('barcelona', 'Marc Casadó', 17, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('barcelona', 'Pedri González', 20, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('barcelona', 'Dani Olmo', 21, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('barcelona', 'Lamine Yamal', 19, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('barcelona', 'Robert Lewandowski', 9, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('barcelona', 'Raphinha', 11, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('barcelona', 'Iñaki Peña', 13, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('barcelona', 'Héctor Fort', 32, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('barcelona', 'Sergi Domínguez', 36, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('barcelona', 'Gerard Martín', 35, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('barcelona', 'Frenkie de Jong', 21, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('barcelona', 'Fermín López', 16, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('barcelona', 'Gavi', 6, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('barcelona', 'Ansu Fati', 10, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('barcelona', 'Pau Víctor', 18, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('atletico-madrid', 'Jan Oblak', 13, 'POR');
INSERT INTO public.players (team_id, name, number, position) VALUES ('atletico-madrid', 'Nahuel Molina', 16, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('atletico-madrid', 'Robin Le Normand', 24, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('atletico-madrid', 'José María Giménez', 2, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('atletico-madrid', 'Reinildo Mandava', 23, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('atletico-madrid', 'Rodrigo De Paul', 5, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('atletico-madrid', 'Koke Resurrección', 6, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('atletico-madrid', 'Conor Gallagher', 4, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('atletico-madrid', 'Antoine Griezmann', 7, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('atletico-madrid', 'Julián Álvarez', 19, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('atletico-madrid', 'Alexander Sørloth', 9, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('atletico-madrid', 'Juan Musso', 1, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('atletico-madrid', 'Axel Witsel', 20, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('atletico-madrid', 'Clement Lenglet', 15, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('atletico-madrid', 'Marcos Llorente', 14, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('atletico-madrid', 'Pablo Barrios', 8, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('atletico-madrid', 'Rodrigo Riquelme', 17, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('atletico-madrid', 'Angel Correa', 10, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('atletico-madrid', 'Giuliano Simeone', 22, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('girona', 'Lucas Ruiz', 1, 'POR');
INSERT INTO public.players (team_id, name, number, position) VALUES ('girona', 'Mateo López', 2, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('girona', 'Santiago García', 3, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('girona', 'Martín Martínez', 4, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('girona', 'Diego Rodríguez', 5, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('girona', 'Hugo Sánchez', 6, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('girona', 'Álvaro Pérez', 7, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('girona', 'Carlos González', 8, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('girona', 'Javier Hernández', 9, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('girona', 'David Torres', 10, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('girona', 'Manuel Flores', 11, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('girona', 'Daniel Ortiz', 12, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('girona', 'Pablo Silva', 13, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('girona', 'Rodrigo Medina', 14, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('girona', 'Miguel Navarro', 15, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('girona', 'Joaquín Morales', 16, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('girona', 'Felipe Gómez', 17, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('girona', 'Tomás Ruiz', 18, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('girona', 'Benjamín Fernández', 19, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('manchester-city', 'Ederson Moraes', 31, 'POR');
INSERT INTO public.players (team_id, name, number, position) VALUES ('manchester-city', 'Kyle Walker', 2, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('manchester-city', 'Manuel Akanji', 25, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('manchester-city', 'Rúben Dias', 3, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('manchester-city', 'Josko Gvardiol', 24, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('manchester-city', 'Rodri Hernández', 16, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('manchester-city', 'Mateo Kovačić', 8, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('manchester-city', 'Bernardo Silva', 20, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('manchester-city', 'Kevin De Bruyne', 17, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('manchester-city', 'Phil Foden', 47, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('manchester-city', 'Erling Haaland', 9, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('manchester-city', 'Stefan Ortega', 18, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('manchester-city', 'John Stones', 5, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('manchester-city', 'Nathan Aké', 6, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('manchester-city', 'Rico Lewis', 82, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('manchester-city', 'Ilkay Gündogan', 19, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('manchester-city', 'Matheus Nunes', 27, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('manchester-city', 'Jack Grealish', 10, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('manchester-city', 'Jeremy Doku', 11, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('manchester-city', 'Savinho', 26, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('arsenal', 'David Raya', 22, 'POR');
INSERT INTO public.players (team_id, name, number, position) VALUES ('arsenal', 'Ben White', 4, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('arsenal', 'William Saliba', 2, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('arsenal', 'Gabriel Magalhães', 6, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('arsenal', 'Jurriën Timber', 12, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('arsenal', 'Thomas Partey', 5, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('arsenal', 'Declan Rice', 41, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('arsenal', 'Martin Ødegaard', 8, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('arsenal', 'Bukayo Saka', 7, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('arsenal', 'Kai Havertz', 29, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('arsenal', 'Gabriel Martinelli', 11, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('arsenal', 'Neto', 32, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('arsenal', 'Jakub Kiwior', 15, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('arsenal', 'Oleksandr Zinchenko', 35, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('arsenal', 'Jorginho', 20, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('arsenal', 'Mikel Merino', 23, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('arsenal', 'Raheem Sterling', 30, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('arsenal', 'Leandro Trossard', 19, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('arsenal', 'Gabriel Jesus', 9, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('liverpool', 'Alisson Becker', 1, 'POR');
INSERT INTO public.players (team_id, name, number, position) VALUES ('liverpool', 'Trent Alexander-Arnold', 66, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('liverpool', 'Ibrahima Konaté', 5, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('liverpool', 'Virgil van Dijk', 4, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('liverpool', 'Andrew Robertson', 26, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('liverpool', 'Ryan Gravenberch', 38, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('liverpool', 'Alexis Mac Allister', 10, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('liverpool', 'Dominik Szoboszlai', 8, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('liverpool', 'Mohamed Salah', 11, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('liverpool', 'Diogo Jota', 20, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('liverpool', 'Luis Díaz', 7, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('liverpool', 'Caoimhin Kelleher', 62, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('liverpool', 'Joe Gomez', 2, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('liverpool', 'Jarell Quansah', 78, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('liverpool', 'Conor Bradley', 84, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('liverpool', 'Wataru Endo', 3, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('liverpool', 'Curtis Jones', 17, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('liverpool', 'Harvey Elliott', 19, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('liverpool', 'Cody Gakpo', 18, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('liverpool', 'Darwin Núñez', 9, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('aston-villa', 'Harry Jones', 1, 'POR');
INSERT INTO public.players (team_id, name, number, position) VALUES ('aston-villa', 'Oliver Brown', 2, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('aston-villa', 'George Williams', 3, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('aston-villa', 'Jack Wilson', 4, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('aston-villa', 'Noah Johnson', 5, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('aston-villa', 'Jacob Davies', 6, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('aston-villa', 'William Robinson', 7, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('aston-villa', 'Charlie Wright', 8, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('aston-villa', 'Thomas Green', 9, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('aston-villa', 'James Evans', 10, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('aston-villa', 'Marcus Walker', 11, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('aston-villa', 'Mason Cole', 12, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('aston-villa', 'Liam Stone', 13, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('aston-villa', 'Edward Brooks', 14, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('aston-villa', 'Arthur Cooper', 15, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('aston-villa', 'Danny Harrison', 16, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('aston-villa', 'Luke Smith', 17, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('aston-villa', 'Ryan Jones', 18, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('aston-villa', 'John Taylor', 19, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('bayern-munich', 'Manuel Neuer', 1, 'POR');
INSERT INTO public.players (team_id, name, number, position) VALUES ('bayern-munich', 'Joshua Kimmich', 6, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('bayern-munich', 'Dayot Upamecano', 2, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('bayern-munich', 'Kim Min-jae', 3, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('bayern-munich', 'Alphonso Davies', 19, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('bayern-munich', 'Aleksandar Pavlović', 45, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('bayern-munich', 'João Palhinha', 16, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('bayern-munich', 'Michael Olise', 17, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('bayern-munich', 'Jamal Musiala', 42, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('bayern-munich', 'Serge Gnabry', 7, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('bayern-munich', 'Harry Kane', 9, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('bayern-munich', 'Sven Ulreich', 26, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('bayern-munich', 'Eric Dier', 15, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('bayern-munich', 'Raphaël Guerreiro', 22, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('bayern-munich', 'Konrad Laimer', 27, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('bayern-munich', 'Leon Goretzka', 8, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('bayern-munich', 'Thomas Müller', 25, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('bayern-munich', 'Leroy Sané', 10, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('bayern-munich', 'Kingsley Coman', 11, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('bayer-leverkusen', 'Lukas Müller', 1, 'POR');
INSERT INTO public.players (team_id, name, number, position) VALUES ('bayer-leverkusen', 'Thomas Weber', 2, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('bayer-leverkusen', 'Jonas Becker', 3, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('bayer-leverkusen', 'Maximilian Hoffmann', 4, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('bayer-leverkusen', 'Leon Wagner', 5, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('bayer-leverkusen', 'Felix Schäfer', 6, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('bayer-leverkusen', 'Simon Koch', 7, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('bayer-leverkusen', 'David Bauer', 8, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('bayer-leverkusen', 'Sebastian Richter', 9, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('bayer-leverkusen', 'Alexander Wolf', 10, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('bayer-leverkusen', 'Benjamin Neumann', 11, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('bayer-leverkusen', 'Jan Zimmermann', 12, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('bayer-leverkusen', 'Tobias Hartmann', 13, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('bayer-leverkusen', 'Niklas Krüger', 14, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('bayer-leverkusen', 'Florian Schmidt', 15, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('bayer-leverkusen', 'Tim Müller', 16, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('bayer-leverkusen', 'Philipp Fischer', 17, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('bayer-leverkusen', 'Moritz Weber', 18, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('bayer-leverkusen', 'Lukas Becker', 19, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('vfb-stuttgart', 'Lukas Müller', 1, 'POR');
INSERT INTO public.players (team_id, name, number, position) VALUES ('vfb-stuttgart', 'Thomas Weber', 2, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('vfb-stuttgart', 'Jonas Becker', 3, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('vfb-stuttgart', 'Maximilian Hoffmann', 4, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('vfb-stuttgart', 'Leon Wagner', 5, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('vfb-stuttgart', 'Felix Schäfer', 6, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('vfb-stuttgart', 'Simon Koch', 7, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('vfb-stuttgart', 'David Bauer', 8, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('vfb-stuttgart', 'Sebastian Richter', 9, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('vfb-stuttgart', 'Alexander Wolf', 10, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('vfb-stuttgart', 'Benjamin Neumann', 11, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('vfb-stuttgart', 'Jan Zimmermann', 12, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('vfb-stuttgart', 'Tobias Hartmann', 13, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('vfb-stuttgart', 'Niklas Krüger', 14, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('vfb-stuttgart', 'Florian Schmidt', 15, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('vfb-stuttgart', 'Tim Müller', 16, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('vfb-stuttgart', 'Philipp Fischer', 17, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('vfb-stuttgart', 'Moritz Weber', 18, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('vfb-stuttgart', 'Lukas Becker', 19, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('rb-leipzig', 'Lukas Müller', 1, 'POR');
INSERT INTO public.players (team_id, name, number, position) VALUES ('rb-leipzig', 'Thomas Weber', 2, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('rb-leipzig', 'Jonas Becker', 3, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('rb-leipzig', 'Maximilian Hoffmann', 4, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('rb-leipzig', 'Leon Wagner', 5, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('rb-leipzig', 'Felix Schäfer', 6, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('rb-leipzig', 'Simon Koch', 7, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('rb-leipzig', 'David Bauer', 8, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('rb-leipzig', 'Sebastian Richter', 9, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('rb-leipzig', 'Alexander Wolf', 10, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('rb-leipzig', 'Benjamin Neumann', 11, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('rb-leipzig', 'Jan Zimmermann', 12, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('rb-leipzig', 'Tobias Hartmann', 13, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('rb-leipzig', 'Niklas Krüger', 14, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('rb-leipzig', 'Florian Schmidt', 15, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('rb-leipzig', 'Tim Müller', 16, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('rb-leipzig', 'Philipp Fischer', 17, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('rb-leipzig', 'Moritz Weber', 18, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('rb-leipzig', 'Lukas Becker', 19, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('borussia-dortmund', 'Lukas Müller', 1, 'POR');
INSERT INTO public.players (team_id, name, number, position) VALUES ('borussia-dortmund', 'Thomas Weber', 2, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('borussia-dortmund', 'Jonas Becker', 3, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('borussia-dortmund', 'Maximilian Hoffmann', 4, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('borussia-dortmund', 'Leon Wagner', 5, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('borussia-dortmund', 'Felix Schäfer', 6, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('borussia-dortmund', 'Simon Koch', 7, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('borussia-dortmund', 'David Bauer', 8, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('borussia-dortmund', 'Sebastian Richter', 9, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('borussia-dortmund', 'Alexander Wolf', 10, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('borussia-dortmund', 'Benjamin Neumann', 11, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('borussia-dortmund', 'Jan Zimmermann', 12, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('borussia-dortmund', 'Tobias Hartmann', 13, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('borussia-dortmund', 'Niklas Krüger', 14, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('borussia-dortmund', 'Florian Schmidt', 15, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('borussia-dortmund', 'Tim Müller', 16, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('borussia-dortmund', 'Philipp Fischer', 17, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('borussia-dortmund', 'Moritz Weber', 18, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('borussia-dortmund', 'Lukas Becker', 19, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('inter-milan', 'Yann Sommer', 1, 'POR');
INSERT INTO public.players (team_id, name, number, position) VALUES ('inter-milan', 'Benjamin Pavard', 28, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('inter-milan', 'Francesco Acerbi', 15, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('inter-milan', 'Alessandro Bastoni', 95, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('inter-milan', 'Denzel Dumfries', 2, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('inter-milan', 'Nicolò Barella', 23, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('inter-milan', 'Hakan Çalhanoğlu', 20, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('inter-milan', 'Henrikh Mkhitaryan', 22, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('inter-milan', 'Federico Dimarco', 32, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('inter-milan', 'Marcus Thuram', 9, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('inter-milan', 'Lautaro Martínez', 10, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('inter-milan', 'Josep Martínez', 12, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('inter-milan', 'Stefan de Vrij', 6, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('inter-milan', 'Yann Bisseck', 31, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('inter-milan', 'Matteo Darmian', 36, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('inter-milan', 'Carlos Augusto', 30, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('inter-milan', 'Kristjan Asllani', 21, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('inter-milan', 'Davide Frattesi', 16, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('inter-milan', 'Piotr Zieliński', 7, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('inter-milan', 'Mehdi Taremi', 99, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('inter-milan', 'Marko Arnautović', 8, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('milan', 'Alessandro Ferrari', 1, 'POR');
INSERT INTO public.players (team_id, name, number, position) VALUES ('milan', 'Lorenzo Romano', 2, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('milan', 'Francesco Colombo', 3, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('milan', 'Leonardo Ricci', 4, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('milan', 'Mattia Moretti', 5, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('milan', 'Andrea Bruno', 6, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('milan', 'Gabriele Mazza', 7, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('milan', 'Davide Galli', 8, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('milan', 'Riccardo Conti', 9, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('milan', 'Filippo Marino', 10, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('milan', 'Marco Leone', 11, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('milan', 'Giovanni Morelli', 12, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('milan', 'Matteo Gatti', 13, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('milan', 'Luca Basso', 14, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('milan', 'Pietro Barbieri', 15, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('milan', 'Stefano Rossi', 16, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('milan', 'Federico Ferrari', 17, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('milan', 'Alessandro Bianchi', 18, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('milan', 'Lorenzo Romano', 19, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('juventus', 'Alessandro Ferrari', 1, 'POR');
INSERT INTO public.players (team_id, name, number, position) VALUES ('juventus', 'Lorenzo Romano', 2, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('juventus', 'Francesco Colombo', 3, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('juventus', 'Leonardo Ricci', 4, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('juventus', 'Mattia Moretti', 5, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('juventus', 'Andrea Bruno', 6, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('juventus', 'Gabriele Mazza', 7, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('juventus', 'Davide Galli', 8, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('juventus', 'Riccardo Conti', 9, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('juventus', 'Filippo Marino', 10, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('juventus', 'Marco Leone', 11, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('juventus', 'Giovanni Morelli', 12, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('juventus', 'Matteo Gatti', 13, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('juventus', 'Luca Basso', 14, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('juventus', 'Pietro Barbieri', 15, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('juventus', 'Stefano Rossi', 16, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('juventus', 'Federico Ferrari', 17, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('juventus', 'Alessandro Bianchi', 18, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('juventus', 'Lorenzo Romano', 19, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('atalanta', 'Alessandro Ferrari', 1, 'POR');
INSERT INTO public.players (team_id, name, number, position) VALUES ('atalanta', 'Lorenzo Romano', 2, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('atalanta', 'Francesco Colombo', 3, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('atalanta', 'Leonardo Ricci', 4, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('atalanta', 'Mattia Moretti', 5, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('atalanta', 'Andrea Bruno', 6, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('atalanta', 'Gabriele Mazza', 7, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('atalanta', 'Davide Galli', 8, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('atalanta', 'Riccardo Conti', 9, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('atalanta', 'Filippo Marino', 10, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('atalanta', 'Marco Leone', 11, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('atalanta', 'Giovanni Morelli', 12, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('atalanta', 'Matteo Gatti', 13, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('atalanta', 'Luca Basso', 14, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('atalanta', 'Pietro Barbieri', 15, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('atalanta', 'Stefano Rossi', 16, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('atalanta', 'Federico Ferrari', 17, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('atalanta', 'Alessandro Bianchi', 18, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('atalanta', 'Lorenzo Romano', 19, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('bologna', 'Alessandro Ferrari', 1, 'POR');
INSERT INTO public.players (team_id, name, number, position) VALUES ('bologna', 'Lorenzo Romano', 2, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('bologna', 'Francesco Colombo', 3, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('bologna', 'Leonardo Ricci', 4, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('bologna', 'Mattia Moretti', 5, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('bologna', 'Andrea Bruno', 6, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('bologna', 'Gabriele Mazza', 7, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('bologna', 'Davide Galli', 8, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('bologna', 'Riccardo Conti', 9, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('bologna', 'Filippo Marino', 10, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('bologna', 'Marco Leone', 11, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('bologna', 'Giovanni Morelli', 12, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('bologna', 'Matteo Gatti', 13, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('bologna', 'Luca Basso', 14, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('bologna', 'Pietro Barbieri', 15, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('bologna', 'Stefano Rossi', 16, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('bologna', 'Federico Ferrari', 17, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('bologna', 'Alessandro Bianchi', 18, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('bologna', 'Lorenzo Romano', 19, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('paris-saint-germain', 'Gianluigi Donnarumma', 99, 'POR');
INSERT INTO public.players (team_id, name, number, position) VALUES ('paris-saint-germain', 'Achraf Hakimi', 2, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('paris-saint-germain', 'Marquinhos', 5, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('paris-saint-germain', 'Willian Pacho', 51, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('paris-saint-germain', 'Nuno Mendes', 25, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('paris-saint-germain', 'Vitinha', 17, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('paris-saint-germain', 'Warren Zaïre-Emery', 33, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('paris-saint-germain', 'João Neves', 87, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('paris-saint-germain', 'Ousmane Dembélé', 10, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('paris-saint-germain', 'Bradley Barcola', 29, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('paris-saint-germain', 'Marco Asensio', 11, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('paris-saint-germain', 'Matvey Safonov', 39, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('paris-saint-germain', 'Lucas Beraldo', 20, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('paris-saint-germain', 'Milan Škriniar', 37, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('paris-saint-germain', 'Yoram Zague', 42, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('paris-saint-germain', 'Senny Mayulu', 24, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('paris-saint-germain', 'Fabián Ruiz', 8, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('paris-saint-germain', 'Kang-in Lee', 19, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('paris-saint-germain', 'Randal Kolo Muani', 23, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('monaco', 'Hugo Bernard', 1, 'POR');
INSERT INTO public.players (team_id, name, number, position) VALUES ('monaco', 'Lucas Richard', 2, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('monaco', 'Arthur Robert', 3, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('monaco', 'Thomas Petit', 4, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('monaco', 'Antoine Moreau', 5, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('monaco', 'Clément Laurent', 6, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('monaco', 'Alexandre Lefevre', 7, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('monaco', 'Maxime Mercier', 8, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('monaco', 'Pierre Dupont', 9, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('monaco', 'Nicolas Fournier', 10, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('monaco', 'Jean Fontaine', 11, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('monaco', 'Mathieu Guerin', 12, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('monaco', 'Julien Boyer', 13, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('monaco', 'Théo Chevalier', 14, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('monaco', 'Enzo Martin', 15, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('monaco', 'Nathan Bernard', 16, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('monaco', 'Louis Dubois', 17, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('monaco', 'Raphaël Richard', 18, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('monaco', 'Hugo Robert', 19, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('brest', 'Hugo Bernard', 1, 'POR');
INSERT INTO public.players (team_id, name, number, position) VALUES ('brest', 'Lucas Richard', 2, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('brest', 'Arthur Robert', 3, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('brest', 'Thomas Petit', 4, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('brest', 'Antoine Moreau', 5, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('brest', 'Clément Laurent', 6, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('brest', 'Alexandre Lefevre', 7, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('brest', 'Maxime Mercier', 8, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('brest', 'Pierre Dupont', 9, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('brest', 'Nicolas Fournier', 10, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('brest', 'Jean Fontaine', 11, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('brest', 'Mathieu Guerin', 12, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('brest', 'Julien Boyer', 13, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('brest', 'Théo Chevalier', 14, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('brest', 'Enzo Martin', 15, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('brest', 'Nathan Bernard', 16, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('brest', 'Louis Dubois', 17, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('brest', 'Raphaël Richard', 18, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('brest', 'Hugo Robert', 19, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('lille', 'Hugo Bernard', 1, 'POR');
INSERT INTO public.players (team_id, name, number, position) VALUES ('lille', 'Lucas Richard', 2, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('lille', 'Arthur Robert', 3, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('lille', 'Thomas Petit', 4, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('lille', 'Antoine Moreau', 5, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('lille', 'Clément Laurent', 6, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('lille', 'Alexandre Lefevre', 7, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('lille', 'Maxime Mercier', 8, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('lille', 'Pierre Dupont', 9, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('lille', 'Nicolas Fournier', 10, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('lille', 'Jean Fontaine', 11, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('lille', 'Mathieu Guerin', 12, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('lille', 'Julien Boyer', 13, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('lille', 'Théo Chevalier', 14, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('lille', 'Enzo Martin', 15, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('lille', 'Nathan Bernard', 16, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('lille', 'Louis Dubois', 17, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('lille', 'Raphaël Richard', 18, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('lille', 'Hugo Robert', 19, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('psv-eindhoven', 'Sven van Dijk', 1, 'POR');
INSERT INTO public.players (team_id, name, number, position) VALUES ('psv-eindhoven', 'Daan Bakker', 2, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('psv-eindhoven', 'Lars de Groot', 3, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('psv-eindhoven', 'Luuk Visser', 4, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('psv-eindhoven', 'Bram Meijer', 5, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('psv-eindhoven', 'Milan Vos', 6, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('psv-eindhoven', 'Sem Bos', 7, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('psv-eindhoven', 'Stijn Dekker', 8, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('psv-eindhoven', 'Thijs Hendriks', 9, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('psv-eindhoven', 'Jesse Schouten', 10, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('psv-eindhoven', 'Thomas de Jong', 11, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('psv-eindhoven', 'Niek Bakker', 12, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('psv-eindhoven', 'Bas de Groot', 13, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('psv-eindhoven', 'Joost Visser', 14, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('psv-eindhoven', 'Sven Meijer', 15, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('psv-eindhoven', 'Daan Vos', 16, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('psv-eindhoven', 'Lars Bos', 17, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('psv-eindhoven', 'Luuk Dekker', 18, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('psv-eindhoven', 'Bram Hendriks', 19, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('feyenoord', 'Sven van Dijk', 1, 'POR');
INSERT INTO public.players (team_id, name, number, position) VALUES ('feyenoord', 'Daan Bakker', 2, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('feyenoord', 'Lars de Groot', 3, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('feyenoord', 'Luuk Visser', 4, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('feyenoord', 'Bram Meijer', 5, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('feyenoord', 'Milan Vos', 6, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('feyenoord', 'Sem Bos', 7, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('feyenoord', 'Stijn Dekker', 8, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('feyenoord', 'Thijs Hendriks', 9, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('feyenoord', 'Jesse Schouten', 10, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('feyenoord', 'Thomas de Jong', 11, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('feyenoord', 'Niek Bakker', 12, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('feyenoord', 'Bas de Groot', 13, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('feyenoord', 'Joost Visser', 14, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('feyenoord', 'Sven Meijer', 15, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('feyenoord', 'Daan Vos', 16, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('feyenoord', 'Lars Bos', 17, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('feyenoord', 'Luuk Dekker', 18, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('feyenoord', 'Bram Hendriks', 19, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('sporting-cp', 'João Santos', 1, 'POR');
INSERT INTO public.players (team_id, name, number, position) VALUES ('sporting-cp', 'Nuno Pereira', 2, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('sporting-cp', 'Rui Oliveira', 3, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('sporting-cp', 'Pedro Costa', 4, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('sporting-cp', 'Diogo Rodrigues', 5, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('sporting-cp', 'Tiago Almeida', 6, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('sporting-cp', 'Miguel Nascimento', 7, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('sporting-cp', 'Afonso Cardoso', 8, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('sporting-cp', 'Gonçalo Sousa', 9, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('sporting-cp', 'Francisco Pinto', 10, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('sporting-cp', 'André Silva', 11, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('sporting-cp', 'Filipe Pereira', 12, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('sporting-cp', 'João Oliveira', 13, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('sporting-cp', 'Nuno Costa', 14, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('sporting-cp', 'Rui Rodrigues', 15, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('sporting-cp', 'Pedro Almeida', 16, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('sporting-cp', 'Diogo Nascimento', 17, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('sporting-cp', 'Tiago Cardoso', 18, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('sporting-cp', 'Miguel Sousa', 19, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('benfica', 'João Santos', 1, 'POR');
INSERT INTO public.players (team_id, name, number, position) VALUES ('benfica', 'Nuno Pereira', 2, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('benfica', 'Rui Oliveira', 3, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('benfica', 'Pedro Costa', 4, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('benfica', 'Diogo Rodrigues', 5, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('benfica', 'Tiago Almeida', 6, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('benfica', 'Miguel Nascimento', 7, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('benfica', 'Afonso Cardoso', 8, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('benfica', 'Gonçalo Sousa', 9, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('benfica', 'Francisco Pinto', 10, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('benfica', 'André Silva', 11, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('benfica', 'Filipe Pereira', 12, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('benfica', 'João Oliveira', 13, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('benfica', 'Nuno Costa', 14, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('benfica', 'Rui Rodrigues', 15, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('benfica', 'Pedro Almeida', 16, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('benfica', 'Diogo Nascimento', 17, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('benfica', 'Tiago Cardoso', 18, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('benfica', 'Miguel Sousa', 19, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('club-brugge', 'Hugo Bernard', 1, 'POR');
INSERT INTO public.players (team_id, name, number, position) VALUES ('club-brugge', 'Lucas Richard', 2, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('club-brugge', 'Arthur Robert', 3, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('club-brugge', 'Thomas Petit', 4, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('club-brugge', 'Antoine Moreau', 5, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('club-brugge', 'Clément Laurent', 6, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('club-brugge', 'Alexandre Lefevre', 7, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('club-brugge', 'Maxime Mercier', 8, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('club-brugge', 'Pierre Dupont', 9, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('club-brugge', 'Nicolas Fournier', 10, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('club-brugge', 'Jean Fontaine', 11, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('club-brugge', 'Mathieu Guerin', 12, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('club-brugge', 'Julien Boyer', 13, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('club-brugge', 'Théo Chevalier', 14, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('club-brugge', 'Enzo Martin', 15, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('club-brugge', 'Nathan Bernard', 16, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('club-brugge', 'Louis Dubois', 17, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('club-brugge', 'Raphaël Richard', 18, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('club-brugge', 'Hugo Robert', 19, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('celtic', 'Harry Jones', 1, 'POR');
INSERT INTO public.players (team_id, name, number, position) VALUES ('celtic', 'Oliver Brown', 2, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('celtic', 'George Williams', 3, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('celtic', 'Jack Wilson', 4, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('celtic', 'Noah Johnson', 5, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('celtic', 'Jacob Davies', 6, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('celtic', 'William Robinson', 7, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('celtic', 'Charlie Wright', 8, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('celtic', 'Thomas Green', 9, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('celtic', 'James Evans', 10, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('celtic', 'Marcus Walker', 11, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('celtic', 'Mason Cole', 12, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('celtic', 'Liam Stone', 13, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('celtic', 'Edward Brooks', 14, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('celtic', 'Arthur Cooper', 15, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('celtic', 'Danny Harrison', 16, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('celtic', 'Luke Smith', 17, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('celtic', 'Ryan Jones', 18, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('celtic', 'John Taylor', 19, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('sturm-graz', 'Lukas Müller', 1, 'POR');
INSERT INTO public.players (team_id, name, number, position) VALUES ('sturm-graz', 'Thomas Weber', 2, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('sturm-graz', 'Jonas Becker', 3, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('sturm-graz', 'Maximilian Hoffmann', 4, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('sturm-graz', 'Leon Wagner', 5, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('sturm-graz', 'Felix Schäfer', 6, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('sturm-graz', 'Simon Koch', 7, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('sturm-graz', 'David Bauer', 8, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('sturm-graz', 'Sebastian Richter', 9, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('sturm-graz', 'Alexander Wolf', 10, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('sturm-graz', 'Benjamin Neumann', 11, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('sturm-graz', 'Jan Zimmermann', 12, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('sturm-graz', 'Tobias Hartmann', 13, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('sturm-graz', 'Niklas Krüger', 14, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('sturm-graz', 'Florian Schmidt', 15, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('sturm-graz', 'Tim Müller', 16, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('sturm-graz', 'Philipp Fischer', 17, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('sturm-graz', 'Moritz Weber', 18, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('sturm-graz', 'Lukas Becker', 19, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('red-bull-salzburg', 'Lukas Müller', 1, 'POR');
INSERT INTO public.players (team_id, name, number, position) VALUES ('red-bull-salzburg', 'Thomas Weber', 2, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('red-bull-salzburg', 'Jonas Becker', 3, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('red-bull-salzburg', 'Maximilian Hoffmann', 4, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('red-bull-salzburg', 'Leon Wagner', 5, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('red-bull-salzburg', 'Felix Schäfer', 6, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('red-bull-salzburg', 'Simon Koch', 7, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('red-bull-salzburg', 'David Bauer', 8, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('red-bull-salzburg', 'Sebastian Richter', 9, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('red-bull-salzburg', 'Alexander Wolf', 10, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('red-bull-salzburg', 'Benjamin Neumann', 11, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('red-bull-salzburg', 'Jan Zimmermann', 12, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('red-bull-salzburg', 'Tobias Hartmann', 13, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('red-bull-salzburg', 'Niklas Krüger', 14, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('red-bull-salzburg', 'Florian Schmidt', 15, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('red-bull-salzburg', 'Tim Müller', 16, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('red-bull-salzburg', 'Philipp Fischer', 17, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('red-bull-salzburg', 'Moritz Weber', 18, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('red-bull-salzburg', 'Lukas Becker', 19, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('shakhtar-donetsk', 'Luka Kovac', 1, 'POR');
INSERT INTO public.players (team_id, name, number, position) VALUES ('shakhtar-donetsk', 'Ivan Szabo', 2, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('shakhtar-donetsk', 'Jan Petrovic', 3, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('shakhtar-donetsk', 'Peter Shevchenko', 4, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('shakhtar-donetsk', 'Milan Jovanovic', 5, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('shakhtar-donetsk', 'Andrej Kozlov', 6, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('shakhtar-donetsk', 'Dmytro Horvat', 7, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('shakhtar-donetsk', 'Nikola Krajnc', 8, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('shakhtar-donetsk', 'Dušan Prochazka', 9, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('shakhtar-donetsk', 'Matej Krejci', 10, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('shakhtar-donetsk', 'Marek Novak', 11, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('shakhtar-donetsk', 'David Szabo', 12, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('shakhtar-donetsk', 'Filip Petrovic', 13, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('shakhtar-donetsk', 'Luka Shevchenko', 14, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('shakhtar-donetsk', 'Ivan Jovanovic', 15, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('shakhtar-donetsk', 'Jan Kozlov', 16, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('shakhtar-donetsk', 'Peter Horvat', 17, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('shakhtar-donetsk', 'Milan Krajnc', 18, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('shakhtar-donetsk', 'Andrej Prochazka', 19, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('red-star-belgrade', 'Luka Kovac', 1, 'POR');
INSERT INTO public.players (team_id, name, number, position) VALUES ('red-star-belgrade', 'Ivan Szabo', 2, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('red-star-belgrade', 'Jan Petrovic', 3, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('red-star-belgrade', 'Peter Shevchenko', 4, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('red-star-belgrade', 'Milan Jovanovic', 5, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('red-star-belgrade', 'Andrej Kozlov', 6, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('red-star-belgrade', 'Dmytro Horvat', 7, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('red-star-belgrade', 'Nikola Krajnc', 8, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('red-star-belgrade', 'Dušan Prochazka', 9, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('red-star-belgrade', 'Matej Krejci', 10, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('red-star-belgrade', 'Marek Novak', 11, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('red-star-belgrade', 'David Szabo', 12, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('red-star-belgrade', 'Filip Petrovic', 13, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('red-star-belgrade', 'Luka Shevchenko', 14, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('red-star-belgrade', 'Ivan Jovanovic', 15, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('red-star-belgrade', 'Jan Kozlov', 16, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('red-star-belgrade', 'Peter Horvat', 17, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('red-star-belgrade', 'Milan Krajnc', 18, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('red-star-belgrade', 'Andrej Prochazka', 19, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('young-boys', 'Lukas Müller', 1, 'POR');
INSERT INTO public.players (team_id, name, number, position) VALUES ('young-boys', 'Thomas Weber', 2, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('young-boys', 'Jonas Becker', 3, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('young-boys', 'Maximilian Hoffmann', 4, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('young-boys', 'Leon Wagner', 5, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('young-boys', 'Felix Schäfer', 6, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('young-boys', 'Simon Koch', 7, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('young-boys', 'David Bauer', 8, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('young-boys', 'Sebastian Richter', 9, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('young-boys', 'Alexander Wolf', 10, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('young-boys', 'Benjamin Neumann', 11, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('young-boys', 'Jan Zimmermann', 12, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('young-boys', 'Tobias Hartmann', 13, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('young-boys', 'Niklas Krüger', 14, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('young-boys', 'Florian Schmidt', 15, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('young-boys', 'Tim Müller', 16, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('young-boys', 'Philipp Fischer', 17, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('young-boys', 'Moritz Weber', 18, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('young-boys', 'Lukas Becker', 19, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('dinamo-zagreb', 'Luka Kovac', 1, 'POR');
INSERT INTO public.players (team_id, name, number, position) VALUES ('dinamo-zagreb', 'Ivan Szabo', 2, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('dinamo-zagreb', 'Jan Petrovic', 3, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('dinamo-zagreb', 'Peter Shevchenko', 4, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('dinamo-zagreb', 'Milan Jovanovic', 5, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('dinamo-zagreb', 'Andrej Kozlov', 6, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('dinamo-zagreb', 'Dmytro Horvat', 7, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('dinamo-zagreb', 'Nikola Krajnc', 8, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('dinamo-zagreb', 'Dušan Prochazka', 9, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('dinamo-zagreb', 'Matej Krejci', 10, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('dinamo-zagreb', 'Marek Novak', 11, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('dinamo-zagreb', 'David Szabo', 12, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('dinamo-zagreb', 'Filip Petrovic', 13, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('dinamo-zagreb', 'Luka Shevchenko', 14, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('dinamo-zagreb', 'Ivan Jovanovic', 15, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('dinamo-zagreb', 'Jan Kozlov', 16, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('dinamo-zagreb', 'Peter Horvat', 17, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('dinamo-zagreb', 'Milan Krajnc', 18, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('dinamo-zagreb', 'Andrej Prochazka', 19, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('slovan-bratislava', 'Luka Kovac', 1, 'POR');
INSERT INTO public.players (team_id, name, number, position) VALUES ('slovan-bratislava', 'Ivan Szabo', 2, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('slovan-bratislava', 'Jan Petrovic', 3, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('slovan-bratislava', 'Peter Shevchenko', 4, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('slovan-bratislava', 'Milan Jovanovic', 5, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('slovan-bratislava', 'Andrej Kozlov', 6, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('slovan-bratislava', 'Dmytro Horvat', 7, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('slovan-bratislava', 'Nikola Krajnc', 8, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('slovan-bratislava', 'Dušan Prochazka', 9, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('slovan-bratislava', 'Matej Krejci', 10, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('slovan-bratislava', 'Marek Novak', 11, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('slovan-bratislava', 'David Szabo', 12, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('slovan-bratislava', 'Filip Petrovic', 13, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('slovan-bratislava', 'Luka Shevchenko', 14, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('slovan-bratislava', 'Ivan Jovanovic', 15, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('slovan-bratislava', 'Jan Kozlov', 16, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('slovan-bratislava', 'Peter Horvat', 17, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('slovan-bratislava', 'Milan Krajnc', 18, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('slovan-bratislava', 'Andrej Prochazka', 19, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('sparta-prague', 'Luka Kovac', 1, 'POR');
INSERT INTO public.players (team_id, name, number, position) VALUES ('sparta-prague', 'Ivan Szabo', 2, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('sparta-prague', 'Jan Petrovic', 3, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('sparta-prague', 'Peter Shevchenko', 4, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('sparta-prague', 'Milan Jovanovic', 5, 'DEF');
INSERT INTO public.players (team_id, name, number, position) VALUES ('sparta-prague', 'Andrej Kozlov', 6, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('sparta-prague', 'Dmytro Horvat', 7, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('sparta-prague', 'Nikola Krajnc', 8, 'MED');
INSERT INTO public.players (team_id, name, number, position) VALUES ('sparta-prague', 'Dušan Prochazka', 9, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('sparta-prague', 'Matej Krejci', 10, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('sparta-prague', 'Marek Novak', 11, 'DEL');
INSERT INTO public.players (team_id, name, number, position) VALUES ('sparta-prague', 'David Szabo', 12, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('sparta-prague', 'Filip Petrovic', 13, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('sparta-prague', 'Luka Shevchenko', 14, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('sparta-prague', 'Ivan Jovanovic', 15, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('sparta-prague', 'Jan Kozlov', 16, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('sparta-prague', 'Peter Horvat', 17, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('sparta-prague', 'Milan Krajnc', 18, 'SUB');
INSERT INTO public.players (team_id, name, number, position) VALUES ('sparta-prague', 'Andrej Prochazka', 19, 'SUB');
INSERT INTO public.match_details (match_id, home_formation, away_formation, stats, home_substitutions, away_substitutions) VALUES (
  'ybg-avl-2024-09-17', '4-3-3', '4-3-3',
  '{"xg":[0.8,3.1],"shots":[12,15],"shotsOnTarget":[1,3],"possession":[46,54],"passes":[437,513],"passAccuracy":[87,83],"fouls":[12,12],"yellowCards":[2,2],"redCards":[0,0],"offsides":[0,1],"corners":[3,7]}'::jsonb,
  '[{"playerIn":"Jan Zimmermann","playerOut":"Sebastian Richter","minute":60},{"playerIn":"Tobias Hartmann","playerOut":"David Bauer","minute":68},{"playerIn":"Niklas Krüger","playerOut":"Simon Koch","minute":76}]'::jsonb,
  '[{"playerIn":"Mason Cole","playerOut":"Thomas Green","minute":62},{"playerIn":"Liam Stone","playerOut":"Charlie Wright","minute":69},{"playerIn":"Edward Brooks","playerOut":"William Robinson","minute":76}]'::jsonb
) ON CONFLICT (match_id) DO NOTHING;
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('ybg-avl-2024-09-17', 'goal', 'aston-villa', 19, 'Charlie Wright', 'Asist: Davies');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('ybg-avl-2024-09-17', 'goal', 'aston-villa', 25, 'Thomas Green', 'Asist: Robinson');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('ybg-avl-2024-09-17', 'goal', 'aston-villa', 22, 'James Evans', 'Asist: Wright');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('ybg-avl-2024-09-17', 'card', 'young-boys', 7, 'Thomas Weber', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('ybg-avl-2024-09-17', 'card', 'aston-villa', 59, 'Oliver Brown', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('ybg-avl-2024-09-17', 'card', 'young-boys', 79, 'Jonas Becker', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('ybg-avl-2024-09-17', 'card', 'aston-villa', 49, 'George Williams', 'Tarjeta Amarilla');
INSERT INTO public.match_details (match_id, home_formation, away_formation, stats, home_substitutions, away_substitutions) VALUES (
  'juv-psv-2024-09-17', '4-3-3', '4-3-3',
  '{"xg":[3.1,1.6],"shots":[19,10],"shotsOnTarget":[4,1],"possession":[51,49],"passes":[484,465],"passAccuracy":[85,83],"fouls":[12,15],"yellowCards":[2,2],"redCards":[0,0],"offsides":[3,2],"corners":[8,6]}'::jsonb,
  '[{"playerIn":"Giovanni Morelli","playerOut":"Riccardo Conti","minute":60},{"playerIn":"Matteo Gatti","playerOut":"Davide Galli","minute":68},{"playerIn":"Luca Basso","playerOut":"Gabriele Mazza","minute":76}]'::jsonb,
  '[{"playerIn":"Niek Bakker","playerOut":"Thijs Hendriks","minute":62},{"playerIn":"Bas de Groot","playerOut":"Stijn Dekker","minute":69},{"playerIn":"Joost Visser","playerOut":"Sem Bos","minute":76}]'::jsonb
) ON CONFLICT (match_id) DO NOTHING;
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('juv-psv-2024-09-17', 'goal', 'juventus', 29, 'Davide Galli', 'Asist: Bruno');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('juv-psv-2024-09-17', 'goal', 'juventus', 82, 'Riccardo Conti', 'Asist: Mazza');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('juv-psv-2024-09-17', 'goal', 'juventus', 58, 'Filippo Marino', 'Asist: Galli');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('juv-psv-2024-09-17', 'goal', 'psv-eindhoven', 41, 'Stijn Dekker', 'Asist: Vos');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('juv-psv-2024-09-17', 'card', 'juventus', 42, 'Lorenzo Romano', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('juv-psv-2024-09-17', 'card', 'psv-eindhoven', 63, 'Daan Bakker', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('juv-psv-2024-09-17', 'card', 'juventus', 17, 'Francesco Colombo', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('juv-psv-2024-09-17', 'card', 'psv-eindhoven', 36, 'Lars de Groot', 'Tarjeta Amarilla');
INSERT INTO public.match_details (match_id, home_formation, away_formation, stats, home_substitutions, away_substitutions) VALUES (
  'mil-liv-2024-09-17', '4-3-3', '4-3-3',
  '{"xg":[1.9,3.7],"shots":[15,17],"shotsOnTarget":[3,4],"possession":[57,43],"passes":[541,408],"passAccuracy":[78,85],"fouls":[15,13],"yellowCards":[2,2],"redCards":[0,0],"offsides":[1,3],"corners":[6,6]}'::jsonb,
  '[{"playerIn":"Giovanni Morelli","playerOut":"Riccardo Conti","minute":60},{"playerIn":"Matteo Gatti","playerOut":"Davide Galli","minute":68},{"playerIn":"Luca Basso","playerOut":"Gabriele Mazza","minute":76}]'::jsonb,
  '[{"playerIn":"Caoimhin Kelleher","playerOut":"Mohamed Salah","minute":62},{"playerIn":"Joe Gomez","playerOut":"Dominik Szoboszlai","minute":69},{"playerIn":"Jarell Quansah","playerOut":"Alexis Mac Allister","minute":76}]'::jsonb
) ON CONFLICT (match_id) DO NOTHING;
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('mil-liv-2024-09-17', 'goal', 'milan', 80, 'Davide Galli', 'Asist: Bruno');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('mil-liv-2024-09-17', 'goal', 'liverpool', 3, 'Dominik Szoboszlai', 'Asist: Gravenberch');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('mil-liv-2024-09-17', 'goal', 'liverpool', 34, 'Mohamed Salah', 'Asist: Allister');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('mil-liv-2024-09-17', 'goal', 'liverpool', 44, 'Diogo Jota', 'Asist: Szoboszlai');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('mil-liv-2024-09-17', 'card', 'milan', 29, 'Lorenzo Romano', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('mil-liv-2024-09-17', 'card', 'liverpool', 14, 'Trent Alexander-Arnold', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('mil-liv-2024-09-17', 'card', 'milan', 15, 'Francesco Colombo', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('mil-liv-2024-09-17', 'card', 'liverpool', 82, 'Ibrahima Konaté', 'Tarjeta Amarilla');
INSERT INTO public.match_details (match_id, home_formation, away_formation, stats, home_substitutions, away_substitutions) VALUES (
  'bay-dnz-2024-09-17', '4-3-3', '4-3-3',
  '{"xg":[9.8,2.3],"shots":[39,12],"shotsOnTarget":[10,3],"possession":[48,52],"passes":[456,494],"passAccuracy":[75,85],"fouls":[11,10],"yellowCards":[2,2],"redCards":[0,0],"offsides":[0,3],"corners":[8,6]}'::jsonb,
  '[{"playerIn":"Sven Ulreich","playerOut":"Jamal Musiala","minute":60},{"playerIn":"Eric Dier","playerOut":"Michael Olise","minute":68},{"playerIn":"Raphaël Guerreiro","playerOut":"João Palhinha","minute":76}]'::jsonb,
  '[{"playerIn":"David Szabo","playerOut":"Dušan Prochazka","minute":62},{"playerIn":"Filip Petrovic","playerOut":"Nikola Krajnc","minute":69},{"playerIn":"Luka Shevchenko","playerOut":"Dmytro Horvat","minute":76}]'::jsonb
) ON CONFLICT (match_id) DO NOTHING;
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bay-dnz-2024-09-17', 'goal', 'bayern-munich', 34, 'Michael Olise', 'Asist: Pavlović');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bay-dnz-2024-09-17', 'goal', 'bayern-munich', 70, 'Jamal Musiala', 'Asist: Palhinha');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bay-dnz-2024-09-17', 'goal', 'bayern-munich', 88, 'Serge Gnabry', 'Asist: Olise');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bay-dnz-2024-09-17', 'goal', 'bayern-munich', 13, 'Harry Kane', 'Asist: Pavlović');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bay-dnz-2024-09-17', 'goal', 'bayern-munich', 46, 'Michael Olise', 'Asist: Palhinha');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bay-dnz-2024-09-17', 'goal', 'bayern-munich', 77, 'Jamal Musiala', 'Asist: Olise');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bay-dnz-2024-09-17', 'goal', 'bayern-munich', 39, 'Serge Gnabry', 'Asist: Pavlović');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bay-dnz-2024-09-17', 'goal', 'bayern-munich', 56, 'Harry Kane', 'Asist: Palhinha');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bay-dnz-2024-09-17', 'goal', 'bayern-munich', 52, 'Michael Olise', 'Asist: Olise');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bay-dnz-2024-09-17', 'goal', 'dinamo-zagreb', 88, 'Nikola Krajnc', 'Asist: Kozlov');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bay-dnz-2024-09-17', 'goal', 'dinamo-zagreb', 38, 'Dušan Prochazka', 'Asist: Horvat');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bay-dnz-2024-09-17', 'card', 'bayern-munich', 21, 'Joshua Kimmich', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bay-dnz-2024-09-17', 'card', 'dinamo-zagreb', 16, 'Ivan Szabo', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bay-dnz-2024-09-17', 'card', 'bayern-munich', 33, 'Dayot Upamecano', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bay-dnz-2024-09-17', 'card', 'dinamo-zagreb', 23, 'Jan Petrovic', 'Tarjeta Amarilla');
INSERT INTO public.match_details (match_id, home_formation, away_formation, stats, home_substitutions, away_substitutions) VALUES (
  'rma-stu-2024-09-17', '4-3-3', '4-3-3',
  '{"xg":[3.3,1.8],"shots":[19,11],"shotsOnTarget":[6,3],"possession":[57,43],"passes":[541,408],"passAccuracy":[88,87],"fouls":[10,10],"yellowCards":[2,2],"redCards":[0,0],"offsides":[3,1],"corners":[5,7]}'::jsonb,
  '[{"playerIn":"Andriy Lunin","playerOut":"Rodrygo Goes","minute":60},{"playerIn":"Lucas Vázquez","playerOut":"Jude Bellingham","minute":68},{"playerIn":"Fran García","playerOut":"Aurélien Tchouaméni","minute":76}]'::jsonb,
  '[{"playerIn":"Jan Zimmermann","playerOut":"Sebastian Richter","minute":62},{"playerIn":"Tobias Hartmann","playerOut":"David Bauer","minute":69},{"playerIn":"Niklas Krüger","playerOut":"Simon Koch","minute":76}]'::jsonb
) ON CONFLICT (match_id) DO NOTHING;
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('rma-stu-2024-09-17', 'goal', 'real-madrid', 57, 'Jude Bellingham', 'Asist: Valverde');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('rma-stu-2024-09-17', 'goal', 'real-madrid', 28, 'Rodrygo Goes', 'Asist: Tchouaméni');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('rma-stu-2024-09-17', 'goal', 'real-madrid', 27, 'Kylian Mbappé', 'Asist: Bellingham');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('rma-stu-2024-09-17', 'goal', 'vfb-stuttgart', 24, 'David Bauer', 'Asist: Schäfer');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('rma-stu-2024-09-17', 'card', 'real-madrid', 11, 'Dani Carvajal', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('rma-stu-2024-09-17', 'card', 'vfb-stuttgart', 78, 'Thomas Weber', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('rma-stu-2024-09-17', 'card', 'real-madrid', 66, 'Éder Militão', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('rma-stu-2024-09-17', 'card', 'vfb-stuttgart', 12, 'Jonas Becker', 'Tarjeta Amarilla');
INSERT INTO public.match_details (match_id, home_formation, away_formation, stats, home_substitutions, away_substitutions) VALUES (
  'scp-lil-2024-09-17', '4-3-3', '4-3-3',
  '{"xg":[2.5,0.6],"shots":[17,7],"shotsOnTarget":[3,0],"possession":[46,54],"passes":[437,513],"passAccuracy":[82,88],"fouls":[14,13],"yellowCards":[2,2],"redCards":[0,0],"offsides":[0,0],"corners":[8,5]}'::jsonb,
  '[{"playerIn":"Filipe Pereira","playerOut":"Gonçalo Sousa","minute":60},{"playerIn":"João Oliveira","playerOut":"Afonso Cardoso","minute":68},{"playerIn":"Nuno Costa","playerOut":"Miguel Nascimento","minute":76}]'::jsonb,
  '[{"playerIn":"Mathieu Guerin","playerOut":"Pierre Dupont","minute":62},{"playerIn":"Julien Boyer","playerOut":"Maxime Mercier","minute":69},{"playerIn":"Théo Chevalier","playerOut":"Alexandre Lefevre","minute":76}]'::jsonb
) ON CONFLICT (match_id) DO NOTHING;
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('scp-lil-2024-09-17', 'goal', 'sporting-cp', 75, 'Afonso Cardoso', 'Asist: Almeida');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('scp-lil-2024-09-17', 'goal', 'sporting-cp', 52, 'Gonçalo Sousa', 'Asist: Nascimento');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('scp-lil-2024-09-17', 'card', 'sporting-cp', 89, 'Nuno Pereira', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('scp-lil-2024-09-17', 'card', 'lille', 57, 'Lucas Richard', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('scp-lil-2024-09-17', 'card', 'sporting-cp', 16, 'Rui Oliveira', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('scp-lil-2024-09-17', 'card', 'lille', 59, 'Arthur Robert', 'Tarjeta Amarilla');
INSERT INTO public.match_details (match_id, home_formation, away_formation, stats, home_substitutions, away_substitutions) VALUES (
  'spa-rbs-2024-09-17', '4-3-3', '4-3-3',
  '{"xg":[3.1,0.3],"shots":[19,6],"shotsOnTarget":[6,0],"possession":[51,49],"passes":[484,465],"passAccuracy":[85,83],"fouls":[14,14],"yellowCards":[2,2],"redCards":[0,0],"offsides":[1,1],"corners":[7,6]}'::jsonb,
  '[{"playerIn":"David Szabo","playerOut":"Dušan Prochazka","minute":60},{"playerIn":"Filip Petrovic","playerOut":"Nikola Krajnc","minute":68},{"playerIn":"Luka Shevchenko","playerOut":"Dmytro Horvat","minute":76}]'::jsonb,
  '[{"playerIn":"Jan Zimmermann","playerOut":"Sebastian Richter","minute":62},{"playerIn":"Tobias Hartmann","playerOut":"David Bauer","minute":69},{"playerIn":"Niklas Krüger","playerOut":"Simon Koch","minute":76}]'::jsonb
) ON CONFLICT (match_id) DO NOTHING;
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('spa-rbs-2024-09-17', 'goal', 'sparta-prague', 7, 'Nikola Krajnc', 'Asist: Kozlov');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('spa-rbs-2024-09-17', 'goal', 'sparta-prague', 43, 'Dušan Prochazka', 'Asist: Horvat');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('spa-rbs-2024-09-17', 'goal', 'sparta-prague', 50, 'Matej Krejci', 'Asist: Krajnc');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('spa-rbs-2024-09-17', 'card', 'sparta-prague', 65, 'Ivan Szabo', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('spa-rbs-2024-09-17', 'card', 'red-bull-salzburg', 83, 'Thomas Weber', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('spa-rbs-2024-09-17', 'card', 'sparta-prague', 43, 'Jan Petrovic', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('spa-rbs-2024-09-17', 'card', 'red-bull-salzburg', 34, 'Jonas Becker', 'Tarjeta Amarilla');
INSERT INTO public.match_details (match_id, home_formation, away_formation, stats, home_substitutions, away_substitutions) VALUES (
  'bol-sha-2024-09-17', '4-3-3', '4-3-3',
  '{"xg":[0.3,0.8],"shots":[10,8],"shotsOnTarget":[3,2],"possession":[45,55],"passes":[427,522],"passAccuracy":[83,77],"fouls":[10,15],"yellowCards":[2,2],"redCards":[0,0],"offsides":[3,2],"corners":[7,3]}'::jsonb,
  '[{"playerIn":"Giovanni Morelli","playerOut":"Riccardo Conti","minute":60},{"playerIn":"Matteo Gatti","playerOut":"Davide Galli","minute":68},{"playerIn":"Luca Basso","playerOut":"Gabriele Mazza","minute":76}]'::jsonb,
  '[{"playerIn":"David Szabo","playerOut":"Dušan Prochazka","minute":62},{"playerIn":"Filip Petrovic","playerOut":"Nikola Krajnc","minute":69},{"playerIn":"Luka Shevchenko","playerOut":"Dmytro Horvat","minute":76}]'::jsonb
) ON CONFLICT (match_id) DO NOTHING;
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bol-sha-2024-09-17', 'card', 'bologna', 15, 'Lorenzo Romano', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bol-sha-2024-09-17', 'card', 'shakhtar-donetsk', 14, 'Ivan Szabo', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bol-sha-2024-09-17', 'card', 'bologna', 87, 'Francesco Colombo', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bol-sha-2024-09-17', 'card', 'shakhtar-donetsk', 47, 'Jan Petrovic', 'Tarjeta Amarilla');
INSERT INTO public.match_details (match_id, home_formation, away_formation, stats, home_substitutions, away_substitutions) VALUES (
  'cel-slo-2024-09-18', '4-3-3', '4-3-3',
  '{"xg":[5.2,1.4],"shots":[25,10],"shotsOnTarget":[6,3],"possession":[58,42],"passes":[551,399],"passAccuracy":[77,85],"fouls":[13,11],"yellowCards":[2,2],"redCards":[0,0],"offsides":[2,3],"corners":[3,4]}'::jsonb,
  '[{"playerIn":"Mason Cole","playerOut":"Thomas Green","minute":60},{"playerIn":"Liam Stone","playerOut":"Charlie Wright","minute":68},{"playerIn":"Edward Brooks","playerOut":"William Robinson","minute":76}]'::jsonb,
  '[{"playerIn":"David Szabo","playerOut":"Dušan Prochazka","minute":62},{"playerIn":"Filip Petrovic","playerOut":"Nikola Krajnc","minute":69},{"playerIn":"Luka Shevchenko","playerOut":"Dmytro Horvat","minute":76}]'::jsonb
) ON CONFLICT (match_id) DO NOTHING;
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('cel-slo-2024-09-18', 'goal', 'celtic', 10, 'Charlie Wright', 'Asist: Davies');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('cel-slo-2024-09-18', 'goal', 'celtic', 4, 'Thomas Green', 'Asist: Robinson');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('cel-slo-2024-09-18', 'goal', 'celtic', 34, 'James Evans', 'Asist: Wright');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('cel-slo-2024-09-18', 'goal', 'celtic', 69, 'Marcus Walker', 'Asist: Davies');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('cel-slo-2024-09-18', 'goal', 'celtic', 47, 'Charlie Wright', 'Asist: Robinson');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('cel-slo-2024-09-18', 'goal', 'slovan-bratislava', 64, 'Nikola Krajnc', 'Asist: Kozlov');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('cel-slo-2024-09-18', 'card', 'celtic', 37, 'Oliver Brown', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('cel-slo-2024-09-18', 'card', 'slovan-bratislava', 75, 'Ivan Szabo', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('cel-slo-2024-09-18', 'card', 'celtic', 89, 'George Williams', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('cel-slo-2024-09-18', 'card', 'slovan-bratislava', 36, 'Jan Petrovic', 'Tarjeta Amarilla');
INSERT INTO public.match_details (match_id, home_formation, away_formation, stats, home_substitutions, away_substitutions) VALUES (
  'bru-bvb-2024-09-18', '4-3-3', '4-3-3',
  '{"xg":[0.5,3.8],"shots":[11,17],"shotsOnTarget":[2,3],"possession":[51,49],"passes":[484,465],"passAccuracy":[80,75],"fouls":[14,15],"yellowCards":[2,2],"redCards":[0,0],"offsides":[1,0],"corners":[5,7]}'::jsonb,
  '[{"playerIn":"Mathieu Guerin","playerOut":"Pierre Dupont","minute":60},{"playerIn":"Julien Boyer","playerOut":"Maxime Mercier","minute":68},{"playerIn":"Théo Chevalier","playerOut":"Alexandre Lefevre","minute":76}]'::jsonb,
  '[{"playerIn":"Jan Zimmermann","playerOut":"Sebastian Richter","minute":62},{"playerIn":"Tobias Hartmann","playerOut":"David Bauer","minute":69},{"playerIn":"Niklas Krüger","playerOut":"Simon Koch","minute":76}]'::jsonb
) ON CONFLICT (match_id) DO NOTHING;
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bru-bvb-2024-09-18', 'goal', 'borussia-dortmund', 21, 'David Bauer', 'Asist: Schäfer');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bru-bvb-2024-09-18', 'goal', 'borussia-dortmund', 63, 'Sebastian Richter', 'Asist: Koch');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bru-bvb-2024-09-18', 'goal', 'borussia-dortmund', 41, 'Alexander Wolf', 'Asist: Bauer');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bru-bvb-2024-09-18', 'card', 'club-brugge', 68, 'Lucas Richard', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bru-bvb-2024-09-18', 'card', 'borussia-dortmund', 40, 'Thomas Weber', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bru-bvb-2024-09-18', 'card', 'club-brugge', 58, 'Arthur Robert', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bru-bvb-2024-09-18', 'card', 'borussia-dortmund', 50, 'Jonas Becker', 'Tarjeta Amarilla');
INSERT INTO public.match_details (match_id, home_formation, away_formation, stats, home_substitutions, away_substitutions) VALUES (
  'mci-int-2024-09-18', '4-3-3', '4-3-3',
  '{"xg":[0.4,0.1],"shots":[11,6],"shotsOnTarget":[1,2],"possession":[53,47],"passes":[503,446],"passAccuracy":[75,79],"fouls":[10,11],"yellowCards":[2,2],"redCards":[0,0],"offsides":[3,0],"corners":[5,2]}'::jsonb,
  '[{"playerIn":"Stefan Ortega","playerOut":"Kevin De Bruyne","minute":60},{"playerIn":"John Stones","playerOut":"Bernardo Silva","minute":68},{"playerIn":"Nathan Aké","playerOut":"Mateo Kovačić","minute":76}]'::jsonb,
  '[{"playerIn":"Josep Martínez","playerOut":"Federico Dimarco","minute":62},{"playerIn":"Stefan de Vrij","playerOut":"Henrikh Mkhitaryan","minute":69},{"playerIn":"Yann Bisseck","playerOut":"Hakan Çalhanoğlu","minute":76}]'::jsonb
) ON CONFLICT (match_id) DO NOTHING;
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('mci-int-2024-09-18', 'card', 'manchester-city', 79, 'Kyle Walker', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('mci-int-2024-09-18', 'card', 'inter-milan', 63, 'Benjamin Pavard', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('mci-int-2024-09-18', 'card', 'manchester-city', 73, 'Manuel Akanji', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('mci-int-2024-09-18', 'card', 'inter-milan', 31, 'Francesco Acerbi', 'Tarjeta Amarilla');
INSERT INTO public.match_details (match_id, home_formation, away_formation, stats, home_substitutions, away_substitutions) VALUES (
  'psg-gir-2024-09-18', '4-3-3', '4-3-3',
  '{"xg":[1.9,0.8],"shots":[15,8],"shotsOnTarget":[3,1],"possession":[42,58],"passes":[399,551],"passAccuracy":[78,89],"fouls":[13,15],"yellowCards":[2,2],"redCards":[0,0],"offsides":[0,0],"corners":[4,6]}'::jsonb,
  '[{"playerIn":"Matvey Safonov","playerOut":"Ousmane Dembélé","minute":60},{"playerIn":"Lucas Beraldo","playerOut":"João Neves","minute":68},{"playerIn":"Milan Škriniar","playerOut":"Warren Zaïre-Emery","minute":76}]'::jsonb,
  '[{"playerIn":"Daniel Ortiz","playerOut":"Javier Hernández","minute":62},{"playerIn":"Pablo Silva","playerOut":"Carlos González","minute":69},{"playerIn":"Rodrigo Medina","playerOut":"Álvaro Pérez","minute":76}]'::jsonb
) ON CONFLICT (match_id) DO NOTHING;
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('psg-gir-2024-09-18', 'goal', 'paris-saint-germain', 12, 'João Neves', 'Asist: Vitinha');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('psg-gir-2024-09-18', 'card', 'paris-saint-germain', 50, 'Achraf Hakimi', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('psg-gir-2024-09-18', 'card', 'girona', 51, 'Mateo López', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('psg-gir-2024-09-18', 'card', 'paris-saint-germain', 63, 'Marquinhos', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('psg-gir-2024-09-18', 'card', 'girona', 57, 'Santiago García', 'Tarjeta Amarilla');
INSERT INTO public.match_details (match_id, home_formation, away_formation, stats, home_substitutions, away_substitutions) VALUES (
  'fey-lev-2024-09-18', '4-3-3', '4-3-3',
  '{"xg":[0.8,4.1],"shots":[12,18],"shotsOnTarget":[1,4],"possession":[47,53],"passes":[446,503],"passAccuracy":[80,76],"fouls":[15,11],"yellowCards":[2,2],"redCards":[0,0],"offsides":[1,3],"corners":[4,2]}'::jsonb,
  '[{"playerIn":"Niek Bakker","playerOut":"Thijs Hendriks","minute":60},{"playerIn":"Bas de Groot","playerOut":"Stijn Dekker","minute":68},{"playerIn":"Joost Visser","playerOut":"Sem Bos","minute":76}]'::jsonb,
  '[{"playerIn":"Jan Zimmermann","playerOut":"Sebastian Richter","minute":62},{"playerIn":"Tobias Hartmann","playerOut":"David Bauer","minute":69},{"playerIn":"Niklas Krüger","playerOut":"Simon Koch","minute":76}]'::jsonb
) ON CONFLICT (match_id) DO NOTHING;
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('fey-lev-2024-09-18', 'goal', 'bayer-leverkusen', 61, 'David Bauer', 'Asist: Schäfer');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('fey-lev-2024-09-18', 'goal', 'bayer-leverkusen', 20, 'Sebastian Richter', 'Asist: Koch');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('fey-lev-2024-09-18', 'goal', 'bayer-leverkusen', 35, 'Alexander Wolf', 'Asist: Bauer');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('fey-lev-2024-09-18', 'goal', 'bayer-leverkusen', 55, 'Benjamin Neumann', 'Asist: Schäfer');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('fey-lev-2024-09-18', 'card', 'feyenoord', 17, 'Daan Bakker', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('fey-lev-2024-09-18', 'card', 'bayer-leverkusen', 83, 'Thomas Weber', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('fey-lev-2024-09-18', 'card', 'feyenoord', 20, 'Lars de Groot', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('fey-lev-2024-09-18', 'card', 'bayer-leverkusen', 76, 'Jonas Becker', 'Tarjeta Amarilla');
INSERT INTO public.match_details (match_id, home_formation, away_formation, stats, home_substitutions, away_substitutions) VALUES (
  'rsb-ben-2024-09-18', '4-3-3', '4-3-3',
  '{"xg":[1.2,2.7],"shots":[13,14],"shotsOnTarget":[3,4],"possession":[44,56],"passes":[418,532],"passAccuracy":[88,77],"fouls":[11,10],"yellowCards":[2,2],"redCards":[0,0],"offsides":[2,3],"corners":[4,7]}'::jsonb,
  '[{"playerIn":"David Szabo","playerOut":"Dušan Prochazka","minute":60},{"playerIn":"Filip Petrovic","playerOut":"Nikola Krajnc","minute":68},{"playerIn":"Luka Shevchenko","playerOut":"Dmytro Horvat","minute":76}]'::jsonb,
  '[{"playerIn":"Filipe Pereira","playerOut":"Gonçalo Sousa","minute":62},{"playerIn":"João Oliveira","playerOut":"Afonso Cardoso","minute":69},{"playerIn":"Nuno Costa","playerOut":"Miguel Nascimento","minute":76}]'::jsonb
) ON CONFLICT (match_id) DO NOTHING;
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('rsb-ben-2024-09-18', 'goal', 'red-star-belgrade', 5, 'Nikola Krajnc', 'Asist: Kozlov');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('rsb-ben-2024-09-18', 'goal', 'benfica', 25, 'Afonso Cardoso', 'Asist: Almeida');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('rsb-ben-2024-09-18', 'goal', 'benfica', 71, 'Gonçalo Sousa', 'Asist: Nascimento');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('rsb-ben-2024-09-18', 'card', 'red-star-belgrade', 66, 'Ivan Szabo', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('rsb-ben-2024-09-18', 'card', 'benfica', 83, 'Nuno Pereira', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('rsb-ben-2024-09-18', 'card', 'red-star-belgrade', 53, 'Jan Petrovic', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('rsb-ben-2024-09-18', 'card', 'benfica', 47, 'Rui Oliveira', 'Tarjeta Amarilla');
INSERT INTO public.match_details (match_id, home_formation, away_formation, stats, home_substitutions, away_substitutions) VALUES (
  'mon-bar-2024-09-18', '4-3-3', '4-3-3',
  '{"xg":[2.2,1.1],"shots":[16,9],"shotsOnTarget":[3,2],"possession":[47,53],"passes":[446,503],"passAccuracy":[85,77],"fouls":[13,15],"yellowCards":[2,2],"redCards":[0,0],"offsides":[0,2],"corners":[7,6]}'::jsonb,
  '[{"playerIn":"Mathieu Guerin","playerOut":"Pierre Dupont","minute":60},{"playerIn":"Julien Boyer","playerOut":"Maxime Mercier","minute":68},{"playerIn":"Théo Chevalier","playerOut":"Alexandre Lefevre","minute":76}]'::jsonb,
  '[{"playerIn":"Iñaki Peña","playerOut":"Lamine Yamal","minute":62},{"playerIn":"Héctor Fort","playerOut":"Dani Olmo","minute":69},{"playerIn":"Sergi Domínguez","playerOut":"Pedri González","minute":76}]'::jsonb
) ON CONFLICT (match_id) DO NOTHING;
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('mon-bar-2024-09-18', 'goal', 'monaco', 78, 'Maxime Mercier', 'Asist: Laurent');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('mon-bar-2024-09-18', 'goal', 'monaco', 65, 'Pierre Dupont', 'Asist: Lefevre');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('mon-bar-2024-09-18', 'goal', 'barcelona', 39, 'Dani Olmo', 'Asist: Casadó');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('mon-bar-2024-09-18', 'card', 'monaco', 78, 'Lucas Richard', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('mon-bar-2024-09-18', 'card', 'barcelona', 48, 'Jules Koundé', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('mon-bar-2024-09-18', 'card', 'monaco', 29, 'Arthur Robert', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('mon-bar-2024-09-18', 'card', 'barcelona', 89, 'Pau Cubarsí', 'Tarjeta Amarilla');
INSERT INTO public.match_details (match_id, home_formation, away_formation, stats, home_substitutions, away_substitutions) VALUES (
  'ata-ars-2024-09-18', '4-3-3', '4-3-3',
  '{"xg":[0.8,0.6],"shots":[12,7],"shotsOnTarget":[1,2],"possession":[53,47],"passes":[503,446],"passAccuracy":[77,85],"fouls":[14,11],"yellowCards":[2,2],"redCards":[0,0],"offsides":[3,3],"corners":[8,2]}'::jsonb,
  '[{"playerIn":"Giovanni Morelli","playerOut":"Riccardo Conti","minute":60},{"playerIn":"Matteo Gatti","playerOut":"Davide Galli","minute":68},{"playerIn":"Luca Basso","playerOut":"Gabriele Mazza","minute":76}]'::jsonb,
  '[{"playerIn":"Neto","playerOut":"Bukayo Saka","minute":62},{"playerIn":"Jakub Kiwior","playerOut":"Martin Ødegaard","minute":69},{"playerIn":"Oleksandr Zinchenko","playerOut":"Declan Rice","minute":76}]'::jsonb
) ON CONFLICT (match_id) DO NOTHING;
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('ata-ars-2024-09-18', 'card', 'atalanta', 44, 'Lorenzo Romano', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('ata-ars-2024-09-18', 'card', 'arsenal', 85, 'Ben White', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('ata-ars-2024-09-18', 'card', 'atalanta', 39, 'Francesco Colombo', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('ata-ars-2024-09-18', 'card', 'arsenal', 50, 'William Saliba', 'Tarjeta Amarilla');
INSERT INTO public.match_details (match_id, home_formation, away_formation, stats, home_substitutions, away_substitutions) VALUES (
  'atm-rbl-2024-09-18', '4-3-3', '4-3-3',
  '{"xg":[2.6,1.5],"shots":[17,10],"shotsOnTarget":[4,1],"possession":[42,58],"passes":[399,551],"passAccuracy":[86,77],"fouls":[15,11],"yellowCards":[2,2],"redCards":[0,0],"offsides":[3,2],"corners":[6,4]}'::jsonb,
  '[{"playerIn":"Juan Musso","playerOut":"Antoine Griezmann","minute":60},{"playerIn":"Axel Witsel","playerOut":"Conor Gallagher","minute":68},{"playerIn":"Clement Lenglet","playerOut":"Koke Resurrección","minute":76}]'::jsonb,
  '[{"playerIn":"Jan Zimmermann","playerOut":"Sebastian Richter","minute":62},{"playerIn":"Tobias Hartmann","playerOut":"David Bauer","minute":69},{"playerIn":"Niklas Krüger","playerOut":"Simon Koch","minute":76}]'::jsonb
) ON CONFLICT (match_id) DO NOTHING;
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('atm-rbl-2024-09-18', 'goal', 'atletico-madrid', 67, 'Conor Gallagher', 'Asist: Paul');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('atm-rbl-2024-09-18', 'goal', 'atletico-madrid', 19, 'Antoine Griezmann', 'Asist: Resurrección');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('atm-rbl-2024-09-18', 'goal', 'rb-leipzig', 62, 'David Bauer', 'Asist: Schäfer');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('atm-rbl-2024-09-18', 'card', 'atletico-madrid', 42, 'Nahuel Molina', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('atm-rbl-2024-09-18', 'card', 'rb-leipzig', 18, 'Thomas Weber', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('atm-rbl-2024-09-18', 'card', 'atletico-madrid', 65, 'Robin Le Normand', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('atm-rbl-2024-09-18', 'card', 'rb-leipzig', 65, 'Jonas Becker', 'Tarjeta Amarilla');
INSERT INTO public.match_details (match_id, home_formation, away_formation, stats, home_substitutions, away_substitutions) VALUES (
  'bre-stg-2024-09-18', '4-3-3', '4-3-3',
  '{"xg":[2.6,1.8],"shots":[17,11],"shotsOnTarget":[6,3],"possession":[60,40],"passes":[570,380],"passAccuracy":[84,85],"fouls":[10,13],"yellowCards":[2,2],"redCards":[0,0],"offsides":[3,3],"corners":[3,4]}'::jsonb,
  '[{"playerIn":"Mathieu Guerin","playerOut":"Pierre Dupont","minute":60},{"playerIn":"Julien Boyer","playerOut":"Maxime Mercier","minute":68},{"playerIn":"Théo Chevalier","playerOut":"Alexandre Lefevre","minute":76}]'::jsonb,
  '[{"playerIn":"Jan Zimmermann","playerOut":"Sebastian Richter","minute":62},{"playerIn":"Tobias Hartmann","playerOut":"David Bauer","minute":69},{"playerIn":"Niklas Krüger","playerOut":"Simon Koch","minute":76}]'::jsonb
) ON CONFLICT (match_id) DO NOTHING;
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bre-stg-2024-09-18', 'goal', 'brest', 87, 'Maxime Mercier', 'Asist: Laurent');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bre-stg-2024-09-18', 'goal', 'brest', 42, 'Pierre Dupont', 'Asist: Lefevre');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bre-stg-2024-09-18', 'goal', 'sturm-graz', 42, 'David Bauer', 'Asist: Schäfer');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bre-stg-2024-09-18', 'card', 'brest', 5, 'Lucas Richard', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bre-stg-2024-09-18', 'card', 'sturm-graz', 44, 'Thomas Weber', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bre-stg-2024-09-18', 'card', 'brest', 68, 'Arthur Robert', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bre-stg-2024-09-18', 'card', 'sturm-graz', 9, 'Jonas Becker', 'Tarjeta Amarilla');
INSERT INTO public.match_details (match_id, home_formation, away_formation, stats, home_substitutions, away_substitutions) VALUES (
  'liv-psg-2025-03-04', '4-3-3', '4-3-3',
  '{"xg":[1,0.8],"shots":[13,8],"shotsOnTarget":[3,2],"possession":[49,51],"passes":[465,484],"passAccuracy":[86,79],"fouls":[12,11],"yellowCards":[2,2],"redCards":[0,0],"offsides":[2,3],"corners":[8,7]}'::jsonb,
  '[{"playerIn":"Caoimhin Kelleher","playerOut":"Mohamed Salah","minute":60},{"playerIn":"Joe Gomez","playerOut":"Dominik Szoboszlai","minute":68},{"playerIn":"Jarell Quansah","playerOut":"Alexis Mac Allister","minute":76}]'::jsonb,
  '[{"playerIn":"Matvey Safonov","playerOut":"Ousmane Dembélé","minute":62},{"playerIn":"Lucas Beraldo","playerOut":"João Neves","minute":69},{"playerIn":"Milan Škriniar","playerOut":"Warren Zaïre-Emery","minute":76}]'::jsonb
) ON CONFLICT (match_id) DO NOTHING;
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('liv-psg-2025-03-04', 'goal', 'liverpool', 59, 'Dominik Szoboszlai', 'Asist: Gravenberch');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('liv-psg-2025-03-04', 'card', 'liverpool', 24, 'Trent Alexander-Arnold', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('liv-psg-2025-03-04', 'card', 'paris-saint-germain', 45, 'Achraf Hakimi', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('liv-psg-2025-03-04', 'card', 'liverpool', 10, 'Ibrahima Konaté', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('liv-psg-2025-03-04', 'card', 'paris-saint-germain', 63, 'Marquinhos', 'Tarjeta Amarilla');
INSERT INTO public.match_details (match_id, home_formation, away_formation, stats, home_substitutions, away_substitutions) VALUES (
  'psg-liv-2025-03-12', '4-3-3', '4-3-3',
  '{"xg":[1.4,0],"shots":[14,6],"shotsOnTarget":[4,2],"possession":[51,49],"passes":[484,465],"passAccuracy":[88,76],"fouls":[15,14],"yellowCards":[2,2],"redCards":[0,0],"offsides":[2,3],"corners":[6,7]}'::jsonb,
  '[{"playerIn":"Matvey Safonov","playerOut":"Ousmane Dembélé","minute":60},{"playerIn":"Lucas Beraldo","playerOut":"João Neves","minute":68},{"playerIn":"Milan Škriniar","playerOut":"Warren Zaïre-Emery","minute":76}]'::jsonb,
  '[{"playerIn":"Caoimhin Kelleher","playerOut":"Mohamed Salah","minute":62},{"playerIn":"Joe Gomez","playerOut":"Dominik Szoboszlai","minute":69},{"playerIn":"Jarell Quansah","playerOut":"Alexis Mac Allister","minute":76}]'::jsonb
) ON CONFLICT (match_id) DO NOTHING;
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('psg-liv-2025-03-12', 'goal', 'paris-saint-germain', 15, 'João Neves', 'Asist: Vitinha');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('psg-liv-2025-03-12', 'card', 'paris-saint-germain', 19, 'Achraf Hakimi', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('psg-liv-2025-03-12', 'card', 'liverpool', 15, 'Trent Alexander-Arnold', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('psg-liv-2025-03-12', 'card', 'paris-saint-germain', 57, 'Marquinhos', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('psg-liv-2025-03-12', 'card', 'liverpool', 61, 'Ibrahima Konaté', 'Tarjeta Amarilla');
INSERT INTO public.match_details (match_id, home_formation, away_formation, stats, home_substitutions, away_substitutions) VALUES (
  'ben-bar-2025-03-05', '4-3-3', '4-3-3',
  '{"xg":[0.7,3.4],"shots":[12,16],"shotsOnTarget":[1,3],"possession":[40,60],"passes":[380,570],"passAccuracy":[78,86],"fouls":[12,15],"yellowCards":[2,2],"redCards":[0,0],"offsides":[1,0],"corners":[8,5]}'::jsonb,
  '[{"playerIn":"Filipe Pereira","playerOut":"Gonçalo Sousa","minute":60},{"playerIn":"João Oliveira","playerOut":"Afonso Cardoso","minute":68},{"playerIn":"Nuno Costa","playerOut":"Miguel Nascimento","minute":76}]'::jsonb,
  '[{"playerIn":"Iñaki Peña","playerOut":"Lamine Yamal","minute":62},{"playerIn":"Héctor Fort","playerOut":"Dani Olmo","minute":69},{"playerIn":"Sergi Domínguez","playerOut":"Pedri González","minute":76}]'::jsonb
) ON CONFLICT (match_id) DO NOTHING;
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('ben-bar-2025-03-05', 'goal', 'barcelona', 23, 'Dani Olmo', 'Asist: Casadó');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('ben-bar-2025-03-05', 'goal', 'barcelona', 44, 'Lamine Yamal', 'Asist: González');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('ben-bar-2025-03-05', 'goal', 'barcelona', 14, 'Robert Lewandowski', 'Asist: Olmo');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('ben-bar-2025-03-05', 'card', 'benfica', 59, 'Nuno Pereira', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('ben-bar-2025-03-05', 'card', 'barcelona', 54, 'Jules Koundé', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('ben-bar-2025-03-05', 'card', 'benfica', 17, 'Rui Oliveira', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('ben-bar-2025-03-05', 'card', 'barcelona', 83, 'Pau Cubarsí', 'Tarjeta Amarilla');
INSERT INTO public.match_details (match_id, home_formation, away_formation, stats, home_substitutions, away_substitutions) VALUES (
  'bar-ben-2025-03-13', '4-3-3', '4-3-3',
  '{"xg":[2.3,0.3],"shots":[16,6],"shotsOnTarget":[3,1],"possession":[46,54],"passes":[437,513],"passAccuracy":[79,84],"fouls":[11,11],"yellowCards":[2,2],"redCards":[0,0],"offsides":[3,0],"corners":[7,5]}'::jsonb,
  '[{"playerIn":"Iñaki Peña","playerOut":"Lamine Yamal","minute":60},{"playerIn":"Héctor Fort","playerOut":"Dani Olmo","minute":68},{"playerIn":"Sergi Domínguez","playerOut":"Pedri González","minute":76}]'::jsonb,
  '[{"playerIn":"Filipe Pereira","playerOut":"Gonçalo Sousa","minute":62},{"playerIn":"João Oliveira","playerOut":"Afonso Cardoso","minute":69},{"playerIn":"Nuno Costa","playerOut":"Miguel Nascimento","minute":76}]'::jsonb
) ON CONFLICT (match_id) DO NOTHING;
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bar-ben-2025-03-13', 'goal', 'barcelona', 52, 'Dani Olmo', 'Asist: Casadó');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bar-ben-2025-03-13', 'goal', 'barcelona', 5, 'Lamine Yamal', 'Asist: González');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bar-ben-2025-03-13', 'card', 'barcelona', 24, 'Jules Koundé', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bar-ben-2025-03-13', 'card', 'benfica', 14, 'Nuno Pereira', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bar-ben-2025-03-13', 'card', 'barcelona', 24, 'Pau Cubarsí', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bar-ben-2025-03-13', 'card', 'benfica', 32, 'Rui Oliveira', 'Tarjeta Amarilla');
INSERT INTO public.match_details (match_id, home_formation, away_formation, stats, home_substitutions, away_substitutions) VALUES (
  'psv-ars-2025-03-04', '4-3-3', '4-3-3',
  '{"xg":[1.7,4.6],"shots":[15,19],"shotsOnTarget":[4,4],"possession":[58,42],"passes":[551,399],"passAccuracy":[88,80],"fouls":[11,15],"yellowCards":[2,2],"redCards":[0,0],"offsides":[1,2],"corners":[3,6]}'::jsonb,
  '[{"playerIn":"Niek Bakker","playerOut":"Thijs Hendriks","minute":60},{"playerIn":"Bas de Groot","playerOut":"Stijn Dekker","minute":68},{"playerIn":"Joost Visser","playerOut":"Sem Bos","minute":76}]'::jsonb,
  '[{"playerIn":"Neto","playerOut":"Bukayo Saka","minute":62},{"playerIn":"Jakub Kiwior","playerOut":"Martin Ødegaard","minute":69},{"playerIn":"Oleksandr Zinchenko","playerOut":"Declan Rice","minute":76}]'::jsonb
) ON CONFLICT (match_id) DO NOTHING;
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('psv-ars-2025-03-04', 'goal', 'psv-eindhoven', 75, 'Stijn Dekker', 'Asist: Vos');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('psv-ars-2025-03-04', 'goal', 'arsenal', 42, 'Martin Ødegaard', 'Asist: Partey');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('psv-ars-2025-03-04', 'goal', 'arsenal', 85, 'Bukayo Saka', 'Asist: Rice');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('psv-ars-2025-03-04', 'goal', 'arsenal', 56, 'Kai Havertz', 'Asist: Ødegaard');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('psv-ars-2025-03-04', 'goal', 'arsenal', 85, 'Gabriel Martinelli', 'Asist: Partey');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('psv-ars-2025-03-04', 'card', 'psv-eindhoven', 89, 'Daan Bakker', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('psv-ars-2025-03-04', 'card', 'arsenal', 74, 'Ben White', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('psv-ars-2025-03-04', 'card', 'psv-eindhoven', 84, 'Lars de Groot', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('psv-ars-2025-03-04', 'card', 'arsenal', 72, 'William Saliba', 'Tarjeta Amarilla');
INSERT INTO public.match_details (match_id, home_formation, away_formation, stats, home_substitutions, away_substitutions) VALUES (
  'ars-psv-2025-03-12', '4-3-3', '4-3-3',
  '{"xg":[5.5,2.9],"shots":[26,14],"shotsOnTarget":[6,4],"possession":[51,49],"passes":[484,465],"passAccuracy":[84,80],"fouls":[11,13],"yellowCards":[2,2],"redCards":[0,0],"offsides":[3,1],"corners":[8,7]}'::jsonb,
  '[{"playerIn":"Neto","playerOut":"Bukayo Saka","minute":60},{"playerIn":"Jakub Kiwior","playerOut":"Martin Ødegaard","minute":68},{"playerIn":"Oleksandr Zinchenko","playerOut":"Declan Rice","minute":76}]'::jsonb,
  '[{"playerIn":"Niek Bakker","playerOut":"Thijs Hendriks","minute":62},{"playerIn":"Bas de Groot","playerOut":"Stijn Dekker","minute":69},{"playerIn":"Joost Visser","playerOut":"Sem Bos","minute":76}]'::jsonb
) ON CONFLICT (match_id) DO NOTHING;
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('ars-psv-2025-03-12', 'goal', 'arsenal', 81, 'Martin Ødegaard', 'Asist: Partey');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('ars-psv-2025-03-12', 'goal', 'arsenal', 61, 'Bukayo Saka', 'Asist: Rice');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('ars-psv-2025-03-12', 'goal', 'arsenal', 43, 'Kai Havertz', 'Asist: Ødegaard');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('ars-psv-2025-03-12', 'goal', 'arsenal', 49, 'Gabriel Martinelli', 'Asist: Partey');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('ars-psv-2025-03-12', 'goal', 'arsenal', 44, 'Martin Ødegaard', 'Asist: Rice');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('ars-psv-2025-03-12', 'goal', 'psv-eindhoven', 80, 'Stijn Dekker', 'Asist: Vos');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('ars-psv-2025-03-12', 'goal', 'psv-eindhoven', 36, 'Thijs Hendriks', 'Asist: Bos');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('ars-psv-2025-03-12', 'card', 'arsenal', 40, 'Ben White', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('ars-psv-2025-03-12', 'card', 'psv-eindhoven', 74, 'Daan Bakker', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('ars-psv-2025-03-12', 'card', 'arsenal', 20, 'William Saliba', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('ars-psv-2025-03-12', 'card', 'psv-eindhoven', 19, 'Lars de Groot', 'Tarjeta Amarilla');
INSERT INTO public.match_details (match_id, home_formation, away_formation, stats, home_substitutions, away_substitutions) VALUES (
  'fey-int-2025-03-05', '4-3-3', '4-3-3',
  '{"xg":[0.6,2.6],"shots":[11,13],"shotsOnTarget":[4,3],"possession":[43,57],"passes":[408,541],"passAccuracy":[88,78],"fouls":[11,14],"yellowCards":[2,2],"redCards":[0,0],"offsides":[1,0],"corners":[5,4]}'::jsonb,
  '[{"playerIn":"Niek Bakker","playerOut":"Thijs Hendriks","minute":60},{"playerIn":"Bas de Groot","playerOut":"Stijn Dekker","minute":68},{"playerIn":"Joost Visser","playerOut":"Sem Bos","minute":76}]'::jsonb,
  '[{"playerIn":"Josep Martínez","playerOut":"Federico Dimarco","minute":62},{"playerIn":"Stefan de Vrij","playerOut":"Henrikh Mkhitaryan","minute":69},{"playerIn":"Yann Bisseck","playerOut":"Hakan Çalhanoğlu","minute":76}]'::jsonb
) ON CONFLICT (match_id) DO NOTHING;
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('fey-int-2025-03-05', 'goal', 'inter-milan', 14, 'Henrikh Mkhitaryan', 'Asist: Barella');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('fey-int-2025-03-05', 'goal', 'inter-milan', 19, 'Federico Dimarco', 'Asist: Çalhanoğlu');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('fey-int-2025-03-05', 'card', 'feyenoord', 48, 'Daan Bakker', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('fey-int-2025-03-05', 'card', 'inter-milan', 37, 'Benjamin Pavard', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('fey-int-2025-03-05', 'card', 'feyenoord', 58, 'Lars de Groot', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('fey-int-2025-03-05', 'card', 'inter-milan', 67, 'Francesco Acerbi', 'Tarjeta Amarilla');
INSERT INTO public.match_details (match_id, home_formation, away_formation, stats, home_substitutions, away_substitutions) VALUES (
  'int-fey-2025-03-13', '4-3-3', '4-3-3',
  '{"xg":[2.6,1.4],"shots":[17,10],"shotsOnTarget":[6,2],"possession":[47,53],"passes":[446,503],"passAccuracy":[78,89],"fouls":[11,15],"yellowCards":[2,2],"redCards":[0,0],"offsides":[3,0],"corners":[7,7]}'::jsonb,
  '[{"playerIn":"Josep Martínez","playerOut":"Federico Dimarco","minute":60},{"playerIn":"Stefan de Vrij","playerOut":"Henrikh Mkhitaryan","minute":68},{"playerIn":"Yann Bisseck","playerOut":"Hakan Çalhanoğlu","minute":76}]'::jsonb,
  '[{"playerIn":"Niek Bakker","playerOut":"Thijs Hendriks","minute":62},{"playerIn":"Bas de Groot","playerOut":"Stijn Dekker","minute":69},{"playerIn":"Joost Visser","playerOut":"Sem Bos","minute":76}]'::jsonb
) ON CONFLICT (match_id) DO NOTHING;
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('int-fey-2025-03-13', 'goal', 'inter-milan', 20, 'Henrikh Mkhitaryan', 'Asist: Barella');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('int-fey-2025-03-13', 'goal', 'inter-milan', 81, 'Federico Dimarco', 'Asist: Çalhanoğlu');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('int-fey-2025-03-13', 'goal', 'feyenoord', 70, 'Stijn Dekker', 'Asist: Vos');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('int-fey-2025-03-13', 'card', 'inter-milan', 14, 'Benjamin Pavard', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('int-fey-2025-03-13', 'card', 'feyenoord', 72, 'Daan Bakker', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('int-fey-2025-03-13', 'card', 'inter-milan', 61, 'Francesco Acerbi', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('int-fey-2025-03-13', 'card', 'feyenoord', 83, 'Lars de Groot', 'Tarjeta Amarilla');
INSERT INTO public.match_details (match_id, home_formation, away_formation, stats, home_substitutions, away_substitutions) VALUES (
  'atm-rma-2025-03-04', '4-3-3', '4-3-3',
  '{"xg":[1.6,0.3],"shots":[14,6],"shotsOnTarget":[5,2],"possession":[48,52],"passes":[456,494],"passAccuracy":[80,83],"fouls":[10,10],"yellowCards":[2,2],"redCards":[0,0],"offsides":[2,2],"corners":[5,7]}'::jsonb,
  '[{"playerIn":"Juan Musso","playerOut":"Antoine Griezmann","minute":60},{"playerIn":"Axel Witsel","playerOut":"Conor Gallagher","minute":68},{"playerIn":"Clement Lenglet","playerOut":"Koke Resurrección","minute":76}]'::jsonb,
  '[{"playerIn":"Andriy Lunin","playerOut":"Rodrygo Goes","minute":62},{"playerIn":"Lucas Vázquez","playerOut":"Jude Bellingham","minute":69},{"playerIn":"Fran García","playerOut":"Aurélien Tchouaméni","minute":76}]'::jsonb
) ON CONFLICT (match_id) DO NOTHING;
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('atm-rma-2025-03-04', 'goal', 'atletico-madrid', 89, 'Conor Gallagher', 'Asist: Paul');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('atm-rma-2025-03-04', 'card', 'atletico-madrid', 16, 'Nahuel Molina', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('atm-rma-2025-03-04', 'card', 'real-madrid', 70, 'Dani Carvajal', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('atm-rma-2025-03-04', 'card', 'atletico-madrid', 43, 'Robin Le Normand', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('atm-rma-2025-03-04', 'card', 'real-madrid', 58, 'Éder Militão', 'Tarjeta Amarilla');
INSERT INTO public.match_details (match_id, home_formation, away_formation, stats, home_substitutions, away_substitutions) VALUES (
  'rma-atm-2025-03-12', '4-3-3', '4-3-3',
  '{"xg":[1.1,0.9],"shots":[13,8],"shotsOnTarget":[3,2],"possession":[54,46],"passes":[513,437],"passAccuracy":[75,89],"fouls":[12,15],"yellowCards":[2,2],"redCards":[0,0],"offsides":[3,1],"corners":[8,6]}'::jsonb,
  '[{"playerIn":"Andriy Lunin","playerOut":"Rodrygo Goes","minute":60},{"playerIn":"Lucas Vázquez","playerOut":"Jude Bellingham","minute":68},{"playerIn":"Fran García","playerOut":"Aurélien Tchouaméni","minute":76}]'::jsonb,
  '[{"playerIn":"Juan Musso","playerOut":"Antoine Griezmann","minute":62},{"playerIn":"Axel Witsel","playerOut":"Conor Gallagher","minute":69},{"playerIn":"Clement Lenglet","playerOut":"Koke Resurrección","minute":76}]'::jsonb
) ON CONFLICT (match_id) DO NOTHING;
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('rma-atm-2025-03-12', 'goal', 'real-madrid', 68, 'Jude Bellingham', 'Asist: Valverde');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('rma-atm-2025-03-12', 'card', 'real-madrid', 69, 'Dani Carvajal', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('rma-atm-2025-03-12', 'card', 'atletico-madrid', 28, 'Nahuel Molina', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('rma-atm-2025-03-12', 'card', 'real-madrid', 80, 'Éder Militão', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('rma-atm-2025-03-12', 'card', 'atletico-madrid', 86, 'Robin Le Normand', 'Tarjeta Amarilla');
INSERT INTO public.match_details (match_id, home_formation, away_formation, stats, home_substitutions, away_substitutions) VALUES (
  'lev-bay-2025-03-05', '4-3-3', '4-3-3',
  '{"xg":[0.1,3.5],"shots":[10,16],"shotsOnTarget":[2,4],"possession":[60,40],"passes":[570,380],"passAccuracy":[87,89],"fouls":[10,10],"yellowCards":[2,2],"redCards":[0,0],"offsides":[2,0],"corners":[5,7]}'::jsonb,
  '[{"playerIn":"Jan Zimmermann","playerOut":"Sebastian Richter","minute":60},{"playerIn":"Tobias Hartmann","playerOut":"David Bauer","minute":68},{"playerIn":"Niklas Krüger","playerOut":"Simon Koch","minute":76}]'::jsonb,
  '[{"playerIn":"Sven Ulreich","playerOut":"Jamal Musiala","minute":62},{"playerIn":"Eric Dier","playerOut":"Michael Olise","minute":69},{"playerIn":"Raphaël Guerreiro","playerOut":"João Palhinha","minute":76}]'::jsonb
) ON CONFLICT (match_id) DO NOTHING;
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('lev-bay-2025-03-05', 'goal', 'bayern-munich', 48, 'Michael Olise', 'Asist: Pavlović');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('lev-bay-2025-03-05', 'goal', 'bayern-munich', 64, 'Jamal Musiala', 'Asist: Palhinha');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('lev-bay-2025-03-05', 'goal', 'bayern-munich', 5, 'Serge Gnabry', 'Asist: Olise');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('lev-bay-2025-03-05', 'card', 'bayer-leverkusen', 40, 'Thomas Weber', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('lev-bay-2025-03-05', 'card', 'bayern-munich', 34, 'Joshua Kimmich', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('lev-bay-2025-03-05', 'card', 'bayer-leverkusen', 29, 'Jonas Becker', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('lev-bay-2025-03-05', 'card', 'bayern-munich', 22, 'Dayot Upamecano', 'Tarjeta Amarilla');
INSERT INTO public.match_details (match_id, home_formation, away_formation, stats, home_substitutions, away_substitutions) VALUES (
  'bay-lev-2025-03-13', '4-3-3', '4-3-3',
  '{"xg":[2.7,0.8],"shots":[18,8],"shotsOnTarget":[3,2],"possession":[46,54],"passes":[437,513],"passAccuracy":[76,89],"fouls":[14,13],"yellowCards":[2,2],"redCards":[0,0],"offsides":[2,2],"corners":[6,4]}'::jsonb,
  '[{"playerIn":"Sven Ulreich","playerOut":"Jamal Musiala","minute":60},{"playerIn":"Eric Dier","playerOut":"Michael Olise","minute":68},{"playerIn":"Raphaël Guerreiro","playerOut":"João Palhinha","minute":76}]'::jsonb,
  '[{"playerIn":"Jan Zimmermann","playerOut":"Sebastian Richter","minute":62},{"playerIn":"Tobias Hartmann","playerOut":"David Bauer","minute":69},{"playerIn":"Niklas Krüger","playerOut":"Simon Koch","minute":76}]'::jsonb
) ON CONFLICT (match_id) DO NOTHING;
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bay-lev-2025-03-13', 'goal', 'bayern-munich', 78, 'Michael Olise', 'Asist: Pavlović');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bay-lev-2025-03-13', 'goal', 'bayern-munich', 32, 'Jamal Musiala', 'Asist: Palhinha');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bay-lev-2025-03-13', 'card', 'bayern-munich', 54, 'Joshua Kimmich', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bay-lev-2025-03-13', 'card', 'bayer-leverkusen', 32, 'Thomas Weber', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bay-lev-2025-03-13', 'card', 'bayern-munich', 65, 'Dayot Upamecano', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bay-lev-2025-03-13', 'card', 'bayer-leverkusen', 29, 'Jonas Becker', 'Tarjeta Amarilla');
INSERT INTO public.match_details (match_id, home_formation, away_formation, stats, home_substitutions, away_substitutions) VALUES (
  'lil-bvb-2025-03-04', '4-3-3', '4-3-3',
  '{"xg":[1.3,2.8],"shots":[13,14],"shotsOnTarget":[4,4],"possession":[53,47],"passes":[503,446],"passAccuracy":[82,87],"fouls":[12,14],"yellowCards":[2,2],"redCards":[0,0],"offsides":[1,2],"corners":[4,5]}'::jsonb,
  '[{"playerIn":"Mathieu Guerin","playerOut":"Pierre Dupont","minute":60},{"playerIn":"Julien Boyer","playerOut":"Maxime Mercier","minute":68},{"playerIn":"Théo Chevalier","playerOut":"Alexandre Lefevre","minute":76}]'::jsonb,
  '[{"playerIn":"Jan Zimmermann","playerOut":"Sebastian Richter","minute":62},{"playerIn":"Tobias Hartmann","playerOut":"David Bauer","minute":69},{"playerIn":"Niklas Krüger","playerOut":"Simon Koch","minute":76}]'::jsonb
) ON CONFLICT (match_id) DO NOTHING;
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('lil-bvb-2025-03-04', 'goal', 'lille', 83, 'Maxime Mercier', 'Asist: Laurent');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('lil-bvb-2025-03-04', 'goal', 'borussia-dortmund', 72, 'David Bauer', 'Asist: Schäfer');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('lil-bvb-2025-03-04', 'goal', 'borussia-dortmund', 62, 'Sebastian Richter', 'Asist: Koch');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('lil-bvb-2025-03-04', 'card', 'lille', 76, 'Lucas Richard', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('lil-bvb-2025-03-04', 'card', 'borussia-dortmund', 41, 'Thomas Weber', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('lil-bvb-2025-03-04', 'card', 'lille', 82, 'Arthur Robert', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('lil-bvb-2025-03-04', 'card', 'borussia-dortmund', 43, 'Jonas Becker', 'Tarjeta Amarilla');
INSERT INTO public.match_details (match_id, home_formation, away_formation, stats, home_substitutions, away_substitutions) VALUES (
  'bvb-lil-2025-03-12', '4-3-3', '4-3-3',
  '{"xg":[1,1.3],"shots":[13,9],"shotsOnTarget":[3,3],"possession":[45,55],"passes":[427,522],"passAccuracy":[88,77],"fouls":[12,13],"yellowCards":[2,2],"redCards":[0,0],"offsides":[0,1],"corners":[7,5]}'::jsonb,
  '[{"playerIn":"Jan Zimmermann","playerOut":"Sebastian Richter","minute":60},{"playerIn":"Tobias Hartmann","playerOut":"David Bauer","minute":68},{"playerIn":"Niklas Krüger","playerOut":"Simon Koch","minute":76}]'::jsonb,
  '[{"playerIn":"Mathieu Guerin","playerOut":"Pierre Dupont","minute":62},{"playerIn":"Julien Boyer","playerOut":"Maxime Mercier","minute":69},{"playerIn":"Théo Chevalier","playerOut":"Alexandre Lefevre","minute":76}]'::jsonb
) ON CONFLICT (match_id) DO NOTHING;
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bvb-lil-2025-03-12', 'goal', 'borussia-dortmund', 18, 'David Bauer', 'Asist: Schäfer');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bvb-lil-2025-03-12', 'goal', 'lille', 5, 'Maxime Mercier', 'Asist: Laurent');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bvb-lil-2025-03-12', 'card', 'borussia-dortmund', 82, 'Thomas Weber', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bvb-lil-2025-03-12', 'card', 'lille', 10, 'Lucas Richard', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bvb-lil-2025-03-12', 'card', 'borussia-dortmund', 31, 'Jonas Becker', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bvb-lil-2025-03-12', 'card', 'lille', 68, 'Arthur Robert', 'Tarjeta Amarilla');
INSERT INTO public.match_details (match_id, home_formation, away_formation, stats, home_substitutions, away_substitutions) VALUES (
  'bru-avl-2025-03-05', '4-3-3', '4-3-3',
  '{"xg":[0.4,3.1],"shots":[11,15],"shotsOnTarget":[1,5],"possession":[45,55],"passes":[427,522],"passAccuracy":[88,75],"fouls":[12,15],"yellowCards":[2,2],"redCards":[0,0],"offsides":[0,1],"corners":[7,4]}'::jsonb,
  '[{"playerIn":"Mathieu Guerin","playerOut":"Pierre Dupont","minute":60},{"playerIn":"Julien Boyer","playerOut":"Maxime Mercier","minute":68},{"playerIn":"Théo Chevalier","playerOut":"Alexandre Lefevre","minute":76}]'::jsonb,
  '[{"playerIn":"Mason Cole","playerOut":"Thomas Green","minute":62},{"playerIn":"Liam Stone","playerOut":"Charlie Wright","minute":69},{"playerIn":"Edward Brooks","playerOut":"William Robinson","minute":76}]'::jsonb
) ON CONFLICT (match_id) DO NOTHING;
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bru-avl-2025-03-05', 'goal', 'aston-villa', 71, 'Charlie Wright', 'Asist: Davies');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bru-avl-2025-03-05', 'goal', 'aston-villa', 20, 'Thomas Green', 'Asist: Robinson');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bru-avl-2025-03-05', 'goal', 'aston-villa', 16, 'James Evans', 'Asist: Wright');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bru-avl-2025-03-05', 'card', 'club-brugge', 40, 'Lucas Richard', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bru-avl-2025-03-05', 'card', 'aston-villa', 82, 'Oliver Brown', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bru-avl-2025-03-05', 'card', 'club-brugge', 33, 'Arthur Robert', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bru-avl-2025-03-05', 'card', 'aston-villa', 47, 'George Williams', 'Tarjeta Amarilla');
INSERT INTO public.match_details (match_id, home_formation, away_formation, stats, home_substitutions, away_substitutions) VALUES (
  'avl-bru-2025-03-13', '4-3-3', '4-3-3',
  '{"xg":[3.8,1.7],"shots":[21,11],"shotsOnTarget":[6,3],"possession":[43,57],"passes":[408,541],"passAccuracy":[78,85],"fouls":[10,11],"yellowCards":[2,2],"redCards":[0,0],"offsides":[1,1],"corners":[3,7]}'::jsonb,
  '[{"playerIn":"Mason Cole","playerOut":"Thomas Green","minute":60},{"playerIn":"Liam Stone","playerOut":"Charlie Wright","minute":68},{"playerIn":"Edward Brooks","playerOut":"William Robinson","minute":76}]'::jsonb,
  '[{"playerIn":"Mathieu Guerin","playerOut":"Pierre Dupont","minute":62},{"playerIn":"Julien Boyer","playerOut":"Maxime Mercier","minute":69},{"playerIn":"Théo Chevalier","playerOut":"Alexandre Lefevre","minute":76}]'::jsonb
) ON CONFLICT (match_id) DO NOTHING;
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('avl-bru-2025-03-13', 'goal', 'aston-villa', 63, 'Charlie Wright', 'Asist: Davies');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('avl-bru-2025-03-13', 'goal', 'aston-villa', 35, 'Thomas Green', 'Asist: Robinson');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('avl-bru-2025-03-13', 'goal', 'aston-villa', 48, 'James Evans', 'Asist: Wright');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('avl-bru-2025-03-13', 'goal', 'club-brugge', 33, 'Maxime Mercier', 'Asist: Laurent');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('avl-bru-2025-03-13', 'card', 'aston-villa', 19, 'Oliver Brown', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('avl-bru-2025-03-13', 'card', 'club-brugge', 30, 'Lucas Richard', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('avl-bru-2025-03-13', 'card', 'aston-villa', 52, 'George Williams', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('avl-bru-2025-03-13', 'card', 'club-brugge', 14, 'Arthur Robert', 'Tarjeta Amarilla');
INSERT INTO public.match_details (match_id, home_formation, away_formation, stats, home_substitutions, away_substitutions) VALUES (
  'rma-ars-2025-04-08', '4-3-3', '4-3-3',
  '{"xg":[0.2,3.5],"shots":[10,16],"shotsOnTarget":[3,5],"possession":[57,43],"passes":[541,408],"passAccuracy":[76,79],"fouls":[13,10],"yellowCards":[2,2],"redCards":[0,0],"offsides":[0,3],"corners":[7,4]}'::jsonb,
  '[{"playerIn":"Andriy Lunin","playerOut":"Rodrygo Goes","minute":60},{"playerIn":"Lucas Vázquez","playerOut":"Jude Bellingham","minute":68},{"playerIn":"Fran García","playerOut":"Aurélien Tchouaméni","minute":76}]'::jsonb,
  '[{"playerIn":"Neto","playerOut":"Bukayo Saka","minute":62},{"playerIn":"Jakub Kiwior","playerOut":"Martin Ødegaard","minute":69},{"playerIn":"Oleksandr Zinchenko","playerOut":"Declan Rice","minute":76}]'::jsonb
) ON CONFLICT (match_id) DO NOTHING;
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('rma-ars-2025-04-08', 'goal', 'arsenal', 12, 'Martin Ødegaard', 'Asist: Partey');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('rma-ars-2025-04-08', 'goal', 'arsenal', 81, 'Bukayo Saka', 'Asist: Rice');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('rma-ars-2025-04-08', 'goal', 'arsenal', 9, 'Kai Havertz', 'Asist: Ødegaard');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('rma-ars-2025-04-08', 'card', 'real-madrid', 87, 'Dani Carvajal', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('rma-ars-2025-04-08', 'card', 'arsenal', 20, 'Ben White', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('rma-ars-2025-04-08', 'card', 'real-madrid', 70, 'Éder Militão', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('rma-ars-2025-04-08', 'card', 'arsenal', 50, 'William Saliba', 'Tarjeta Amarilla');
INSERT INTO public.match_details (match_id, home_formation, away_formation, stats, home_substitutions, away_substitutions) VALUES (
  'ars-rma-2025-04-16', '4-3-3', '4-3-3',
  '{"xg":[2.3,1.4],"shots":[16,10],"shotsOnTarget":[3,2],"possession":[42,58],"passes":[399,551],"passAccuracy":[84,87],"fouls":[14,12],"yellowCards":[2,2],"redCards":[0,0],"offsides":[2,2],"corners":[7,6]}'::jsonb,
  '[{"playerIn":"Neto","playerOut":"Bukayo Saka","minute":60},{"playerIn":"Jakub Kiwior","playerOut":"Martin Ødegaard","minute":68},{"playerIn":"Oleksandr Zinchenko","playerOut":"Declan Rice","minute":76}]'::jsonb,
  '[{"playerIn":"Andriy Lunin","playerOut":"Rodrygo Goes","minute":62},{"playerIn":"Lucas Vázquez","playerOut":"Jude Bellingham","minute":69},{"playerIn":"Fran García","playerOut":"Aurélien Tchouaméni","minute":76}]'::jsonb
) ON CONFLICT (match_id) DO NOTHING;
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('ars-rma-2025-04-16', 'goal', 'arsenal', 65, 'Martin Ødegaard', 'Asist: Partey');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('ars-rma-2025-04-16', 'goal', 'arsenal', 52, 'Bukayo Saka', 'Asist: Rice');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('ars-rma-2025-04-16', 'goal', 'real-madrid', 31, 'Jude Bellingham', 'Asist: Valverde');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('ars-rma-2025-04-16', 'card', 'arsenal', 88, 'Ben White', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('ars-rma-2025-04-16', 'card', 'real-madrid', 59, 'Dani Carvajal', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('ars-rma-2025-04-16', 'card', 'arsenal', 14, 'William Saliba', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('ars-rma-2025-04-16', 'card', 'real-madrid', 48, 'Éder Militão', 'Tarjeta Amarilla');
INSERT INTO public.match_details (match_id, home_formation, away_formation, stats, home_substitutions, away_substitutions) VALUES (
  'avl-psg-2025-04-09', '4-3-3', '4-3-3',
  '{"xg":[2.6,3.7],"shots":[17,17],"shotsOnTarget":[4,5],"possession":[59,41],"passes":[560,389],"passAccuracy":[89,89],"fouls":[12,14],"yellowCards":[2,2],"redCards":[0,0],"offsides":[2,3],"corners":[8,5]}'::jsonb,
  '[{"playerIn":"Mason Cole","playerOut":"Thomas Green","minute":60},{"playerIn":"Liam Stone","playerOut":"Charlie Wright","minute":68},{"playerIn":"Edward Brooks","playerOut":"William Robinson","minute":76}]'::jsonb,
  '[{"playerIn":"Matvey Safonov","playerOut":"Ousmane Dembélé","minute":62},{"playerIn":"Lucas Beraldo","playerOut":"João Neves","minute":69},{"playerIn":"Milan Škriniar","playerOut":"Warren Zaïre-Emery","minute":76}]'::jsonb
) ON CONFLICT (match_id) DO NOTHING;
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('avl-psg-2025-04-09', 'goal', 'aston-villa', 63, 'Charlie Wright', 'Asist: Davies');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('avl-psg-2025-04-09', 'goal', 'aston-villa', 49, 'Thomas Green', 'Asist: Robinson');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('avl-psg-2025-04-09', 'goal', 'paris-saint-germain', 72, 'João Neves', 'Asist: Vitinha');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('avl-psg-2025-04-09', 'goal', 'paris-saint-germain', 23, 'Ousmane Dembélé', 'Asist: Zaïre-Emery');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('avl-psg-2025-04-09', 'goal', 'paris-saint-germain', 68, 'Bradley Barcola', 'Asist: Neves');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('avl-psg-2025-04-09', 'card', 'aston-villa', 85, 'Oliver Brown', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('avl-psg-2025-04-09', 'card', 'paris-saint-germain', 24, 'Achraf Hakimi', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('avl-psg-2025-04-09', 'card', 'aston-villa', 58, 'George Williams', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('avl-psg-2025-04-09', 'card', 'paris-saint-germain', 59, 'Marquinhos', 'Tarjeta Amarilla');
INSERT INTO public.match_details (match_id, home_formation, away_formation, stats, home_substitutions, away_substitutions) VALUES (
  'psg-avl-2025-04-17', '4-3-3', '4-3-3',
  '{"xg":[2.5,2.8],"shots":[17,14],"shotsOnTarget":[6,3],"possession":[54,46],"passes":[513,437],"passAccuracy":[86,80],"fouls":[10,12],"yellowCards":[2,2],"redCards":[0,0],"offsides":[2,2],"corners":[6,6]}'::jsonb,
  '[{"playerIn":"Matvey Safonov","playerOut":"Ousmane Dembélé","minute":60},{"playerIn":"Lucas Beraldo","playerOut":"João Neves","minute":68},{"playerIn":"Milan Škriniar","playerOut":"Warren Zaïre-Emery","minute":76}]'::jsonb,
  '[{"playerIn":"Mason Cole","playerOut":"Thomas Green","minute":62},{"playerIn":"Liam Stone","playerOut":"Charlie Wright","minute":69},{"playerIn":"Edward Brooks","playerOut":"William Robinson","minute":76}]'::jsonb
) ON CONFLICT (match_id) DO NOTHING;
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('psg-avl-2025-04-17', 'goal', 'paris-saint-germain', 17, 'João Neves', 'Asist: Vitinha');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('psg-avl-2025-04-17', 'goal', 'paris-saint-germain', 23, 'Ousmane Dembélé', 'Asist: Zaïre-Emery');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('psg-avl-2025-04-17', 'goal', 'aston-villa', 32, 'Charlie Wright', 'Asist: Davies');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('psg-avl-2025-04-17', 'goal', 'aston-villa', 71, 'Thomas Green', 'Asist: Robinson');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('psg-avl-2025-04-17', 'card', 'paris-saint-germain', 9, 'Achraf Hakimi', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('psg-avl-2025-04-17', 'card', 'aston-villa', 28, 'Oliver Brown', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('psg-avl-2025-04-17', 'card', 'paris-saint-germain', 88, 'Marquinhos', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('psg-avl-2025-04-17', 'card', 'aston-villa', 59, 'George Williams', 'Tarjeta Amarilla');
INSERT INTO public.match_details (match_id, home_formation, away_formation, stats, home_substitutions, away_substitutions) VALUES (
  'bvb-bar-2025-04-08', '4-3-3', '4-3-3',
  '{"xg":[1.6,3.1],"shots":[14,15],"shotsOnTarget":[2,4],"possession":[49,51],"passes":[465,484],"passAccuracy":[86,89],"fouls":[15,13],"yellowCards":[2,2],"redCards":[0,0],"offsides":[0,1],"corners":[6,7]}'::jsonb,
  '[{"playerIn":"Jan Zimmermann","playerOut":"Sebastian Richter","minute":60},{"playerIn":"Tobias Hartmann","playerOut":"David Bauer","minute":68},{"playerIn":"Niklas Krüger","playerOut":"Simon Koch","minute":76}]'::jsonb,
  '[{"playerIn":"Iñaki Peña","playerOut":"Lamine Yamal","minute":62},{"playerIn":"Héctor Fort","playerOut":"Dani Olmo","minute":69},{"playerIn":"Sergi Domínguez","playerOut":"Pedri González","minute":76}]'::jsonb
) ON CONFLICT (match_id) DO NOTHING;
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bvb-bar-2025-04-08', 'goal', 'borussia-dortmund', 86, 'David Bauer', 'Asist: Schäfer');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bvb-bar-2025-04-08', 'goal', 'barcelona', 22, 'Dani Olmo', 'Asist: Casadó');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bvb-bar-2025-04-08', 'goal', 'barcelona', 33, 'Lamine Yamal', 'Asist: González');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bvb-bar-2025-04-08', 'goal', 'barcelona', 30, 'Robert Lewandowski', 'Asist: Olmo');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bvb-bar-2025-04-08', 'card', 'borussia-dortmund', 81, 'Thomas Weber', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bvb-bar-2025-04-08', 'card', 'barcelona', 56, 'Jules Koundé', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bvb-bar-2025-04-08', 'card', 'borussia-dortmund', 39, 'Jonas Becker', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bvb-bar-2025-04-08', 'card', 'barcelona', 57, 'Pau Cubarsí', 'Tarjeta Amarilla');
INSERT INTO public.match_details (match_id, home_formation, away_formation, stats, home_substitutions, away_substitutions) VALUES (
  'bar-bvb-2025-04-16', '4-3-3', '4-3-3',
  '{"xg":[2.3,2.7],"shots":[16,14],"shotsOnTarget":[4,4],"possession":[51,49],"passes":[484,465],"passAccuracy":[88,89],"fouls":[12,10],"yellowCards":[2,2],"redCards":[0,0],"offsides":[0,3],"corners":[5,4]}'::jsonb,
  '[{"playerIn":"Iñaki Peña","playerOut":"Lamine Yamal","minute":60},{"playerIn":"Héctor Fort","playerOut":"Dani Olmo","minute":68},{"playerIn":"Sergi Domínguez","playerOut":"Pedri González","minute":76}]'::jsonb,
  '[{"playerIn":"Jan Zimmermann","playerOut":"Sebastian Richter","minute":62},{"playerIn":"Tobias Hartmann","playerOut":"David Bauer","minute":69},{"playerIn":"Niklas Krüger","playerOut":"Simon Koch","minute":76}]'::jsonb
) ON CONFLICT (match_id) DO NOTHING;
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bar-bvb-2025-04-16', 'goal', 'barcelona', 45, 'Dani Olmo', 'Asist: Casadó');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bar-bvb-2025-04-16', 'goal', 'barcelona', 74, 'Lamine Yamal', 'Asist: González');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bar-bvb-2025-04-16', 'goal', 'borussia-dortmund', 66, 'David Bauer', 'Asist: Schäfer');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bar-bvb-2025-04-16', 'goal', 'borussia-dortmund', 69, 'Sebastian Richter', 'Asist: Koch');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bar-bvb-2025-04-16', 'card', 'barcelona', 39, 'Jules Koundé', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bar-bvb-2025-04-16', 'card', 'borussia-dortmund', 56, 'Thomas Weber', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bar-bvb-2025-04-16', 'card', 'barcelona', 31, 'Pau Cubarsí', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bar-bvb-2025-04-16', 'card', 'borussia-dortmund', 8, 'Jonas Becker', 'Tarjeta Amarilla');
INSERT INTO public.match_details (match_id, home_formation, away_formation, stats, home_substitutions, away_substitutions) VALUES (
  'bay-int-2025-04-09', '4-3-3', '4-3-3',
  '{"xg":[1.2,2.8],"shots":[13,14],"shotsOnTarget":[5,4],"possession":[47,53],"passes":[446,503],"passAccuracy":[83,88],"fouls":[11,12],"yellowCards":[2,2],"redCards":[0,0],"offsides":[3,2],"corners":[6,6]}'::jsonb,
  '[{"playerIn":"Sven Ulreich","playerOut":"Jamal Musiala","minute":60},{"playerIn":"Eric Dier","playerOut":"Michael Olise","minute":68},{"playerIn":"Raphaël Guerreiro","playerOut":"João Palhinha","minute":76}]'::jsonb,
  '[{"playerIn":"Josep Martínez","playerOut":"Federico Dimarco","minute":62},{"playerIn":"Stefan de Vrij","playerOut":"Henrikh Mkhitaryan","minute":69},{"playerIn":"Yann Bisseck","playerOut":"Hakan Çalhanoğlu","minute":76}]'::jsonb
) ON CONFLICT (match_id) DO NOTHING;
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bay-int-2025-04-09', 'goal', 'bayern-munich', 55, 'Michael Olise', 'Asist: Pavlović');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bay-int-2025-04-09', 'goal', 'inter-milan', 58, 'Henrikh Mkhitaryan', 'Asist: Barella');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bay-int-2025-04-09', 'goal', 'inter-milan', 49, 'Federico Dimarco', 'Asist: Çalhanoğlu');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bay-int-2025-04-09', 'card', 'bayern-munich', 14, 'Joshua Kimmich', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bay-int-2025-04-09', 'card', 'inter-milan', 78, 'Benjamin Pavard', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bay-int-2025-04-09', 'card', 'bayern-munich', 40, 'Dayot Upamecano', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bay-int-2025-04-09', 'card', 'inter-milan', 9, 'Francesco Acerbi', 'Tarjeta Amarilla');
INSERT INTO public.match_details (match_id, home_formation, away_formation, stats, home_substitutions, away_substitutions) VALUES (
  'int-bay-2025-04-17', '4-3-3', '4-3-3',
  '{"xg":[2.1,2.3],"shots":[16,12],"shotsOnTarget":[5,2],"possession":[50,50],"passes":[475,475],"passAccuracy":[79,84],"fouls":[14,11],"yellowCards":[2,2],"redCards":[0,0],"offsides":[3,1],"corners":[5,6]}'::jsonb,
  '[{"playerIn":"Josep Martínez","playerOut":"Federico Dimarco","minute":60},{"playerIn":"Stefan de Vrij","playerOut":"Henrikh Mkhitaryan","minute":68},{"playerIn":"Yann Bisseck","playerOut":"Hakan Çalhanoğlu","minute":76}]'::jsonb,
  '[{"playerIn":"Sven Ulreich","playerOut":"Jamal Musiala","minute":62},{"playerIn":"Eric Dier","playerOut":"Michael Olise","minute":69},{"playerIn":"Raphaël Guerreiro","playerOut":"João Palhinha","minute":76}]'::jsonb
) ON CONFLICT (match_id) DO NOTHING;
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('int-bay-2025-04-17', 'goal', 'inter-milan', 63, 'Henrikh Mkhitaryan', 'Asist: Barella');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('int-bay-2025-04-17', 'goal', 'inter-milan', 89, 'Federico Dimarco', 'Asist: Çalhanoğlu');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('int-bay-2025-04-17', 'goal', 'bayern-munich', 28, 'Michael Olise', 'Asist: Pavlović');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('int-bay-2025-04-17', 'goal', 'bayern-munich', 19, 'Jamal Musiala', 'Asist: Palhinha');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('int-bay-2025-04-17', 'card', 'inter-milan', 81, 'Benjamin Pavard', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('int-bay-2025-04-17', 'card', 'bayern-munich', 5, 'Joshua Kimmich', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('int-bay-2025-04-17', 'card', 'inter-milan', 73, 'Francesco Acerbi', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('int-bay-2025-04-17', 'card', 'bayern-munich', 37, 'Dayot Upamecano', 'Tarjeta Amarilla');
INSERT INTO public.match_details (match_id, home_formation, away_formation, stats, home_substitutions, away_substitutions) VALUES (
  'ars-psg-2025-04-29', '4-3-3', '4-3-3',
  '{"xg":[1.7,2.5],"shots":[15,13],"shotsOnTarget":[3,2],"possession":[56,44],"passes":[532,418],"passAccuracy":[87,79],"fouls":[14,10],"yellowCards":[2,2],"redCards":[0,0],"offsides":[1,0],"corners":[5,3]}'::jsonb,
  '[{"playerIn":"Neto","playerOut":"Bukayo Saka","minute":60},{"playerIn":"Jakub Kiwior","playerOut":"Martin Ødegaard","minute":68},{"playerIn":"Oleksandr Zinchenko","playerOut":"Declan Rice","minute":76}]'::jsonb,
  '[{"playerIn":"Matvey Safonov","playerOut":"Ousmane Dembélé","minute":62},{"playerIn":"Lucas Beraldo","playerOut":"João Neves","minute":69},{"playerIn":"Milan Škriniar","playerOut":"Warren Zaïre-Emery","minute":76}]'::jsonb
) ON CONFLICT (match_id) DO NOTHING;
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('ars-psg-2025-04-29', 'goal', 'arsenal', 58, 'Martin Ødegaard', 'Asist: Partey');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('ars-psg-2025-04-29', 'goal', 'paris-saint-germain', 88, 'João Neves', 'Asist: Vitinha');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('ars-psg-2025-04-29', 'goal', 'paris-saint-germain', 68, 'Ousmane Dembélé', 'Asist: Zaïre-Emery');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('ars-psg-2025-04-29', 'card', 'arsenal', 47, 'Ben White', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('ars-psg-2025-04-29', 'card', 'paris-saint-germain', 11, 'Achraf Hakimi', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('ars-psg-2025-04-29', 'card', 'arsenal', 83, 'William Saliba', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('ars-psg-2025-04-29', 'card', 'paris-saint-germain', 69, 'Marquinhos', 'Tarjeta Amarilla');
INSERT INTO public.match_details (match_id, home_formation, away_formation, stats, home_substitutions, away_substitutions) VALUES (
  'psg-ars-2025-05-07', '4-3-3', '4-3-3',
  '{"xg":[1.3,1.3],"shots":[13,9],"shotsOnTarget":[3,3],"possession":[56,44],"passes":[532,418],"passAccuracy":[86,75],"fouls":[15,13],"yellowCards":[2,2],"redCards":[0,0],"offsides":[3,2],"corners":[8,2]}'::jsonb,
  '[{"playerIn":"Matvey Safonov","playerOut":"Ousmane Dembélé","minute":60},{"playerIn":"Lucas Beraldo","playerOut":"João Neves","minute":68},{"playerIn":"Milan Škriniar","playerOut":"Warren Zaïre-Emery","minute":76}]'::jsonb,
  '[{"playerIn":"Neto","playerOut":"Bukayo Saka","minute":62},{"playerIn":"Jakub Kiwior","playerOut":"Martin Ødegaard","minute":69},{"playerIn":"Oleksandr Zinchenko","playerOut":"Declan Rice","minute":76}]'::jsonb
) ON CONFLICT (match_id) DO NOTHING;
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('psg-ars-2025-05-07', 'goal', 'paris-saint-germain', 4, 'João Neves', 'Asist: Vitinha');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('psg-ars-2025-05-07', 'goal', 'arsenal', 83, 'Martin Ødegaard', 'Asist: Partey');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('psg-ars-2025-05-07', 'card', 'paris-saint-germain', 57, 'Achraf Hakimi', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('psg-ars-2025-05-07', 'card', 'arsenal', 27, 'Ben White', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('psg-ars-2025-05-07', 'card', 'paris-saint-germain', 89, 'Marquinhos', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('psg-ars-2025-05-07', 'card', 'arsenal', 5, 'William Saliba', 'Tarjeta Amarilla');
INSERT INTO public.match_details (match_id, home_formation, away_formation, stats, home_substitutions, away_substitutions) VALUES (
  'bar-int-2025-04-30', '4-3-3', '4-3-3',
  '{"xg":[0.7,1.6],"shots":[12,10],"shotsOnTarget":[1,2],"possession":[52,48],"passes":[494,456],"passAccuracy":[86,77],"fouls":[10,12],"yellowCards":[2,2],"redCards":[0,0],"offsides":[0,2],"corners":[8,6]}'::jsonb,
  '[{"playerIn":"Iñaki Peña","playerOut":"Lamine Yamal","minute":60},{"playerIn":"Héctor Fort","playerOut":"Dani Olmo","minute":68},{"playerIn":"Sergi Domínguez","playerOut":"Pedri González","minute":76}]'::jsonb,
  '[{"playerIn":"Josep Martínez","playerOut":"Federico Dimarco","minute":62},{"playerIn":"Stefan de Vrij","playerOut":"Henrikh Mkhitaryan","minute":69},{"playerIn":"Yann Bisseck","playerOut":"Hakan Çalhanoğlu","minute":76}]'::jsonb
) ON CONFLICT (match_id) DO NOTHING;
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bar-int-2025-04-30', 'goal', 'inter-milan', 81, 'Henrikh Mkhitaryan', 'Asist: Barella');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bar-int-2025-04-30', 'card', 'barcelona', 73, 'Jules Koundé', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bar-int-2025-04-30', 'card', 'inter-milan', 70, 'Benjamin Pavard', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bar-int-2025-04-30', 'card', 'barcelona', 23, 'Pau Cubarsí', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('bar-int-2025-04-30', 'card', 'inter-milan', 89, 'Francesco Acerbi', 'Tarjeta Amarilla');
INSERT INTO public.match_details (match_id, home_formation, away_formation, stats, home_substitutions, away_substitutions) VALUES (
  'int-bar-2025-05-08', '4-3-3', '4-3-3',
  '{"xg":[1.8,1.9],"shots":[15,11],"shotsOnTarget":[4,3],"possession":[56,44],"passes":[532,418],"passAccuracy":[88,81],"fouls":[13,10],"yellowCards":[2,2],"redCards":[0,0],"offsides":[3,3],"corners":[6,4]}'::jsonb,
  '[{"playerIn":"Josep Martínez","playerOut":"Federico Dimarco","minute":60},{"playerIn":"Stefan de Vrij","playerOut":"Henrikh Mkhitaryan","minute":68},{"playerIn":"Yann Bisseck","playerOut":"Hakan Çalhanoğlu","minute":76}]'::jsonb,
  '[{"playerIn":"Iñaki Peña","playerOut":"Lamine Yamal","minute":62},{"playerIn":"Héctor Fort","playerOut":"Dani Olmo","minute":69},{"playerIn":"Sergi Domínguez","playerOut":"Pedri González","minute":76}]'::jsonb
) ON CONFLICT (match_id) DO NOTHING;
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('int-bar-2025-05-08', 'goal', 'inter-milan', 57, 'Henrikh Mkhitaryan', 'Asist: Barella');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('int-bar-2025-05-08', 'goal', 'barcelona', 31, 'Dani Olmo', 'Asist: Casadó');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('int-bar-2025-05-08', 'card', 'inter-milan', 52, 'Benjamin Pavard', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('int-bar-2025-05-08', 'card', 'barcelona', 32, 'Jules Koundé', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('int-bar-2025-05-08', 'card', 'inter-milan', 52, 'Francesco Acerbi', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('int-bar-2025-05-08', 'card', 'barcelona', 71, 'Pau Cubarsí', 'Tarjeta Amarilla');
INSERT INTO public.match_details (match_id, home_formation, away_formation, stats, home_substitutions, away_substitutions) VALUES (
  'psg-int-2025-05-31', '4-3-3', '3-5-2',
  '{"xg":[3.4,0.4],"shots":[18,5],"shotsOnTarget":[10,1],"possession":[58,42],"passes":[620,440],"passAccuracy":[91,83],"fouls":[9,12],"yellowCards":[1,3],"redCards":[0,0],"offsides":[2,1],"corners":[7,3]}'::jsonb,
  '[{"playerIn":"Fabián Ruiz","playerOut":"Marco Asensio","minute":65},{"playerIn":"Kang-in Lee","playerOut":"Ousmane Dembélé","minute":72},{"playerIn":"Randal Kolo Muani","playerOut":"Bradley Barcola","minute":78},{"playerIn":"Lucas Beraldo","playerOut":"Nuno Mendes","minute":82}]'::jsonb,
  '[{"playerIn":"Davide Frattesi","playerOut":"Henrikh Mkhitaryan","minute":60},{"playerIn":"Carlos Augusto","playerOut":"Federico Dimarco","minute":60},{"playerIn":"Piotr Zieliński","playerOut":"Hakan Çalhanoğlu","minute":70},{"playerIn":"Matteo Darmian","playerOut":"Denzel Dumfries","minute":70},{"playerIn":"Mehdi Taremi","playerOut":"Marcus Thuram","minute":75}]'::jsonb
) ON CONFLICT (match_id) DO NOTHING;
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('psg-int-2025-05-31', 'goal', 'paris-saint-germain', 14, 'Ousmane Dembélé', 'Asist: Bradley Barcola');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('psg-int-2025-05-31', 'goal', 'paris-saint-germain', 32, 'Bradley Barcola', 'Asist: Vitinha');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('psg-int-2025-05-31', 'goal', 'paris-saint-germain', 55, 'Vitinha', 'Penalti');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('psg-int-2025-05-31', 'card', 'inter-milan', 54, 'Benjamin Pavard', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('psg-int-2025-05-31', 'goal', 'paris-saint-germain', 62, 'Marco Asensio', 'Asist: Achraf Hakimi');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('psg-int-2025-05-31', 'card', 'paris-saint-germain', 68, 'Nuno Mendes', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('psg-int-2025-05-31', 'card', 'inter-milan', 71, 'Nicolò Barella', 'Tarjeta Amarilla');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('psg-int-2025-05-31', 'goal', 'paris-saint-germain', 84, 'Randal Kolo Muani', 'Asist: Fabián Ruiz');
INSERT INTO public.match_events (match_id, type, team_id, minute, player, detail) VALUES ('psg-int-2025-05-31', 'card', 'inter-milan', 87, 'Alessandro Bastoni', 'Tarjeta Amarilla');
