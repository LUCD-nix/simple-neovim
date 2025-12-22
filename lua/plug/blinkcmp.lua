vim.pack.add({
  {
    -- needs version field to have binary fuzzy built in
    src = 'https://github.com/saghen/blink.cmp',
    version = vim.version.range('*')
  }
})


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
})
