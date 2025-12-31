vim.pack.add({
  'https://github.com/scottmckendry/pick-resession.nvim',
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/nvim-telescope/telescope.nvim'
})

local telescope = require('telescope')
local actions = require('telescope.actions')
telescope.setup({
  pickers = {
    buffers = {
      mappings = {
        i = {
          ["<c-d>"] = actions.delete_buffer + actions.move_to_top,
        }
      }
    }
  },
  extensions = {
    resession = {
      prompt_title = "Find Projects", -- telescope prompt title
      layout = nil, -- telescope picker layout, defaults to dropdown if not set
      dir = "repos", -- HACK : directory to search in
                     -- thus Telescope can only search in the repos
    },
  },
})

local function live_grep_from_project_git_root()
  local opts = {}
  if Is_git_repo() then
  opts = {
      cwd = Get_git_root(),
    }
  end
  require("telescope.builtin").live_grep(opts)
end

local function find_files_from_project_git_root()
  local opts = {}
  if Is_git_repo() then
  opts = {
      cwd = Get_git_root(),
    }
  end
  require("telescope.builtin").find_files(opts)
end

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff',
  find_files_from_project_git_root, { desc = 'Telescope find files' })

vim.keymap.set('n', '<leader>fg',
  live_grep_from_project_git_root, { desc = 'Telescope live grep' })

vim.keymap.set('n', '<leader>fp', telescope.extensions.resession.resession,
  { desc = 'Telescope resession repos' }
)
-- TODO : would be nice to have but there's <leader>sl as fallback
-- vim.keymap.set('n', '<leader>fs',
--   telescope.extensions.resession.resession, { desc = 'Telescope resession' })


vim.keymap.set('n', '<leader>fj',
  builtin.jumplist, { desc = 'Telescope jumplist' })

vim.keymap.set('n', '<leader>fb',
  builtin.buffers, { desc = 'Telescope buffers' })

vim.keymap.set('n', '<leader>fk',
  builtin.keymaps, { desc = 'Telescope keymaps' })

vim.keymap.set('n', '<leader>fh',
  builtin.help_tags, { desc = 'Telescope help tags' })

