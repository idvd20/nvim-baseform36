# Leader Bindings

`<leader>` is `<Space>` (right thumb tap). Tap leader, then a letter or two, and nvim runs the command. The which-key plugin will show you the menu after pressing leader.

## Telescope (search) — `<leader>s*`

Mnemonic: **S** for **S**earch. The whole search family lives under `<leader>s`.

| Sequence | Action | Source |
|---|---|---|
| `<leader>sf` | [S]earch [F]iles (fuzzy find) | kickstart |
| `<leader>sg` | [S]earch by [G]rep (live grep across repo) | kickstart |
| `<leader>sw` | [S]earch current [W]ord under cursor | kickstart |
| `<leader>sh` | [S]earch [H]elp | kickstart |
| `<leader>sk` | [S]earch [K]eymaps | kickstart |
| `<leader>sd` | [S]earch [D]iagnostics | kickstart |
| `<leader>sr` | [S]earch [R]esume last search | kickstart |
| `<leader>s.` | [S]earch recent files (".") | kickstart |
| `<leader>sc` | [S]earch [C]ommands | kickstart |
| `<leader>sn` | [S]earch [N]eovim config files | kickstart |
| `<leader>s/` | [S]earch in open files | kickstart |
| `<leader>ss` | [S]earch [S]elect Telescope (pick-a-picker) | kickstart |
| `<leader><leader>` | List open buffers (literally space twice) | kickstart |
| `<leader>/` | Fuzzy search inside current buffer | kickstart |

## Editing / format / quickfix

| Sequence | Action | Source |
|---|---|---|
| `<leader>f` | Format current buffer (conform.nvim) | kickstart |
| `<leader>q` | Open diagnostic [Q]uickfix list | kickstart |

## Toggles — `<leader>t*`

| Sequence | Action | Source |
|---|---|---|
| `<leader>th` | [T]oggle inlay [H]ints | kickstart |
| `<leader>tb` | [T]oggle inline git [B]lame on all lines | gitsigns |
| `<leader>tw` | [T]oggle intra-line [W]ord diff highlighting | gitsigns |

## Git — high-level views (`<leader>g*`)

Custom bindings for diffview and fugitive.

| Sequence | Action | Source |
|---|---|---|
| `<leader>gd` | [G]it [D]iffview (open) | this config |
| `<leader>gD` | [G]it [D]iffview close | this config |
| `<leader>gh` | [G]it file [H]istory (diffview) | this config |
| `<leader>gs` | [G]it [S]tatus (fugitive) | this config |
| `<leader>gb` | [G]it [B]lame (fugitive — full buffer) | this config |
| `<leader>gl` | [G]it [L]og --oneline | this config |

## Git — hunk operations (`<leader>h*`)

These work in any file with gitsigns gutter marks (`+`, `~`, `_`). They act on the current hunk under your cursor.

> **`<leader>gb` vs `<leader>hb`** — both involve blame, but do different things. `<leader>gb` (fugitive) opens a navigable full-file blame buffer for exploration. `<leader>hb` (gitsigns) is a single-line popup for a quick "who wrote this line?" check.

| Sequence | Action | Source |
|---|---|---|
| `<leader>hs` | [s]tage hunk (preps for commit) | gitsigns |
| `<leader>hr` | [r]eset hunk (discard local change) | gitsigns |
| `<leader>hp` | [p]review hunk (inline popup) | gitsigns |
| `<leader>hi` | preview hunk [i]nline (alt rendering) | gitsigns |
| `<leader>hb` | [b]lame line (full info popup) | gitsigns |
| `<leader>hd` | [d]iff against index | gitsigns |
| `<leader>hD` | [D]iff against last commit | gitsigns |
| `<leader>hS` | [S]tage whole buffer | gitsigns |
| `<leader>hR` | [R]eset whole buffer | gitsigns |
| `<leader>hq` | git hunks [q]uickfix (current file) | gitsigns |
| `<leader>hQ` | git hunks [Q]uickfix (whole repo) | gitsigns |
| `<leader>hs` (visual) | [s]tage selected lines | gitsigns |
| `<leader>hr` (visual) | [r]eset selected lines | gitsigns |

## File explorer

| Sequence | Action | Source |
|---|---|---|
| `<leader>e` | File [E]xplorer (oil.nvim — editable buffer) | this config |
| `-` | Open parent directory in oil | this config |
| `<leader>r` | Neo-tree [r]eveal current file in right sidebar | this config |

## Non-leader keys worth knowing

These aren't leader bindings, but they're closely related to the workflow:

| Key | Action | Source |
|---|---|---|
| `\` (normal mode) | Toggle neo-tree sidebar (right side) | this config |
| `Shift+l` (normal) | Next buffer (bufferline cycle) | this config |
| `Shift+h` (normal) | Previous buffer (bufferline cycle) | this config |
| `]c` (normal mode) | Jump to next git hunk | gitsigns |
| `[c` (normal mode) | Jump to previous git hunk | gitsigns |
| `ih` (text object) | "inside hunk" — use with `v`/`d`/`y`/`c` | gitsigns |
| `<C-^>` | Toggle to alternate buffer (last two files) | nvim built-in |

## Discovery

After tapping `<Space>`, wait ~250ms. **which-key** pops up a menu showing every available next-key with a description. You don't need to memorize anything upfront — let which-key teach you.

You can also search for bindings interactively: `<leader>sk` opens telescope's keymap picker — fuzzy-find any binding by description.
