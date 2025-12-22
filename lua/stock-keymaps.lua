-- Map <A-j>, <A-k>, <A-h>, <A-l> to navigate between windows in any modes
vim.keymap.set({ 't', 'i' }, '<A-h>', '<C-\\><C-n><C-w>h')
vim.keymap.set({ 't', 'i' }, '<A-j>', '<C-\\><C-n><C-w>j')
vim.keymap.set({ 't', 'i' }, '<A-k>', '<C-\\><C-n><C-w>k')
vim.keymap.set({ 't', 'i' }, '<A-l>', '<C-\\><C-n><C-w>l')
vim.keymap.set({ 'n' }, '<A-h>', '<C-w>h')
vim.keymap.set({ 'n' }, '<A-j>', '<C-w>j')
vim.keymap.set({ 'n' }, '<A-k>', '<C-w>k')
vim.keymap.set({ 'n' }, '<A-l>', '<C-w>l')

-- Use <Esc> to exit terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- Quick terminal split
vim.keymap.set('n', '<leader>th', '<cmd>horizontal terminal<CR>')
vim.keymap.set('n', '<leader>tb', '<cmd>tab terminal<CR>')
vim.keymap.set('n', '<leader>tv', '<cmd>vertical terminal<CR>')

-- quick save
vim.keymap.set('n', '<leader>w', "<cmd>write<CR>")

-- Move selection in visual mode
vim.keymap.set('x', '<C-k>', ":m '<-2<CR>gv=gv", {remap = false})
vim.keymap.set('x', '<C-j>', ":m '>+1<CR>gv=gv", {remap = false})
