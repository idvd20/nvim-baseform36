-- oil.nvim: edit the filesystem like a buffer
-- Better than netrw for keyboard-only file management.

vim.pack.add { 'https://github.com/stevearc/oil.nvim' }

require('oil').setup {
  default_file_explorer = true,
  view_options = { show_hidden = true },
}

-- Leader binding + classic `-` to open parent dir
vim.keymap.set('n', '<leader>e', '<cmd>Oil<cr>', { desc = 'File [E]xplorer (oil)' })
vim.keymap.set('n', '-', '<cmd>Oil<cr>', { desc = 'Open parent dir in oil' })
