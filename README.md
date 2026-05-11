# nvim-baseform36

Neovim + tmux configuration tuned for the [Baseform 36-key keyboard](https://github.com/idvd20/baseform36) running a Miryoku Colemak-DH layout with a custom DEV layer. Built for an agentic coding workflow: Claude Code does the writing, nvim does diff review + small edits, supacode + git worktrees for parallel branches.

## What's in here

| File | Purpose |
|---|---|
| `init.lua` | kickstart.nvim-derived config |
| `lua/custom/plugins/*.lua` | added plugins (diffview, fugitive, autotag, oil) |
| `tmux.conf` | minimal tmux for session-per-worktree |
| `docs/` | workflow, keymap reference, LSP setup, plugin rationale |

## Install

Prerequisites: Neovim 0.10+, git, gh, tmux 3+, fd, ripgrep, node.

```bash
brew install neovim git gh tmux fd ripgrep node   # macOS

# Clone this repo
git clone https://github.com/idvd20/nvim-baseform36.git ~/Projects/nvim-baseform36

# Back up any existing nvim config
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null

# Symlink into nvim's expected path
ln -s ~/Projects/nvim-baseform36 ~/.config/nvim

# Symlink tmux config
ln -s ~/Projects/nvim-baseform36/tmux.conf ~/.tmux.conf

# Launch nvim — vim.pack auto-installs plugins
nvim
```

First launch installs ~12 plugins via Neovim's built-in `vim.pack`. Wait for completion, then run `:Mason` and wait for all LSPs and formatters to show `[Installed]`.

## Keyboard

This config assumes the [Baseform 36-key keymap](https://github.com/idvd20/baseform36/tree/main/docs/keymap) with the DEV layer (right inner thumb hold → left hand becomes nvim action keys).

See `docs/keymap-reference.md` for the chord cheat-sheet.

## Documentation

- [**Getting started**](docs/getting-started.md) — **start here if new to nvim**: modes, basic commands, daily cheatsheet
- [Workflow](docs/workflow.md) — the agentic-nvim cycle, end-to-end
- [Keymap reference](docs/keymap-reference.md) — which key triggers what
- [LSP setup](docs/lsp-setup.md) — Mason install + per-language details
- [Plugins](docs/plugins.md) — what each plugin does and why it earned its slot
- [Leader bindings](docs/leader-bindings.md) — `<leader>` cheat-sheet
- [tmux](docs/tmux.md) — session-per-worktree pattern

## License

MIT.
