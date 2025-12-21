vim.pack.add({
  'https://github.com/neovim/nvim-lspconfig' ,
  'https://github.com/rebelot/kanagawa.nvim' ,
  'https://github.com/nvim-mini/mini.ai',
  'https://github.com/folke/todo-comments.nvim',
  'https://github.com/nvim-mini/mini.surround',
  'https://github.com/nvim-mini/mini.icons',
  'https://github.com/stevearc/oil.nvim',
  {
    -- needs version field to have binary fuzzy built in
    src = 'https://github.com/saghen/blink.cmp',
    version = vim.version.range('*')
  },
  "https://github.com/windwp/nvim-autopairs"
})

