"use client";

import React, { createContext, useContext, useEffect, useState } from "react";
import { User } from "@supabase/supabase-js";
import { supabase } from "./supabase";

interface Profile {
  id: string;
  email: string;
  role: "Administrador" | "editor" | "usuario normal";
  created_at: string;
}

interface AuthContextType {
  user: User | null;
  profile: Profile | null;
  loading: boolean;
  signOut: () => Promise<void>;
}

const AuthContext = createContext<AuthContextType>({
  user: null,
  profile: null,
  loading: true,
  signOut: async () => {},
});

export function AuthProvider({ children }: { children: React.ReactNode }) {
  const [user, setUser] = useState<User | null>(null);
  const [profile, setProfile] = useState<Profile | null>(null);
  const [loading, setLoading] = useState(true);

  const fetchProfile = async (userId: string) => {
    console.log("AuthProvider: Starting to fetch profile for user ID:", userId);
    try {
      const { data, error } = await supabase
        .from("profiles")
        .select("*")
        .eq("id", userId)
        .single();

      if (error) {
        console.error("AuthProvider: Error response from profiles table query:", error.message, error);
        setProfile(null);
      } else {
        console.log("AuthProvider: Profile successfully fetched and loaded:", data);
        setProfile(data as Profile);
      }
    } catch (err) {
      console.error("AuthProvider: Unexpected exception inside fetchProfile:", err);
      setProfile(null);
    }
  };

  useEffect(() => {
    let mounted = true;
    let initialCheckDone = false;

    // 1. Obtener la sesión inicial de forma segura
    const initAuth = async () => {
      try {
        const { data: { session } } = await supabase.auth.getSession();
        if (mounted) {
          if (session?.user) {
            setUser(session.user);
            fetchProfile(session.user.id);
          } else {
            setUser(null);
            setProfile(null);
          }
        }
      } catch (err) {
        console.error("Error fetching initial session:", err);
      } finally {
        initialCheckDone = true;
        if (mounted) {
          setLoading(false);
        }
      }
    };

    initAuth();

    // 2. Suscribirse a cambios posteriores en el estado de autenticación
    const { data: { subscription } } = supabase.auth.onAuthStateChange(
      async (event: any, session: any) => {
        if (!mounted) return;
        
        // Evitar reprocesar el evento de sesión inicial si ya se ha hecho initAuth
        if (event === "INITIAL_SESSION" && initialCheckDone) return;

        try {
          if (session?.user) {
            setUser(session.user);
            fetchProfile(session.user.id);
          } else {
            setUser(null);
            setProfile(null);
          }
        } catch (err) {
          console.error("Error in auth state change listener:", err);
        } finally {
          if (mounted) {
            setLoading(false);
          }
        }
      }
    );

    return () => {
      mounted = false;
      subscription.unsubscribe();
    };
  }, []);

  const signOut = async () => {
    setLoading(true);
    const timeoutId = setTimeout(() => {
      setUser(null);
      setProfile(null);
      setLoading(false);
    }, 2000);

    try {
      await supabase.auth.signOut();
    } catch (err) {
      console.error("Error during sign out:", err);
    } finally {
      clearTimeout(timeoutId);
      setUser(null);
      setProfile(null);
      setLoading(false);
    }
  };

  return (
    <AuthContext.Provider value={{ user, profile, loading, signOut }}>
      {children}
    </AuthContext.Provider>
  );
}

export const useAuth = () => useContext(AuthContext);
