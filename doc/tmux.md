# tmux: Fallback for SSH / Non-Supacode Environments

This doc covers tmux as a **fallback**, not the primary workflow. On a local machine, [Supacode](https://supacode.sh) already does everything tmux would do here — worktrees, tabs, surface splits, per-worktree run scripts, persistent sessions. Skip this doc unless you're on a machine where Supacode isn't available.

## When tmux still earns its keep

- **SSH / remote dev machines** — tmux session lives on the server; you can attach from any client and the work survives connection drops.
- **Terminal-only environments** — bare shells, minimal VMs, CI shells, Linux servers without a desktop.
- **Cross-restart persistence** — combined with `tmux-resurrect`, sessions can survive full system restarts.

If none of the above apply, ignore tmux entirely. Supacode is strictly more capable for the local case.

## The pattern (when you do need it)

One tmux session per git worktree, named after the branch. Sessions persist; you "attach" to see them, "detach" to leave them running.

```bash
# Create a session for a worktree
tmux new -s feature-x -d -c ~/Projects/myrepo-worktrees/feature-x

# Attach
tmux attach -t feature-x

# Already inside tmux — jump to another session
tmux switch -t main

# Detach without killing the session
# (default binding: Ctrl-b then d)
```

## The four commands that cover 95% of usage

| Command | What it does |
|---|---|
| `tmux ls` | List all running sessions |
| `tmux new -s <name>` | Create a session and attach to it |
| `tmux attach -t <name>` | Reattach to an existing session by name |
| `tmux switch -t <name>` | (Already inside tmux) Jump to a different session |

`Ctrl+b` is the **prefix** — every tmux key combo starts with it. `Ctrl+b` then `d` detaches.

## Bindings from this repo's `tmux.conf`

After the prefix (`Ctrl+b`):

| Keys | Action |
|---|---|
| `prefix W` | Prompt for a name, create a session at the current directory |
| `prefix S` | Visual session switcher (arrow keys, Enter) |
| `prefix d` | Detach from current session |
| `prefix ?` | Show every tmux binding (built-in cheat sheet) |

## Why not use tmux for splits

Even in the fallback case, you typically don't want tmux for splits — your terminal emulator (Ghostty, iTerm, Alacritty + tabs) already handles that, and learning two split systems is friction. tmux earns its slot here for **session persistence**, not visual layout.

## Don't run tmux inside Supacode

Nesting tmux inside a Supacode surface buys nothing and creates keystroke conflicts (tmux prefix vs Supacode shortcuts). Supacode's tabs and surfaces already give you what tmux's windows and panes give you, with native UI.
