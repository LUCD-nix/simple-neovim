vim.g.mapleader = ' '
vim.o.number = true
vim.o.relativenumber = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.cursorline = true
vim.o.tabstop = 4
vim.o.shiftwidth = 0
vim.o.signcolumn = 'auto:1-3'
vim.o.smartindent = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.completeopt = "menu,menuone,fuzzy,noinsert,popup"

vim.api.nvim_create_autocmd('UIEnter', {
  callback = function()
    vim.o.clipboard = 'unnamedplus'
  end,
})

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- Show <tab> and trailing spaces
vim.o.list = true

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s) See `:help 'confirm'`
vim.o.confirm = true

-- [[ Set up keymaps ]] See `:h vim.keymap.set()`, `:h mapping`, `:h keycodes`

-- Use <Esc> to exit terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- Map <A-j>, <A-k>, <A-h>, <A-l> to navigate between windows in any modes
vim.keymap.set({ 't', 'i' }, '<A-h>', '<C-\\><C-n><C-w>h')
vim.keymap.set({ 't', 'i' }, '<A-j>', '<C-\\><C-n><C-w>j')
vim.keymap.set({ 't', 'i' }, '<A-k>', '<C-\\><C-n><C-w>k')
vim.keymap.set({ 't', 'i' }, '<A-l>', '<C-\\><C-n><C-w>l')
vim.keymap.set({ 'n' }, '<A-h>', '<C-w>h')
vim.keymap.set({ 'n' }, '<A-j>', '<C-w>j')
vim.keymap.set({ 'n' }, '<A-k>', '<C-w>k')
vim.keymap.set({ 'n' }, '<A-l>', '<C-w>l')

-- See `:h lua-guide-autocommands`, `:h autocmd`, `:h nvim_create_autocmd()`
-- Highlight when yanking (copying) text.
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.cmd('packadd! nohlsearch')

vim.pack.add({ 'https://github.com/neovim/nvim-lspconfig' })

-- add neovim runtime to lua-language-server
-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/lua_ls.lua
-- without this there would be a "undefined global vim" error everywhere and no
-- access to signatures
vim.lsp.config('lua_ls', {
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if
        path ~= vim.fn.stdpath('config')
        and (vim.uv.fs_stat(path .. '/.luarc.json')
        or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
        then
          return
        end
      end

      client.config.settings.Lua = vim.tbl_deep_extend('force',
      client.config.settings.Lua, {
        runtime = {
          version = 'LuaJIT',
          path = {
            'lua/?.lua',
            'lua/?/init.lua',
          },
        },
        workspace = {
          checkThirdParty = false,
          library = {
            vim.env.VIMRUNTIME
          }
        }
      })
    end,
    settings = {
      Lua = {}
    }
})

vim.lsp.enable({ 'lua_ls', 'clangd' })

-- Colorscheme - also adds kanagawa-dragon and kanagawa-lotus
vim.pack.add({ 'https://github.com/rebelot/kanagawa.nvim' })
vim.cmd('colorscheme kanagawa')

-- Mini things
vim.pack.add({
  'https://github.com/nvim-mini/mini.ai',
})
-- defaults are good, just adding some objs and changing search
-- from next to nearest
require('mini.ai').setup({
  search_method = 'cover_or_nearest',
  n_lines = 30,
  -- see :h mini.ai
  custom_textobjects = {
    -- TODO consider fixing this, would be cool
    -- F = spec_treesitter({ a = '@function.outer', i = '@function.inner' }),
    -- o = spec_treesitter({
      --   a = { '@conditional.outer', '@loop.outer' },
      --   i = { '@conditional.inner', '@loop.inner' },
      -- }),
      -- Disable brackets alias in favor of builtin block textobject
      -- NOTE : might want to change later
      b = false,
      -- Whole buffer
      g = function()
        local from = { line = 1, col = 1 }
        local to = {
          line = vim.fn.line('$'),
          col = math.max(vim.fn.getline('$'):len(), 1)
        }
        return { from = from, to = to }
      end
    }
  })

  vim.pack.add({'https://github.com/nvim-mini/mini.surround'})
  -- :h MiniSurround.config for defaults
  require('mini.surround').setup({
    mappings = {
      -- all of these are defaults, pasted here to remind me
      add = 'sa', -- Add surrounding in Normal and Visual modes
      delete = 'sd', -- Delete surrounding
      find = 'sf', -- Find surrounding (to the right)
      find_left = 'sF', -- Find surrounding (to the left)
      highlight = 'sh', -- Highlight surrounding
      replace = 'sr', -- Replace surrounding
      suffix_next = 'n', -- Suffix to search with "next" method

      -- except this one, making it closer to vim defaults
      suffix_last = 'N', -- Suffix to search with "prev" method

    },
    -- place surroundings on each line in vis-block mode
    respect_selection_type = true,
  })

  -- Highlights TODO FIX/BUG/FIXME HACK NOTE ETC
  vim.pack.add({'https://github.com/folke/todo-comments.nvim'})
  require('todo-comments').setup()

  -- Icons for Oil and friends
  vim.pack.add({'https://github.com/nvim-mini/mini.icons'})
  require('mini.icons').setup()

  vim.pack.add({'https://github.com/stevearc/oil.nvim'})
  require('oil').setup({
    watch_for_changes = true,
  })
  vim.keymap.set('n', '<leader>cd', '<cmd>Oil<CR>')


  vim.pack.add({{
    src = 'https://github.com/saghen/blink.cmp',
	-- this is to have the rust builtin fuzzy
    version = vim.version.range('*')
  }})

  require('blink.cmp').setup({
    -- Disable cmdline
    cmdline = { enabled = false },
    fuzzy = { implementation = 'prefer_rust' },
    completion = {
      keyword = { range = 'full' },
      accept = { auto_brackets = { enabled = true }, },
      list = { selection = { preselect = false, auto_insert = true } },
      menu = {
        auto_show = true,
        draw = {
          columns = {
            { "kind_icon" , gap = 1},
            { "label", "label_description" }
          },
        }
      },
      -- Show documentation when selecting a completion item
      documentation = { auto_show = true, auto_show_delay_ms = 500 },
      -- Display a preview of the selected item on the current line
      ghost_text = { enabled = true },
    },
    sources = {
      -- Remove 'buffer' if you don't want text completions, by default it's only enabled when LSP returns no items
      default = { 'lsp', 'path', 'buffer' },
    },
    -- Experimental signature help support
    signature = { enabled = true }
  }
)
