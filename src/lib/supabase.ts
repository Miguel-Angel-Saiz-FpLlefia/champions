import { createClient } from "@supabase/supabase-js";

let supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL || "https://placeholder-url.supabase.co";
const supabaseAnonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY || "placeholder-key";

// Asegurar que la URL tenga un protocolo válido para evitar que la librería lance error de inicialización
if (!supabaseUrl.startsWith("http://") && !supabaseUrl.startsWith("https://")) {
  supabaseUrl = "https://placeholder-url.supabase.co";
}

export const supabase = createClient(supabaseUrl, supabaseAnonKey);


