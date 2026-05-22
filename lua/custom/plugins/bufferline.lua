-- bufferline.nvim: tab-like row at the top showing open buffers
-- Click a buffer or use :bnext / :bprev to switch. Pairs with neo-tree on the left.

vim.pack.add {
  'https://github.com/nvim-tree/nvim-web-devicons', -- harmless if already loaded
  'https://github.com/akinsho/bufferline.nvim',
}

require('bufferline').setup {
  options = {
    mode = 'buffers',
    diagnostics = 'nvim_lsp',
    show_buffer_close_icons = false,
    show_close_icon = false,
    offsets = {
      {
        filetype = 'neo-tree',
        text = 'File Explorer',
        highlight = 'Directory',
        separator = true,
      },
    },
  },
}

-- Quick buffer switching
vim.keymap.set('n', '<S-l>', '<cmd>BufferLineCycleNext<cr>', { desc = 'Next buffer' })
vim.keymap.set('n', '<S-h>', '<cmd>BufferLineCyclePrev<cr>', { desc = 'Previous buffer' })
