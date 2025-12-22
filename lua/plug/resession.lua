vim.pack.add({
  'https://github.com/stevearc/resession.nvim',
})

local resession = require("resession")
resession.setup({
  autosave = {
    enabled = true,
    interval = 60,
    notify = false,
  },
})

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- Only load the session if nvim was started with no args and without reading from stdin
    if vim.fn.argc(-1) == 0 and not vim.g.using_stdin then
      -- Save these to a different directory, so our manual sessions don't get polluted
      resession.load(vim.fn.getcwd(), { dir = "session", silence_errors = true })
    end
  end,
  nested = true,
})


-- i might have cooked here
local function save_session_on_leave()
  if Is_git_repo() then
    resession.save(Get_git_root(), {notify = true, dir = 'session'})
  else
    -- TODO : maybe ask for confirmation if not in repo
    resession.save(vim.fn.getcwd(), {notify = true, dir = 'session'})
  end
end


vim.api.nvim_create_autocmd("DirChangedPre", {
  callback = save_session_on_leave
})

vim.api.nvim_create_autocmd("DirChanged", {
  callback = function ()
    resession.load(vim.fn.getcwd(), { dir = "session", silence_errors = true })
  end
})

resession.add_hook("pre_load", save_session_on_leave)

vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = save_session_on_leave
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
