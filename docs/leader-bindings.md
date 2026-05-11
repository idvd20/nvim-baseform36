# Leader Bindings

`<leader>` is `<Space>` (right thumb tap). Tap leader, then a letter or two, and nvim runs the command. The which-key plugin will show you the menu after pressing leader.

## All custom leader bindings

| Sequence | Action | Source |
|---|---|---|
| `<leader>ff` | find files (telescope) | kickstart |
| `<leader>fg` | live grep | kickstart |
| `<leader>fb` | buffers | kickstart |
| `<leader>fh` | help tags | kickstart |
| `<leader>fr` | recent files | kickstart |
| `<leader>gd` | open diffview | this config |
| `<leader>gD` | close diffview | this config |
| `<leader>gh` | file history (diffview) | this config |
| `<leader>gs` | git status (fugitive) | this config |
| `<leader>gb` | git blame | this config |
| `<leader>gl` | git log --oneline | this config |
| `<leader>e` | file explorer (oil) | this config |

## Discovery

After tapping `<Space>`, wait ~250ms. which-key pops up a menu showing every available next-key with a description. You don't need to memorize anything upfront.
