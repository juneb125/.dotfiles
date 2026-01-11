-- Keymaps --

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local map = vim.keymap.set

map("n", "<leader>wt", "<cmd>set wrap!<CR>")
map("n", "<leader>sc", "<cmd>setlocal spell!<CR>")

-- navigate Vim panes better, see Credits #1
map("n", "<C-k>", "<cmd>wincmd k<CR>")
map("n", "<C-j>", "<cmd>wincmd j<CR>")
map("n", "<C-h>", "<cmd>wincmd h<CR>")
map("n", "<C-l>", "<cmd>wincmd l<CR>")

-- clear highlighting, see Credits #2
map("n", "<leader>nh", "<cmd>nohlsearch<CR>")

-- keep selection when changing indentation, see Credits #3
map("v", "<", "<gv")
map("v", ">", ">gv")

-- shuffle lines around, see Credits #3
map("n", "<A-j>", "<cmd>m .+1<CR>==")
map("n", "<A-k>", "<cmd>m .-2<CR>==")

-- lsp-related keymaps
local buf = vim.lsp.buf

map("n", "K", buf.hover)
map("n", "<leader>gf", buf.format)
map("n", "<leader>ca", buf.code_action)
map("n", "<leader>rn", buf.rename)

-- 'jumping' keymaps (L36..=L55), see Credits #4
local diag = vim.diagnostic
local sev_err = diag.severity.ERROR

-- jump to previous diagnostic
map("n", "[d", function()
	diag.jump({ count = -1 })
end)
-- jump to next diagnostic
map("n", "]d", function()
	diag.jump({ count = 1 })
end)

-- jump to previous error
map("n", "[e", function()
	diag.jump({ count = -1, severity = sev_err })
end)
-- jump next error
map("n", "]e", function()
	diag.jump({ count = 1, severity = sev_err })
end)
