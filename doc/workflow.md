# The Agentic-nvim Workflow

This config is built for a specific workflow: Claude Code writes the code, nvim is for diff review + small edits + search, supacode + git worktrees handle pane management and parallel branches.

## The daily cycle

### 1. Open the file Claude wrote

Tap `Space` (leader), then `s` then `f` — telescope opens a fuzzy file finder. Type a partial filename, press Enter.

Alternative: `Space` `s` `g` — live grep across the repo. Type the text you remember, press Enter on the match.

(In this kickstart variant, telescope lives under `<leader>s*` — think "**S**earch". `<leader>f` alone is bound to format-on-demand.)

### 2. Review the diff hunk-by-hunk

Two layers of granularity:

- **By hunk** (changed block) — hold the right inner thumb (TAB → DEV layer), then tap `V` (next hunk) or `D` (prev hunk).
- **By line** — hold the right thumb (SPC → NAV layer), then tap arrow keys (`R/S/T/G` = ←↓↑→).
- **By page** — same NAV layer, tap PGDN/PGUP on bottom row.

For the full diff view: `Space` `g` `d` opens diffview.nvim side-by-side.

### 3. Pull a snippet to share with Claude

In normal mode, press `v` to enter visual mode. Extend selection with NAV-layer arrows. Then chord `A+C` on home row (the Cmd+C combo). The selected text is now in the macOS clipboard, ready to paste into Claude's prompt.

### 4. Quick edit + save

Press `i` to enter insert mode. Type the fix. Press `Esc` (right pinky thumb) to leave insert mode. Hold TAB (DEV layer) → tap `A` (left pinky) — `:w<CR>` fires, file saved.

### 5. Run a tool in another pane

Switch to a supacode pane running tmux. Run `git`, `gh pr create`, `linear issue ...`, or `npm run test:e2e -- --headed` — supacode handles the visual switch.

### 6. Switch to the next worktree

`tmux switch -t <branch-name>` — instant jump to the matching session. Open nvim there, repeat from step 1.

## What you do NOT do

- Reach for the mouse (everything is keyboard)
- Type long commands (leader bindings cover the common ones)
- Memorize HJKL on Colemak-DH (NAV-layer arrows handle movement)
- Hand-write boilerplate (Claude does that)
