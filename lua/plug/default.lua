vim.pack.add({
  'https://github.com/folke/todo-comments.nvim',
})
require('todo-comments').setup()


vim.pack.add({
  'https://github.com/nvim-mini/mini.icons',
})
require('mini.icons').setup()



vim.pack.add({
  'https://github.com/stevearc/oil.nvim',
})
require('oil').setup({
  watch_for_changes = true,
})
vim.keymap.set('n', '<leader>cd', '<cmd>Oil<CR>')



vim.pack.add({'https://github.com/windwp/nvim-autopairs'})
require('nvim-autopairs').setup({
  check_ts = true,
})
