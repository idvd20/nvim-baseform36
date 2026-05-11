# Plugins

Beyond what kickstart.nvim ships, this config adds four plugins. Every plugin has to justify its slot — no statusline themes, no debugging, no terminal-in-nvim.

## Added plugins

| Plugin | Why |
|---|---|
| **diffview.nvim** | Best-in-class git diff UX. `:DiffviewOpen` shows full diff with file tree, side-by-side. Core to the workflow — diff review is what nvim is *for* here. |
| **vim-fugitive** | `:G`, `:Gdiffsplit`, `:Gblame`, `:Git log` — the standard for git ops inside nvim. Pairs with diffview. |
| **nvim-ts-autotag** | Auto-closes JSX/TSX/HTML tags. Tiny but daily quality-of-life. |
| **oil.nvim** | Edit the filesystem like a buffer. Better than netrw or neo-tree for keyboard-only file management. |

## Plugins explicitly NOT added

| Plugin | Why not |
|---|---|
| LazyVim | Kickstart is enough; you own every line |
| vim-tmux-navigator | DEV layer covers `<C-w>hjkl` directly |
| flash.nvim / leap.nvim | NAV-layer arrows cover micro-movement |
| toggleterm.nvim | supacode panes do this better |
| neo-tree | oil.nvim is more keyboard-friendly |
| bufferline / lualine | mini.statusline from kickstart is sufficient |
| nvim-dap | not debugging in nvim |
| nvim-colorizer | revisit if Tailwind class soup becomes unreadable |

## Adding more

If you hit friction, add a single plugin file under `lua/custom/plugins/`. Each plugin lives in its own file. Restart nvim and the custom plugin loader picks it up automatically.
