# tmux: Session-Per-Worktree

This config uses tmux **only for session persistence**, not for splits. supacode handles visual splits.

## Pattern

One tmux session per git worktree, named after the branch.

```bash
# Create a session for a worktree
tmux new -s feature-x -d -c ~/Projects/myrepo-worktrees/feature-x

# Switch to it
tmux switch -t feature-x

# Or use the bind: prefix + W to create with a prompt
# (defined in tmux.conf)
```

## Why

- **Persistence**: sessions survive supacode/terminal restart
- **Quick switching**: `tmux switch -t <branch>` is faster than navigating directories
- **Worktree alignment**: each branch's working state (cwd, env, open processes) is self-contained

## Why NOT also use tmux for splits

supacode (and most modern terminals) already handle splits with built-in shortcuts. Duplicating with tmux means learning two systems. Pick one — supacode — and let tmux focus on sessions.

## Bindings (from tmux.conf)

| Binding | Action |
|---|---|
| `prefix W` | create new worktree session with prompt |
| `prefix S` | session switcher |
| `prefix d` | detach (default) |

(`prefix` is `Ctrl-b` unless rebound.)
