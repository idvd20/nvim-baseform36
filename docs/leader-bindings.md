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

## Editing — `<leader>f`, `<leader>q`, `<leader>t*`

| Sequence | Action | Source |
|---|---|---|
| `<leader>f` | Format current buffer (conform.nvim) | kickstart |
| `<leader>q` | Open diagnostic [Q]uickfix list | kickstart |
| `<leader>th` | [T]oggle Inlay [H]ints | kickstart |

## Git — `<leader>g*` (custom)

Custom bindings I added for diffview and fugitive:

| Sequence | Action | Source |
|---|---|---|
| `<leader>gd` | [G]it [D]iffview (open) | this config |
| `<leader>gD` | [G]it [D]iffview close | this config |
| `<leader>gh` | [G]it file [H]istory (diffview) | this config |
| `<leader>gs` | [G]it [S]tatus (fugitive) | this config |
| `<leader>gb` | [G]it [B]lame | this config |
| `<leader>gl` | [G]it [L]og --oneline | this config |

## File explorer

| Sequence | Action | Source |
|---|---|---|
| `<leader>e` | File [E]xplorer (oil.nvim) | this config |
| `-` | Open parent directory in oil | this config |

## Discovery

After tapping `<Space>`, wait ~250ms. **which-key** pops up a menu showing every available next-key with a description. You don't need to memorize anything upfront — let which-key teach you.

You can also search for bindings interactively: `<leader>sk` opens telescope's keymap picker — fuzzy-find any binding by description.
