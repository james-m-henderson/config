-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

--         map <silent><script><expr> <C-J> copilot#Accept("\<CR>")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

--let g:copilot_no_tab_map = v:true
map("n", "<M-r>", vim.lsp.buf.rename, { desc = "Rename symbol" })
map("n", "<Leader>a", "<Plug>(doge-generate)")

-- LSP extras
-- Organize imports
map("n", "<leader>ji", function()
  vim.lsp.buf.code_action({
    context = { only = { "source.organizeImports" } },
    apply = true,
  })
end, { desc = "Java: Organize Imports" })

-- Format current buffer (on demand)
map("n", "<leader>jf", function()
  vim.lsp.buf.format({ async = true })
end, { desc = "LSP: Format Buffer" })

-- Show all workspace symbols (search across project)
map("n", "<leader>jw", vim.lsp.buf.workspace_symbol, { desc = "LSP: Workspace Symbols" })

-- Show document symbols (outline for current file)
map("n", "<leader>jd", vim.lsp.buf.document_symbol, { desc = "LSP: Document Symbols" })

-- Go to type definition
map("n", "<leader>jt", vim.lsp.buf.type_definition, { desc = "LSP: Type Definition" })

-- Peek definition in a floating window
map("n", "<leader>jp", function()
  vim.lsp.buf.definition()
  vim.cmd("normal! zv") -- open folds at location
end, { desc = "LSP: Peek Definition" })

-- Show incoming calls (who calls this function/method)
map("n", "<leader>jc", vim.lsp.buf.incoming_calls, { desc = "LSP: Incoming Calls" })

-- Show outgoing calls (functions/methods this one calls)
map("n", "<leader>jo", vim.lsp.buf.outgoing_calls, { desc = "LSP: Outgoing Calls" })

-- Hover documentation (explicitly, even if K is remapped elsewhere)
map("n", "<leader>jh", vim.lsp.buf.hover, { desc = "LSP: Hover Docs" })

map("n", "<leader>r", "<cmd>Telescope resume<cr>", { desc = "Resume last Telescope search" })
