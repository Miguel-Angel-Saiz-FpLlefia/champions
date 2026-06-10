-- ==========================================
-- SCRIPT DE CONFIGURACIÓN DE AUTENTICACIÓN Y ROLES
-- ==========================================

-- Habilitar pgcrypto para encriptar contraseñas
CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- 1. Crear la tabla de perfiles en la base de datos pública
CREATE TABLE IF NOT EXISTS public.profiles (
    id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
    email TEXT NOT NULL,
    role TEXT NOT NULL DEFAULT 'usuario normal' CHECK (role IN ('Administrador', 'editor', 'usuario normal')),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- Habilitar RLS en public.profiles
ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;

-- Eliminar políticas previas si existen
DROP POLICY IF EXISTS "Permitir lectura pública de perfiles" ON public.profiles;
DROP POLICY IF EXISTS "Permitir actualización a los propios usuarios" ON public.profiles;

-- Crear políticas
CREATE POLICY "Permitir lectura pública de perfiles" ON public.profiles FOR SELECT USING (true);
CREATE POLICY "Permitir actualización a los propios usuarios" ON public.profiles FOR UPDATE USING (auth.uid() = id);

-- 2. Función y Trigger para crear automáticamente el perfil al registrar un usuario en auth.users
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO public.profiles (id, email, role)
  VALUES (
    new.id,
    new.email,
    COALESCE(new.raw_user_meta_data->>'role', 'usuario normal')
  )
  ON CONFLICT (id) DO UPDATE
  SET email = EXCLUDED.email,
      role = COALESCE(EXCLUDED.role, profiles.role);
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;
CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();

-- 3. Insertar usuarios de prueba por defecto
-- Usamos extensions.crypt('contraseña', extensions.gen_salt('bf')) para hashear la contraseña
-- Esto asegura que queden encriptadas de forma idéntica a como lo hace Supabase.

-- Limpiar usuarios de prueba anteriores para evitar duplicados en la base de datos local/remota
DELETE FROM auth.users WHERE email IN ('admin@champions.com', 'editor@champions.com', 'user@champions.com');

-- Administrador: admin@champions.com / admin123
INSERT INTO auth.users (
  instance_id,
  id,
  aud,
  role,
  email,
  encrypted_password,
  email_confirmed_at,
  recovery_sent_at,
  last_sign_in_at,
  raw_app_meta_data,
  raw_user_meta_data,
  created_at,
  updated_at,
  confirmation_token,
  email_change,
  email_change_token_new,
  recovery_token
) VALUES (
  '00000000-0000-0000-0000-000000000000',
  'a1a1a1a1-a1a1-a1a1-a1a1-a1a1a1a1a1a1',
  'authenticated',
  'authenticated',
  'admin@champions.com',
  extensions.crypt('admin123', extensions.gen_salt('bf')),
  now(),
  null,
  null,
  '{"provider":"email","providers":["email"]}',
  '{"role":"Administrador"}',
  now(),
  now(),
  '',
  '',
  '',
  ''
);

-- Editor: editor@champions.com / editor123
INSERT INTO auth.users (
  instance_id,
  id,
  aud,
  role,
  email,
  encrypted_password,
  email_confirmed_at,
  recovery_sent_at,
  last_sign_in_at,
  raw_app_meta_data,
  raw_user_meta_data,
  created_at,
  updated_at,
  confirmation_token,
  email_change,
  email_change_token_new,
  recovery_token
) VALUES (
  '00000000-0000-0000-0000-000000000000',
  'e2e2e2e2-e2e2-e2e2-e2e2-e2e2e2e2e2e2',
  'authenticated',
  'authenticated',
  'editor@champions.com',
  extensions.crypt('editor123', extensions.gen_salt('bf')),
  now(),
  null,
  null,
  '{"provider":"email","providers":["email"]}',
  '{"role":"editor"}',
  now(),
  now(),
  '',
  '',
  '',
  ''
);

-- Usuario Normal: user@champions.com / user123
INSERT INTO auth.users (
  instance_id,
  id,
  aud,
  role,
  email,
  encrypted_password,
  email_confirmed_at,
  recovery_sent_at,
  last_sign_in_at,
  raw_app_meta_data,
  raw_user_meta_data,
  created_at,
  updated_at,
  confirmation_token,
  email_change,
  email_change_token_new,
  recovery_token
) VALUES (
  '00000000-0000-0000-0000-000000000000',
  'c3c3c3c3-c3c3-c3c3-c3c3-c3c3c3c3c3c3',
  'authenticated',
  'authenticated',
  'user@champions.com',
  extensions.crypt('user123', extensions.gen_salt('bf')),
  now(),
  null,
  null,
  '{"provider":"email","providers":["email"]}',
  '{"role":"usuario normal"}',
  now(),
  now(),
  '',
  '',
  '',
  ''
);

-- ==========================================
-- TABLA DE COMENTARIOS PARA PARTIDOS
-- ==========================================

CREATE TABLE IF NOT EXISTS public.comments (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    match_id TEXT NOT NULL REFERENCES public.matches(id) ON DELETE CASCADE,
    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    content TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- Habilitar Row Level Security (RLS) en public.comments
ALTER TABLE public.comments ENABLE ROW LEVEL SECURITY;

-- Eliminar políticas previas si existen
DROP POLICY IF EXISTS "Permitir lectura pública de comentarios" ON public.comments;
DROP POLICY IF EXISTS "Permitir insertar a usuarios autenticados" ON public.comments;

-- Crear políticas
CREATE POLICY "Permitir lectura pública de comentarios" ON public.comments FOR SELECT USING (true);
CREATE POLICY "Permitir insertar a usuarios autenticados" ON public.comments FOR INSERT WITH CHECK (auth.uid() = user_id);

-- ==========================================
-- FUNCION AUXILIAR Y POLÍTICAS RLS PARA CRUD
-- ==========================================

-- Función para obtener el rol del usuario actual
CREATE OR REPLACE FUNCTION public.get_user_role()
RETURNS TEXT AS $$
  SELECT role FROM public.profiles WHERE id = auth.uid();
$$ LANGUAGE sql SECURITY DEFINER;

-- Eliminar políticas de escritura previas si existen
DROP POLICY IF EXISTS "Permitir escritura a administradores y editores" ON public.teams;
DROP POLICY IF EXISTS "Permitir escritura a administradores y editores" ON public.matches;
DROP POLICY IF EXISTS "Permitir escritura a administradores y editores" ON public.standings;
DROP POLICY IF EXISTS "Permitir escritura a administradores y editores" ON public.players;
DROP POLICY IF EXISTS "Permitir actualizar perfiles a administradores" ON public.profiles;
DROP POLICY IF EXISTS "Permitir escritura a administradores y editores" ON public.match_details;
DROP POLICY IF EXISTS "Permitir escritura a administradores y editores" ON public.match_events;

-- Crear políticas de escritura para equipos, partidos, clasificación y jugadores
CREATE POLICY "Permitir escritura a administradores y editores" ON public.teams
    FOR ALL USING (public.get_user_role() IN ('Administrador', 'editor'))
    WITH CHECK (public.get_user_role() IN ('Administrador', 'editor'));

CREATE POLICY "Permitir escritura a administradores y editores" ON public.matches
    FOR ALL USING (public.get_user_role() IN ('Administrador', 'editor'))
    WITH CHECK (public.get_user_role() IN ('Administrador', 'editor'));

CREATE POLICY "Permitir escritura a administradores y editores" ON public.standings
    FOR ALL USING (public.get_user_role() IN ('Administrador', 'editor'))
    WITH CHECK (public.get_user_role() IN ('Administrador', 'editor'));

CREATE POLICY "Permitir escritura a administradores y editores" ON public.players
    FOR ALL USING (public.get_user_role() IN ('Administrador', 'editor'))
    WITH CHECK (public.get_user_role() IN ('Administrador', 'editor'));

CREATE POLICY "Permitir escritura a administradores y editores" ON public.match_details
    FOR ALL USING (public.get_user_role() IN ('Administrador', 'editor'))
    WITH CHECK (public.get_user_role() IN ('Administrador', 'editor'));

CREATE POLICY "Permitir escritura a administradores y editores" ON public.match_events
    FOR ALL USING (public.get_user_role() IN ('Administrador', 'editor'))
    WITH CHECK (public.get_user_role() IN ('Administrador', 'editor'));

-- Crear política para permitir que los administradores editen perfiles de usuario (roles)
CREATE POLICY "Permitir actualizar perfiles a administradores" ON public.profiles
    FOR UPDATE USING (public.get_user_role() = 'Administrador')
    WITH CHECK (public.get_user_role() = 'Administrador');


