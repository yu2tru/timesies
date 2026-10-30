-- Timesies leaderboard table. Run this in the Supabase SQL editor.

create table if not exists public.timesies_scores (
  id          bigint generated always as identity primary key,
  created_at  timestamptz not null default now(),
  player_id   text        not null check (char_length(player_id) between 8 and 64),
  puzzle_date date        not null,
  puzzle_no   integer     not null check (puzzle_no > 0),
  total       integer     not null check (total between 0 and 500),
  scores      integer[]   not null check (array_length(scores, 1) = 5),
  types       text[]      not null default '{}',
  unique (puzzle_date, player_id)   -- one score per player per day
);

create index if not exists timesies_scores_day_total_idx
  on public.timesies_scores (puzzle_date, total desc);

alter table public.timesies_scores enable row level security;

-- Anyone (including the anon key) can read scores.
drop policy if exists "anyone can read scores" on public.timesies_scores;
create policy "anyone can read scores"
  on public.timesies_scores for select
  to anon, authenticated
  using (true);

-- Anyone can insert a score. No update or delete policies, so rows are write-once.
drop policy if exists "anyone can insert scores" on public.timesies_scores;
create policy "anyone can insert scores"
  on public.timesies_scores for insert
  to anon, authenticated
  with check (true);
