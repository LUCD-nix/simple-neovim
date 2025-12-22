vim.pack.add({
  'https://github.com/stevearc/resession.nvim',
})

local resession = require("resession")
resession.setup({
  dir = "session",
  -- we dont want to save to session automatically
  autosave = {
    enabled = false,
  },
})



-- i might have cooked here
local function load_project_on_enter()
  if Is_git_repo() then
    resession.load(Get_git_root(), {notify = true, silence_errors = true, dir = "repos"})
  end
end

local function save_project_on_leave()
  if Is_git_repo() then
    resession.save(Get_git_root(), {notify = true, silence_errors = true, dir = "repos"})
  end
end

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc(-1) == 0 and not vim.g.using_stdin then
      load_project_on_enter()
    end
  end,
  nested = true,
})

vim.api.nvim_create_autocmd("DirChangedPre", {
  callback = save_project_on_leave
})

vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = save_project_on_leave
})

resession.add_hook("pre_load", save_project_on_leave)

vim.api.nvim_create_autocmd("DirChanged", {
  callback = load_project_on_enter
})


vim.api.nvim_create_autocmd('StdinReadPre', {
  callback = function()
    -- Store this for later
    vim.g.using_stdin = true
  end,
})

-- Resession does NOTHING automagically, so we have to set up some keymaps
vim.keymap.set("n", "<leader>ss", resession.save)
vim.keymap.set("n", "<leader>sl", resession.load)
vim.keymap.set("n", "<leader>sd", resession.delete)
