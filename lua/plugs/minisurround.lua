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

