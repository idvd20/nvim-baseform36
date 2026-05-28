# Plugins

This config extends kickstart.nvim. Some plugins are bundled with kickstart but disabled by default and turned on here; others are external additions in `lua/custom/plugins/`. Every plugin has to justify its slot.

## Kickstart-bundled, enabled

These ship with kickstart as `lua/kickstart/plugins/*.lua` and are switched on in `init.lua`.

| Plugin | Why |
|---|---|
| **neo-tree.nvim** | Right-side file tree for the "where am I in the project?" view. Toggled with `\`, reveal-current-file with `<leader>r`. Position: right (left side stays clear). |
| **mini.indent_line** | Vertical guides showing indentation depth. Makes nested JSX / deep configs readable at a glance. |
| **autopairs (nvim-autopairs)** | Auto-closes `()`, `{}`, `[]`, `""`. Tiny QoL. |
| **gitsigns.nvim** | Gutter marks for git hunks plus the `<leader>h*` hunk operations. See [leader-bindings.md](leader-bindings.md). |

## External additions (`lua/custom/plugins/`)

| Plugin | Why |
|---|---|
| **diffview.nvim** | Best-in-class git diff UX. `:DiffviewOpen` shows full diff with file tree, side-by-side. Core to the workflow — diff review is what nvim is *for* here. |
| **vim-fugitive** | `:G`, `:Gdiffsplit`, `:Gblame`, `:Git log` — the standard for git ops inside nvim. Pairs with diffview. |
| **nvim-ts-autotag** | Auto-closes JSX/TSX/HTML tags. Tiny but daily quality-of-life. |
| **lualine.nvim** | Statusline showing mode, branch, diff stats, diagnostics, file path, filetype, position. Replaces kickstart's `mini.statusline`. |
| **bufferline.nvim** | Tab-style row at the top showing open buffers, with LSP diagnostic dots. Cycle with `Shift+l` / `Shift+h`. Reserves a label slot above neo-tree. |

## Plugins explicitly NOT added

| Plugin | Why not |
|---|---|
| LazyVim | Kickstart is enough; you own every line |
| vim-tmux-navigator | DEV layer covers `<C-w>hjkl` directly |
| flash.nvim / leap.nvim | NAV-layer arrows cover micro-movement |
| toggleterm.nvim | supacode panes do this better |
| nvim-dap | not debugging in nvim |
| nvim-colorizer | revisit if Tailwind class soup becomes unreadable |
| harper-ls / ltex-ls | built-in `:set spell` is enough for prose |

## Adding more

If you hit friction, add a single plugin file under `lua/custom/plugins/`. Each plugin lives in its own file. Restart nvim and the custom plugin loader picks it up automatically.
