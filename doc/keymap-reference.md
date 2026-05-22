# Keymap Reference

This config is tuned for the [Baseform 36-key Miryoku Colemak-DH layout](https://github.com/idvd20/baseform36/tree/main/config/miryoku-colemakdh). See the source repo for full layer visualizations.

## Layers at a glance

| Layer | Activator | Purpose |
|---|---|---|
| BASE | (always active) | letters + home row mods |
| NAV | hold right thumb (SPC) | arrows, page nav, Cmd combos |
| **DEV** | hold right inner thumb (TAB) | **nvim save/quit/hunk/window/jumplist** |
| SYM | hold left middle thumb (RET) | `:` `;` `{ } [ ]` `* %` |
| NUM | hold left middle thumb (BSPC) | digits + brackets |
| MEDIA / FUN / MOUSE / BUTTON | various | volume, F-keys, BT — rare |

## DEV layer cheat-sheet (most-used)

Hold the right inner thumb (TAB), then tap one left-hand key:

| Key | Action | What nvim does |
|---|---|---|
| `A` (left pinky home) | `:w<CR>` | save file |
| `Z` (left pinky bottom) | `:q<CR>` | quit |
| `V` (left index inner bottom) | `]c` | jump to next changed hunk |
| `D` (left index bottom) | `[c` | jump to prev changed hunk |
| `R/S/T/G` (left home row middle keys) | `<C-w>` + `h/j/k/l` | window left/down/up/right |
| `X` (left ring bottom) | `<C-w>v` | vertical split |
| `C` (left middle bottom) | `<C-w>s` | horizontal split |
| `Q` (left pinky top) | `<C-o>` | jumplist back |
| `W` (left ring top) | `<C-i>` | jumplist forward |
| `F` (left middle top) | `[q` | prev quickfix |
| `P` (left index inner top) | `]q` | next quickfix |

## NAV layer (movement)

Hold right thumb (SPC), then tap on left hand:

| Key | Action |
|---|---|
| `R` | ← |
| `S` | ↓ |
| `T` | ↑ |
| `G` | → |
| `R` row top (W) | ⌘V (paste) |
| `S` row top (F) | ⌘C (copy) |
| (left bottom row) | HOME / PGDN / PGUP / END |
