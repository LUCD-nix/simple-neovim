vim.o.number = true
vim.o.relativenumber = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.cursorline = true
vim.o.tabstop = 4
vim.o.shiftwidth = 0
vim.o.signcolumn = 'yes:1'
vim.o.smartindent = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.completeopt = "menu,menuone,fuzzy,noinsert,popup"
vim.o.textwidth = 80
vim.o.colorcolumn = "+1"

vim.api.nvim_create_autocmd('UIEnter', {
  callback = function()
    vim.o.clipboard = 'unnamedplus'
  end,
})

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- Show <tab> and trailing spaces
vim.o.list = true
vim.o.listchars='tab:󰅂 ,trail:-'

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s) See `:help 'confirm'`
vim.o.confirm = true

-- [[ Set up keymaps ]] See `:h vim.keymap.set()`, `:h mapping`, `:h keycodes`

-- See `:h lua-guide-autocommands`, `:h autocmd`, `:h nvim_create_autocmd()`
-- Highlight when yanking (copying) text.
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.cmd('packadd! nohlsearch')


