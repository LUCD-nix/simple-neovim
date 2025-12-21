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
