-- Keymaps --

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local map = vim.keymap.set

map("n", "<leader>wt", "<cmd>set wrap!<CR>", { silent = true })
map("n", "<leader>sc", "<cmd>setlocal spell!<CR>", { silent = true })

-- navigate Vim panes better, see Credits #1
map("n", "<C-k>", "<C-w><C-k>")
map("n", "<C-j>", "<C-w><C-j>")
map("n", "<C-h>", "<C-w><C-h>")
map("n", "<C-l>", "<C-w><C-l>")

-- clear highlighting, see Credits #2
map("n", "<leader>nh", "<cmd>nohlsearch<CR>", { silent = true })

-- keep selection when changing indentation, see Credits #3
map("v", "<", "<gv")
map("v", ">", ">gv")

-- shuffle lines around, see Credits #3
map("n", "<A-j>", "<cmd>m .+1<CR>==", { silent = true })
map("n", "<A-k>", "<cmd>m .-2<CR>==", { silent = true })

-- center search results
map("n", "n", "nzz")
map("n", "N", "Nzz")

-- lsp-related keymaps
local buf = vim.lsp.buf

map("n", "K", buf.hover)
map("n", "<leader>gf", buf.format)
map("n", "<leader>ca", buf.code_action)
map("n", "<leader>rn", buf.rename)

-- 'jumping' keymaps (L40..=L47), see Credits #4
local diag = vim.diagnostic
local sev = diag.severity

-- jump to previous error
map("n", "[e", function()
	diag.jump({ count = -1, severity = sev.ERROR })
end)
-- jump to next error
map("n", "]e", function()
	diag.jump({ count = 1, severity = sev.ERROR })
end)

-- ']t' and '[t' are set to 'tPrev' and 'tNext' (tag prev/next), respectively by default
-- go to previous tab
map("n", "[t", "<cmd>tprev<CR>", { silent = true })
-- go to next tab
map("n", "]t", "<cmd>tnext<CR>", { silent = true })
