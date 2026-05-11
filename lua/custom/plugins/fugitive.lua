-- vim-fugitive: git operations inside nvim
-- :Git, :Gdiffsplit, :Gblame, :Git log — all the git porcelain.

vim.pack.add { 'https://github.com/tpope/vim-fugitive' }

-- Leader bindings
vim.keymap.set('n', '<leader>gs', '<cmd>Git<cr>', { desc = '[G]it [S]tatus' })
vim.keymap.set('n', '<leader>gb', '<cmd>Git blame<cr>', { desc = '[G]it [B]lame' })
vim.keymap.set('n', '<leader>gl', '<cmd>Git log --oneline<cr>', { desc = '[G]it [L]og' })
