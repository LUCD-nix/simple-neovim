vim.pack.add({
  'https://github.com/neovim/nvim-lspconfig',
})
-- lua_ls is modified, see lsp folder
vim.lsp.enable({ 'lua_ls', 'clangd' })

 -- Go to definition
vim.keymap.set("n", "grd", "<cmd>lua vim.lsp.buf.definition()<CR>")
