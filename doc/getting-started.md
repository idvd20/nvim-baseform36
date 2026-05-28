# Getting Started With nvim (Beginner)

You just installed everything. Now what? This doc walks you through the absolute basics, paired with your Baseform 36 keymap.

## What you have installed (the IDE bits)

The config is kickstart.nvim plus a curated set of additions. The pieces that make it feel like an IDE:

| Plugin | What it does |
|---|---|
| **neo-tree** | File tree on the **right** side. Toggle with `\`. Reveal the current file in the tree with `<leader>r`. |
| **bufferline** | Tab strip at the top showing open buffers. `Shift+l` next, `Shift+h` previous. |
| **lualine** | Rich statusline at the bottom: mode, git branch + diff stats, LSP diagnostics, file path, line/col. |
| **treesitter** | Syntax-aware highlighting and indentation for every language you open. |
| **LSP (mason + nvim-lspconfig)** | Completions, hover docs, go-to-definition, diagnostics. TS, PHP, Tailwind, CSS, HTML, JSON, Lua are pre-installed. |
| **indent_line** | Vertical guides showing nesting depth. |
| **autopairs** | Auto-closes `()`, `{}`, `[]`, `""`. |
| **gitsigns** | Gutter markers (`+`, `~`, `_`) for git hunks + `<leader>h*` hunk operations. |
| **diffview** | Side-by-side git diff UI. `<leader>gd` to open, `<leader>gD` to close. |
| **fugitive** | `:G status`, `:G blame`, `:G log` — vim-native git. |
| **telescope** | Fuzzy finder for everything: files (`<leader>sf`), grep (`<leader>sg`), buffers, help, keymaps. |
| **which-key** | Tap `<Space>` and wait 250ms — a popup shows every available next key. |
| **tokyonight** | Colorscheme (night variant). |

For the full plugin rationale and what's deliberately *not* installed, see [plugins.md](plugins.md). For every keybinding, see [leader-bindings.md](leader-bindings.md).

## Verify everything loaded (run once after install or after big config changes)

First-launch caveat: `vim.pack` downloads any new plugins on startup. The first time you open nvim after enabling neo-tree/lualine/bufferline you'll see "Cloning..." messages — let them finish, then quit and reopen.

### 1. Run the built-in health check

```vim
:checkhealth
```

This walks every plugin and reports `OK` / `WARN` / `ERROR`. Things you can safely ignore:

- `WARN: have_nerd_font is set to false` — only a problem if you want icons. To fix: install a Nerd Font, set your terminal font to it, then flip `vim.g.have_nerd_font` to `true` in `init.lua:102`.
- `WARN: ... is not installed` for languages you don't use.

Things to actually fix:

- `ERROR` lines — read the message; usually a missing system binary.
- `mason: ... not executable` — open `:Mason` and press `i` on the highlighted tool to install it.

### 2. Eyeball each plugin

| Plugin | How to verify |
|---|---|
| **lualine** | Bottom of the screen is one line showing mode (NORMAL / INSERT / …), branch name, file path. If you see kickstart's plain mini.statusline instead, lualine didn't load. |
| **bufferline** | Open two files: `:e init.lua` then `:e README.md`. A tab strip appears at the top with both filenames. |
| **neo-tree** | Press `\`. A sidebar opens on the **right** showing the file tree. Press `\` again — it closes. Try `<leader>r` (Space then `r`) inside a file — tree opens with cursor on that file. |
| **indent_line** | Open any nested file (e.g. `init.lua`). Faint vertical lines run down through indented blocks. |
| **autopairs** | In insert mode, type `(` — a `)` appears automatically and the cursor sits between them. |
| **treesitter** | Open a TS/PHP/Lua file. Keywords, strings, function names are colorized (not just monochrome white). `:Inspect` on a token shows the treesitter capture. |
| **LSP** | Open a TS file with an obvious error (`const x: string = 1`). After ~1 second a diagnostic underline appears under `1`. `:LspInfo` lists attached servers. |

### 3. If something is missing

- Plugin didn't download: quit nvim, reopen, watch for errors during startup. Check `:messages` after launch.
- LSP didn't attach: run `:Mason` — if the tool isn't installed, press `i` on its row. After install, reopen the file.
- Keymap doesn't work: `:verbose nmap \` shows what `\` is currently bound to; `<leader>sk` opens telescope's keymap picker for fuzzy search.

## The one concept that unlocks everything: modes

nvim has **modes**. The key you press does different things depending on which mode you're in.

| Mode             | What keys do                    | How to enter                                          |
| ---------------- | ------------------------------- | ----------------------------------------------------- |
| **Normal**       | Commands (move, delete, copy)   | This is the default. Press `Esc` from any other mode. |
| **Insert**       | Type letters into the file      | Press `i` in normal mode                              |
| **Visual**       | Select text                     | Press `v` in normal mode                              |
| **Command-line** | Run ex commands like `:w`, `:q` | Press `:` in normal mode                              |

**Forgot which mode you're in?** Press `Esc`. You're back to normal. From normal you can always get to any other mode.

## Open and read a file

```bash
nvim path/to/file.tsx
```

You land in normal mode. To scroll:

- **Hold the right thumb (SPC)** and tap arrow keys on your left hand (`R/S/T/G` = ←↓↑→)
- Or hold right thumb + tap PGDN/PGUP on left bottom row for page-by-page

## Find a file in your project

Tap `Space` (right thumb tap — your leader key). Wait ~250ms. **which-key** pops up showing you what's available. Then:

| Sequence        | What it does                                          |
| --------------- | ----------------------------------------------------- |
| `Space` `s` `f` | **[S]earch [F]iles** — fuzzy find by name (telescope) |
| `Space` `s` `g` | **[S]earch by [G]rep** — search file contents         |
| `Space` `s` `.` | Recent files                                          |
| `Space` `Space` | List open buffers (literally space twice)             |
| `Space` `s` `h` | Search nvim help                                      |
| `Space` `s` `w` | Search current word under cursor                      |
| `Space` `/`     | Fuzzy-search inside the current buffer                |

Inside the picker: type to filter. Arrow keys to highlight. `Enter` to open. `Esc` to cancel.

**Memory tip:** in this kickstart variant, search lives under `<leader>s*` (think "**S**earch"). `<leader>f` alone is bound to format the current file (conform.nvim).

## Read a git diff

```bash
cd ~/Projects/some-repo
nvim
```

Then `Space` `g` `d` — **diffview** opens a three-panel view:

```
┌────────────┬─────────────┬─────────────┐
│ File panel │ HEAD (left) │ Working tree│
│ (sidebar)  │ — original  │ — changed   │
└────────────┴─────────────┴─────────────┘
```

**Navigating the three panels:**

| Key                                 | Action                                                             |
| ----------------------------------- | ------------------------------------------------------------------ |
| `Ctrl+w` then `h`                   | Jump to left panel (file list, then HEAD)                          |
| `Ctrl+w` then `l`                   | Jump to right panel (working tree)                                 |
| `Ctrl+w` `w`                        | Cycle to next panel                                                |
| `:DiffviewToggleFiles` then `Enter` | Hide/show the file sidebar — **use this if panels look too small** |

**Inside the file sidebar:**

- Arrow keys (NAV layer) up/down through files
- `Enter` to open the highlighted file
- `Tab` / `Shift+Tab` next/previous file

**Inside the diff buffers (middle/right) — hunk-by-hunk review:**

- `]c` jump to **next** changed hunk (cursor must be in a diff buffer, not the sidebar)
- `[c` jump to **previous** hunk
- Arrows (NAV layer) for line-by-line scroll, PGDN/PGUP for page

**Close diffview:**

- Tap `Space` `g` `D` (capital D), or
- Type `:DiffviewClose<Enter>`

**Once your DEV-layer firmware is flashed:**

- Hold right inner thumb (TAB → DEV layer) + tap left index inner bottom (`V` position) → next hunk
- Hold TAB + tap left index bottom (`D` position) → previous hunk

(Same `]c`/`[c` commands, just chorded instead of typed.)

## Stage / preview / blame a hunk

In any file with git changes (gitsigns shows `+`, `~`, `_` in the gutter), navigate your cursor to the hunk first (`]c` to get there), then:

| Key          | Action                                                 |
| ------------ | ------------------------------------------------------ |
| `<leader>hs` | [s]tage hunk (preps for commit)                        |
| `<leader>hr` | [r]eset hunk (discard local change)                    |
| `<leader>hp` | [p]review hunk in a popup                              |
| `<leader>hb` | [b]lame line (full info popup)                         |
| `<leader>tb` | [t]oggle inline [b]lame for every line                 |
| `vih`        | Visual-select the current hunk (use with `y`/`d`/etc.) |

## Edit a file

1. In normal mode, position cursor (arrows on NAV layer or `f<char>` to jump to a character)
2. Press `i` → you're in **insert** mode. Type normally.
3. When done editing, press `Esc` (your right pinky thumb tap) → back to normal
4. **Save:** hold TAB (DEV layer) + tap left pinky home (`A` position) — fires `:w<CR>`. File saved.

## Quit

- `:q` (type `:`, then `q`, then `Enter`) — quit if no unsaved changes
- `:wq` — save and quit
- `:q!` — quit without saving
- Or DEV-layer shortcut: hold TAB + tap left pinky bottom (`Z` position) → `:q<CR>`

## The cheatsheet you'll actually use

### Movement (normal mode)

- **Within line:** arrows (NAV layer), or `w` next word, `b` previous word, `0` line start, `$` line end
- **Within file:** `gg` top of file, `G` bottom, `:42<Enter>` jump to line 42
- **Find char:** `f<char>` jumps forward to next instance of `<char>` on current line

### Edit (normal mode)

- `i` insert before cursor
- `a` insert after cursor
- `o` open new line below
- `O` open new line above
- `dd` delete current line
- `yy` copy (yank) current line
- `p` paste below cursor
- `u` undo
- `Ctrl+r` redo

### Visual selection

- `v` start visual mode → move with arrows → `y` to copy, `d` to delete
- `V` line-wise visual (whole lines)
- `Ctrl+v` block visual (columns)
- After selecting → chord `A+C` on home row (your Cmd+C combo) → goes to macOS clipboard

### Search

- `/text<Enter>` search forward for `text`
- `n` next match, `N` previous match
- `*` search for word under cursor

### Plugins

| Shortcut        | Plugin     | Action                                |
| --------------- | ---------- | ------------------------------------- |
| `Space` `g` `d` | diffview   | side-by-side git diff                 |
| `Space` `g` `D` | diffview   | close diff                            |
| `Space` `g` `h` | diffview   | file history                          |
| `Space` `g` `s` | fugitive   | git status                            |
| `Space` `g` `b` | fugitive   | git blame                             |
| `Space` `g` `l` | fugitive   | git log                               |
| `\`             | neo-tree   | toggle right-side file tree           |
| `Space` `r`     | neo-tree   | reveal current file in tree           |
| `Shift+l`       | bufferline | next buffer                           |
| `Shift+h`       | bufferline | previous buffer                       |

### DEV-layer shortcuts (hold right inner TAB thumb + left hand)

| Position                            | Sends               | Action                |
| ----------------------------------- | ------------------- | --------------------- |
| `A` (left pinky home)               | `:w<CR>`            | save                  |
| `Z` (left pinky bottom)             | `:q<CR>`            | quit                  |
| `R/S/T/G` (left home row middle)    | `<C-w>` + `h/j/k/l` | move between windows  |
| `X` / `C` (left bottom row mid)     | `<C-w>v` / `<C-w>s` | split window          |
| `D` / `V` (left bottom right-half)  | `[c` / `]c`         | prev/next diff hunk   |
| `Q` / `W` (left top row pinky/ring) | `<C-o>` / `<C-i>`   | jumplist back/forward |

## First-day exercise

Try this end-to-end:

1. `cd ~/Projects/baseform36 && nvim`
2. Tap `Space` `s` `f`, type `keymap`, hit Enter. Should open `config/miryoku-colemakdh/baseform.keymap`.
3. Hold right thumb (SPC) + tap arrows on left hand. Cursor moves.
4. Tap `/`, type `dev_layer`, hit Enter. Cursor jumps to the layer.
5. Hold TAB + tap left pinky `A`. Should fire `:w<CR>` (nothing visible since no changes — that's expected).
6. Type `:q<Enter>` to quit.

If all six work, your setup is functional. From here it's just practice.

## tmux (optional)

Supacode owns worktree creation, tabs, surface splits, per-worktree run scripts, and session persistence — so locally you don't need tmux. If you work on an SSH / remote machine where Supacode isn't available, see [tmux.md](tmux.md) for the session-per-worktree fallback.

## When you get stuck

- **Frozen / weird state:** mash `Esc` until you're in normal mode
- **Want to discover commands:** tap `Space` and wait — which-key shows everything available
- **Want help on a command:** `:help <topic><Enter>` (e.g., `:help :w`)
- **Quit immediately, no save:** `:q!<Enter>`

## What to learn next

In rough order of payoff:

1. `f<char>` and `t<char>` — jump to characters within a line
2. Text objects: `ciw` (change inner word), `di"` (delete inside quotes), `va{` (select around braces)
3. `.` to repeat the last edit
4. `:%s/old/new/g` find-and-replace
5. Macros: `qa` to record, `q` to stop, `@a` to replay

Don't try to learn all of this at once. Pick one new thing per week.
