# timesies

A daily browser game about feeling time pass. Five rounds a day, one shot each, same puzzle for everyone.

Everything lives in `index.html` — host it as a static page (GitHub Pages, Netlify, anywhere).

## Where to change things

| What | Where in `index.html` |
| --- | --- |
| **Colors** | `:root` at the top of the `<style>` block: `--bg`, `--mint` (main accent), `--peach` (too late), `--lilac` (too early), `--text`, `--muted`, plus `--yellow` / `--red` for score tiers. |
| **Fonts** | `--font-digits` and `--font-text` in the same `:root` block. If you pick new Google Fonts, also update the `<link href="https://fonts.googleapis.com/...">` tag in `<head>`. |
| **Launch date / puzzle number** | `LAUNCH_DATE` at the top of the `<script>` (puzzle No. 1 is that day). |
| **Round settings** | The `CONFIG` object right below it: lineup pool, difficulty per round, target ranges, fade times, countdown vanish point, roll timing, metronome error, BPM range, beat counts, fake-out modes, scoring windows. Pairs like `[3, 10]` mean `[easiest, hardest]`. |
| **Round names, instructions, tips** | `TYPES` object. Result comments are in `COMMENTS`. |
| **Leaderboard** | `SUPABASE_URL` and `SUPABASE_ANON_KEY` at the top of the script. Leave them empty to hide the leaderboard. Create the table with `supabase.sql`. |

## Leaderboard setup (optional)

1. Create a Supabase project.
2. Run `supabase.sql` in its SQL editor.
3. Paste the project URL and anon key into `SUPABASE_URL` / `SUPABASE_ANON_KEY`.
