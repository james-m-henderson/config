-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
vim.opt.clipboard = "unnamedplus"

local function paste()
  return {
    vim.split(vim.fn.getreg(""), "\n"),
    vim.fn.getregtype(""),
  }
end

vim.g.clipboard = {
  name = "OSC 52",
  copy = {
    ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
    ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
  },
  paste = {
    ["+"] = paste,
    ["*"] = paste,
    --["+"] = require("vim.ui.clipboard.osc52").paste("+"),
    --["*"] = require("vim.ui.clipboard.osc52").paste("*"),
  },
}

vim.g.root_spec = { { ".git" }, "lsp", "cwd" }
