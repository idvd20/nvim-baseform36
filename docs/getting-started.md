# Getting Started With nvim (Beginner)

You just installed everything. Now what? This doc walks you through the absolute basics, paired with your Baseform 36 keymap.

## The one concept that unlocks everything: modes

nvim has **modes**. The key you press does different things depending on which mode you're in.

| Mode | What keys do | How to enter |
|---|---|---|
| **Normal** | Commands (move, delete, copy) | This is the default. Press `Esc` from any other mode. |
| **Insert** | Type letters into the file | Press `i` in normal mode |
| **Visual** | Select text | Press `v` in normal mode |
| **Command-line** | Run ex commands like `:w`, `:q` | Press `:` in normal mode |

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

| Sequence | What it does |
|---|---|
| `Space` `s` `f` | **[S]earch [F]iles** — fuzzy find by name (telescope) |
| `Space` `s` `g` | **[S]earch by [G]rep** — search file contents |
| `Space` `s` `.` | Recent files |
| `Space` `Space` | List open buffers (literally space twice) |
| `Space` `s` `h` | Search nvim help |
| `Space` `s` `w` | Search current word under cursor |
| `Space` `/` | Fuzzy-search inside the current buffer |

Inside the picker: type to filter. Arrow keys to highlight. `Enter` to open. `Esc` to cancel.

**Memory tip:** in this kickstart variant, search lives under `<leader>s*` (think "**S**earch"). `<leader>f` alone is bound to format the current file (conform.nvim).

## Read a git diff

```bash
cd ~/Projects/some-repo
nvim
```

Then `Space` `g` `d` — **diffview** opens a side-by-side view of all uncommitted changes with a file tree on the left.

In diffview:
- Arrow keys (NAV layer) to navigate
- `Tab` to switch between left/right panes
- `q` to close
- Or `Space` `g` `D` to close

Want to walk diff hunks one at a time?
- Hold right inner thumb (TAB → DEV layer) + tap left index inner bottom (`V` position) → next hunk
- Hold TAB + tap left index bottom (`D` position) → previous hunk

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

| Shortcut | Plugin | Action |
|---|---|---|
| `Space` `g` `d` | diffview | side-by-side git diff |
| `Space` `g` `D` | diffview | close diff |
| `Space` `g` `h` | diffview | file history |
| `Space` `g` `s` | fugitive | git status |
| `Space` `g` `b` | fugitive | git blame |
| `Space` `g` `l` | fugitive | git log |
| `Space` `e` | oil | file explorer (edit FS like a buffer) |
| `-` | oil | open parent directory |

### DEV-layer shortcuts (hold right inner TAB thumb + left hand)

| Position | Sends | Action |
|---|---|---|
| `A` (left pinky home) | `:w<CR>` | save |
| `Z` (left pinky bottom) | `:q<CR>` | quit |
| `R/S/T/G` (left home row middle) | `<C-w>` + `h/j/k/l` | move between windows |
| `X` / `C` (left bottom row mid) | `<C-w>v` / `<C-w>s` | split window |
| `D` / `V` (left bottom right-half) | `[c` / `]c` | prev/next diff hunk |
| `Q` / `W` (left top row pinky/ring) | `<C-o>` / `<C-i>` | jumplist back/forward |

## First-day exercise

Try this end-to-end:

1. `cd ~/Projects/baseform36 && nvim`
2. Tap `Space` `s` `f`, type `keymap`, hit Enter. Should open `config/miryoku-colemakdh/baseform.keymap`.
3. Hold right thumb (SPC) + tap arrows on left hand. Cursor moves.
4. Tap `/`, type `dev_layer`, hit Enter. Cursor jumps to the layer.
5. Hold TAB + tap left pinky `A`. Should fire `:w<CR>` (nothing visible since no changes — that's expected).
6. Type `:q<Enter>` to quit.

If all six work, your setup is functional. From here it's just practice.

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
