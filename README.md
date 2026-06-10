# Futbol 360 - Champions SaaS

Minimal **multi-user SaaS** for browsing **teams** and **matches**, posting **match comments**, and managing content through **role-based backoffice** panels (`editor`, `Administrador`). Built as the **M0613 IA7** deliverable (block *Creació d'un SaaS*, sessions S16–S20).

**Live demo:** [Vercel Deployment](https://champions-saas.vercel.app) (Replace with your live URL)
**Repository:** [GitHub Repository](https://github.com/Miguel-Angel-Saiz-FpLlefia/champions)



## Why this project

Fans and editors need a single place to **publish** Champions fixtures and media, while **registered users** can discuss matches. The app separates **public catalog**, **social features**, and **internal tooling** with clear authorization — a common pattern in real B2B/B2C SaaS products.

## Features

### Public

- Browse **teams** and **matches** with real data from PostgreSQL (via Supabase).
- **Match detail** page with navigation between related entities (formations, stats, goals/cards).
- **Graceful degradation**: fallback to offline local mock data if Supabase credentials are not configured or the connection fails.

### Authenticated users

- **Sign up** and **sign in** (Supabase Auth).
- Post **comments** on matches (social layer) with direct role visualization badges.

### Backoffice

- **`editor`**: maintain teams, matches, and match events (goals, cards). Manage team rosters of players.
- **`Administrador`**: full CRUD capabilities + user and **role** management (`usuario normal`, `editor`, `Administrador`).

### Product / engineering

- **User stories** implemented incrementally in **Scrum sprints** (US-01 … US-22 — see course backlog).
- **Idempotent seed** script for quick database creation and testing.

## Tech stack

| Layer | Technology |
| ----- | ---------- |
| Framework | **Next.js 16** (App Router), **React 19**, **TypeScript** |
| Database | **PostgreSQL** (hosted on **Supabase**) |
| Auth | **Supabase Auth** (email/password credentials) |
| Client SDK | **@supabase/supabase-js** client |
| UI | **Tailwind CSS**, Custom Glassmorphism design |
| Deploy | **Vercel** (app) + **Supabase** (DB, auth) |

## Architecture (high level)

```text
Browser → Next.js App Router (RSC / Client Components)
               → Supabase JS Client → Supabase Postgres
               → Supabase Auth (sessions & token validation)
               → Database Triggers (automatic profile generation on auth.users insert)
```

- **Public read** endpoints expose teams/matches for visitors.
- **Mutations** (comments, backoffice CRUD) run securely validating role capabilities on the database via RLS (Row Level Security) and database policies.

## Prerequisites

- **Node.js** LTS
- A **Supabase** project (Postgres + Auth enabled)
- **Git**

## Getting started

### 1. Clone and install

```bash
git clone https://github.com/Miguel-Angel-Saiz-FpLlefia/champions.git
cd champions
npm install
```

### 2. Environment variables

Copy the example file and fill in your values:

```bash
cp .env.local.example .env.local
```

Never commit `.env.local`. See **Environment** below for variable meanings.

### 3. Database Setup

Execute the schema, triggers, and test users seed directly in your Supabase project:
1. Open the [auth_setup.sql](file:///c:/workspace/champions/auth_setup.sql) file.
2. Paste the SQL statements in your **Supabase Dashboard → SQL Editor** and click **Run**.
3. (Optional) Run [supabase_schema.sql](file:///c:/workspace/champions/supabase_schema.sql) and [supabase_players_and_details.sql](file:///c:/workspace/champions/supabase_players_and_details.sql) in SQL Editor to populate matches, teams, and lineups.

### 4. Run locally

```bash
npm run dev
```

Open [http://localhost:3000](http://localhost:3000).

## Environment

| Variable | Description |
| -------- | ----------- |
| `NEXT_PUBLIC_SUPABASE_URL` | Supabase project API base URL (without trailing slash) |
| `NEXT_PUBLIC_SUPABASE_ANON_KEY` | Supabase project anonymous public API key |

Full template belongs in **`.env.local.example`** (without secrets).

## Scripts

| Command | Purpose |
| ------- | ------- |
| `npm run dev` | Start Next.js in development |
| `npm run build` | Production build and compilation |
| `npm run start` | Start production server |
| `npm run lint` | ESLint |

## Verification checklist (IA7)

- [ ] Visitor can use **teams** and **matches** public routes with DB-backed data.
- [ ] User can **register** and **log in** without errors.
- [ ] Registered user can **comment** on a match.
- [ ] `editor` can manage teams/matches/players; `Administrador` can manage users/roles.
- [ ] App deploys to **Vercel**; production env vars set safely.

## Deployment

1. Push to GitHub; connect the repo to **Vercel**.
2. Set all production environment variables in Vercel (`NEXT_PUBLIC_SUPABASE_URL`, `NEXT_PUBLIC_SUPABASE_ANON_KEY`).
3. Make sure to turn off **Confirm email** in your Supabase Auth dashboard (`Authentication -> Providers -> Email`) if you want immediate user registration.

## Roadmap / known limitations

- Billing / subscriptions not included (course scope).
- Rate limiting and advanced observability left for future iterations.

## Academic context

Developed as **IA7 — Kates Serveis web** within **M0613** (DAW2). Product discovery and backlog: **Scrum** (session S19); implementation: guided sprints (session S20), as part of **M0613** (DAW2).

## License

Educational use — all rights reserved for classroom-only work.

## Author

**Miguel Ángel Saiz** - [GitHub Profile](https://github.com/Miguel-Angel-Saiz-FpLlefia)
