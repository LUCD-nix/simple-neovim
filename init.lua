vim.g.mapleader = ' '
function Is_git_repo()
  vim.fn.system("git rev-parse --is-inside-work-tree")
  return vim.v.shell_error == 0
end
function Get_git_root()
  local dot_git_path = vim.fn.finddir(".git", ".;")
  return vim.fn.fnamemodify(dot_git_path, ":h")
end
require('colorscheme')
require('config')
require('stock-keymaps')
require('lsps')
require('plug.default')
require('plug.blinkcmp')
require('plug.miniai')
require('plug.minisurround')
require('plug.resession')
-- telescope here depends on resession, no touchy
require('plug.telescope')
require('plug.git-signs')
