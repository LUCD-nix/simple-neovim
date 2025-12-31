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
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>')

-- Quick terminal split
vim.keymap.set('n', '<leader>t', '<cmd>terminal<CR>')
vim.keymap.set('n', '<leader>th', '<cmd>horizontal terminal<CR>')
vim.keymap.set('n', '<leader>tb', '<cmd>tab terminal<CR>')
vim.keymap.set('n', '<leader>tv', '<cmd>vertical terminal<CR>')

-- quick save
vim.keymap.set('n', '<leader>w', "<cmd>write<CR>")

-- Move selection in visual mode
vim.keymap.set('x', '<C-k>', ":m '<-2<CR>gv=gv", {remap = false})
vim.keymap.set('x', '<C-j>', ":m '>+1<CR>gv=gv", {remap = false})

-- resize windows
vim.keymap.set('n', '<C-H>', "<C-w><", {remap = false})
vim.keymap.set('n', '<C-J>', "<C-w>+", {remap = false})
vim.keymap.set('n', '<C-K>', "<C-w>-", {remap = false})
vim.keymap.set('n', '<C-L>', "<C-w>>", {remap = false})

-- Make commands, in the future should be filetype specific, for 42 it's fine
vim.keymap.set('n', '<leader>m', "<cmd>make<CR>")
vim.keymap.set('n', '<leader>mr', "<cmd>make re<CR>")
vim.keymap.set('n', '<leader>mx', "<cmd>make run<CR>")
vim.keymap.set('n', '<leader>mc', "<cmd>make clean<CR>")
