# The Agentic-nvim Workflow

This config is built for a specific workflow: Claude Code writes the code, nvim is for diff review + small edits + search, Supacode handles worktree orchestration, pane management, and per-branch session persistence. (tmux is only relevant on SSH / non-Supacode machines — see [tmux.md](tmux.md).)

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

Switch to another Supacode surface or tab. Run `git`, `gh pr create`, `linear issue ...`, or `npm run test:e2e -- --headed` — Supacode handles the visual switch.

### 6. Switch to the next worktree

In Supacode: `supacode worktree focus` or click the worktree in the sidebar — instant jump to the matching session with its own tabs, surfaces, and running scripts. Open nvim there, repeat from step 1.

(On SSH / non-Supacode environments, `tmux switch -t <branch-name>` is the equivalent.)

## Essential moves (Cursor → nvim)

Coming from Cursor / VS Code, these are the keys you reach for constantly. Cursor's IDE features are nearly all here — Cursor was running these same LSP requests under the hood. The trick is moving from menus + mouse to keys.

### Returning to your file after looking at a diff

The most common confusion when starting out: "I opened diffview, now how do I get back to editing?"

| You did this | Get back with |
|---|---|
| `<leader>gd` opened diffview side-by-side | `<leader>gD` (capital D) or `:DiffviewClose<CR>` — closes diffview, returns you to the file you were editing |
| `<leader>hp` opened a hunk preview popup | `Esc` or `q` — popup closes, cursor stays put |
| `<leader>hb` / `<leader>gb` opened a blame view | `:q` closes the blame buffer/window |
| You opened another file via telescope or `gd` | `<C-^>` toggles to the previous file (alternate buffer) |
| You jumped around with `grd`/`grr` | `<C-o>` walks back through the jumplist (DEV-layer `Q`); `<C-i>` walks forward (DEV `W`) |

When in doubt: `<leader><leader>` lists every open buffer — pick the one you want.

### Closing buffers, splits, and windows

`:q` quits a *window*. `:bd` closes a *buffer*. They feel similar but matter when you have splits open.

| Action | Command | Notes |
|---|---|---|
| Close current buffer, keep window/split | `:bd` | If buffer has unsaved changes, errors — use `:bd!` to discard |
| Force-close buffer, discard changes | `:bd!` | |
| Close current split/window | `:close` or `<C-w>q` | Buffer stays loaded in background |
| Close everything except current window | `<C-w>o` | "only" — collapses all other splits |
| Quit nvim entirely | `:qa` (all) or DEV `Z` (= `:q<CR>`) | `:qa!` to discard everything |
| Close a floating popup (hover, blame) | `q` or `Esc` | |

### Switching buffers (Cursor's tab bar)

| Cursor | nvim | Action |
|---|---|---|
| Cmd+P | `<leader>sf` | File picker |
| Cmd+Tab / Ctrl+Tab | `<C-^>` | Toggle last two files |
| Click next tab | `Shift+l` | Next buffer (bufferline cycle) |
| Click prev tab | `Shift+h` | Previous buffer |
| (no good equiv) | `<leader><leader>` | List + fuzzy-pick any open buffer |

### Navigating code — the LSP `g*` family

Cursor's F12, Shift+F12, hover, symbol search — all here, all keyboard-driven.

| Cursor | nvim | What it does |
|---|---|---|
| F12 / Cmd+click | `grd` | [G]oto [D]efinition |
| Shift+F12 | `grr` | [G]oto [R]eferences (telescope picker) |
| Cmd+F12 | `gri` | [G]oto [I]mplementation |
| — | `grt` | [G]oto [T]ype Definition |
| — | `grD` | [G]oto [D]eclaration |
| Hover info | `K` | Hover doc in floating popup. Press `K` again to focus it, then `q` to close. |
| Cmd+Shift+O | `gO` | Document symbols (functions/classes in current file) |
| Cmd+T | `gW` | Workspace symbols (across the project) |
| F8 / next problem | `]d` | Next diagnostic (auto-opens float) |
| Shift+F8 | `[d` | Previous diagnostic |
| Back / forward nav | `<C-o>` / `<C-i>` | Jumplist back/forward (DEV-layer `Q`/`W`) |

### Refactor moves

| Cursor | nvim | Action |
|---|---|---|
| F2 | `grn` | [R]e[n]ame symbol across files (LSP-aware) |
| Cmd+. | `gra` | Code [A]ction (quick fixes, auto-imports, refactors) |
| Shift+Alt+F | `<leader>f` | Format buffer (conform.nvim → prettierd / php-cs-fixer / stylua) |
| Cmd+/ on a line | `gcc` | Toggle line comment (nvim 0.10+ built-in) |
| Cmd+/ on selection | `gc` (in visual) | Toggle comment on selected range |

### Intra-file movement (after `grd` lands you in a big file)

Cursor relies on scroll + click. nvim wants you to jump.

- `gg` top of file · `G` bottom · `:42<CR>` jump to line 42
- `w` next word · `b` previous word · `e` end of word
- `f<char>` jump forward to next `<char>` on the line · `;` repeat · `,` reverse
- `%` jump to matching bracket / paren / brace
- `0` line start · `^` first non-blank · `$` line end
- `*` search forward for word under cursor · `n`/`N` next/prev match
- `Ctrl+u` / `Ctrl+d` half-page up/down (works alongside the NAV-layer PGUP/PGDN)

### Find and replace

| Action | Command |
|---|---|
| Find in file (forward) | `/pattern<CR>`, then `n`/`N` |
| Find in file (backward) | `?pattern<CR>` |
| Project-wide live grep | `<leader>sg` (telescope) |
| Replace in file | `:%s/old/new/g` |
| Replace with confirm | `:%s/old/new/gc` |
| Replace on current line only | `:s/old/new/g` |
| Replace inside visual selection | (select) `:s/old/new/g` |

### Multi-cursor — the nvim equivalent

nvim has no Cmd+D multi-cursor. The idiomatic replacements are usually faster:

- **Same edit at many spots in a file:** `*` to mark all matches → `cgn<new-text><Esc>` changes the first → `.` repeats on each next match (`n` to skip one).
- **Edit a column on consecutive lines:** `<C-v>` block-visual to select the column → `I<text><Esc>` inserts on every selected line (or `A` to append).
- **Rename a symbol everywhere:** `grn` — beats multi-cursor because it's LSP-aware and crosses files.

### Window / split management (reminder)

The DEV layer covers the chords (`X` = vsplit, `C` = hsplit, `R/S/T/G` = move focus). A few extras you'll want:

| Action | Command |
|---|---|
| Equalize all split sizes | `<C-w>=` |
| Maximize current split | `<C-w>_` (height) · `<C-w>|` (width) |
| Close all splits except current | `<C-w>o` |
| Swap two splits | `<C-w>r` |

## What you do NOT do

- Reach for the mouse (everything is keyboard)
- Type long commands (leader bindings cover the common ones)
- Memorize HJKL on Colemak-DH (NAV-layer arrows handle movement)
- Hand-write boilerplate (Claude does that)
