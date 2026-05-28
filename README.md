# nvim-baseform36

Neovim configuration tuned for the [Baseform 36-key keyboard](https://github.com/idvd20/baseform36) running a Miryoku Colemak-DH layout with a custom DEV layer. Built for an agentic coding workflow: Claude Code does the writing, nvim does diff review + small edits, Supacode owns worktree + session orchestration. A minimal `tmux.conf` is included as a fallback for SSH / non-Supacode environments.

## What's in here

| File | Purpose |
|---|---|
| `init.lua` | kickstart.nvim-derived config |
| `lua/custom/plugins/*.lua` | added plugins (diffview, fugitive, autotag, lualine, bufferline) |
| `tmux.conf` | minimal tmux for SSH / non-Supacode environments (optional) |
| `doc/` | markdown docs (workflow, keymap reference, LSP, plugins) + `kickstart.txt` for `:help kickstart` |

## Install

Prerequisites: Neovim 0.10+, git, gh, fd, ripgrep, node.

```bash
brew install neovim git gh fd ripgrep node   # macOS

# Clone this repo
git clone https://github.com/idvd20/nvim-baseform36.git ~/Projects/nvim-baseform36

# Back up any existing nvim config
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null

# Symlink into nvim's expected path
ln -s ~/Projects/nvim-baseform36 ~/.config/nvim

# Launch nvim — vim.pack auto-installs plugins
nvim
```

Optional — only if you work on SSH / remote machines without Supacode:

```bash
brew install tmux                                            # macOS
ln -s ~/Projects/nvim-baseform36/tmux.conf ~/.tmux.conf
```

First launch installs ~12 plugins via Neovim's built-in `vim.pack`. Wait for completion, then run `:Mason` and wait for all LSPs and formatters to show `[Installed]`.

## Keyboard

This config assumes the [Baseform 36-key keymap (Miryoku Colemak-DH layer)](https://github.com/idvd20/baseform36/tree/main/config/miryoku-colemakdh) with the DEV layer (right inner thumb hold → left hand becomes nvim action keys).

See `doc/keymap-reference.md` for the chord cheat-sheet.

## Documentation

- [**Getting started**](doc/getting-started.md) — **start here if new to nvim**: modes, basic commands, daily cheatsheet
- [Workflow](doc/workflow.md) — the agentic-nvim cycle, end-to-end
- [Keymap reference](doc/keymap-reference.md) — which key triggers what
- [LSP setup](doc/lsp-setup.md) — Mason install + per-language details
- [Plugins](doc/plugins.md) — what each plugin does and why it earned its slot
- [Leader bindings](doc/leader-bindings.md) — `<leader>` cheat-sheet
- [tmux](doc/tmux.md) — fallback for SSH / non-Supacode environments (optional)

## License

MIT.
