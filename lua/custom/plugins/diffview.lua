-- diffview.nvim: side-by-side git diff viewer
-- Used heavily for reviewing Claude-written code.

vim.pack.add { 'https://github.com/sindrets/diffview.nvim' }

require('diffview').setup {}

-- Leader bindings
vim.keymap.set('n', '<leader>gd', '<cmd>DiffviewOpen<cr>', { desc = '[G]it [D]iff view' })
vim.keymap.set('n', '<leader>gD', '<cmd>DiffviewClose<cr>', { desc = '[G]it [D]iff close' })
vim.keymap.set('n', '<leader>gh', '<cmd>DiffviewFileHistory %<cr>', { desc = '[G]it file [H]istory' })
