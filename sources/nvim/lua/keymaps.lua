-- Keymaps --

map("n", "<Space>", "<Nop>", {})
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

map("n", "<leader>wt", "<cmd>set wrap!<CR>", { silent = true })
map("n", "<leader>sc", "<cmd>setlocal spell!<CR>", { silent = true })

map("t", "<Esc>", "<C-\\><C-n>")

-- *sometimes* emacs is right {{{
-- some emacs keybinds are nice, but only for insert/cmd mode
map({ "i", "c" }, "<C-b>", "<Left>")    -- backward-char
map({ "i", "c" }, "<C-f>", "<Right>")   -- forward-char
map({ "i", "c" }, "<A-b>", "<S-Left>")  -- backward-word
map({ "i", "c" }, "<A-f>", "<S-Right>") -- foward-word

map("i", "<C-a>", "<C-o>^")  -- beginning-of-line
map("i", "<C-e>", "<C-o>$")  -- end-of-line

map("c", "<C-a>", "<C-b>")   -- beginning-of-line
-- <C-e> is already end-of-line in cmd mode
-- see ':h emacs-keys' for more emacs cmd mode keymaps
-- }}}

-- navigate Vim panes better, see Credits #1 {{{
map("n", "<C-k>", "<C-w>k")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
-- }}}

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

-- lsp-related keymaps {{{
local buf = vim.lsp.buf

map("n", "K", buf.hover)
map("n", "<leader>gf", buf.format)
map("n", "<leader>ca", buf.code_action)
map("n", "<leader>rn", buf.rename)
-- }}}

-- 'jumping' keymaps {{{
local diag = vim.diagnostic
local sev = diag.severity

-- '[d' and ']d' for jumping to the previous/next diagnostic, respectively, are
-- already set by neovim, but not with the float option :/
-- jump to previous diagnostic
map("n", "[d", function()
	diag.jump({ count = -1, float = true })
end)
-- jump to next diagnostic
map("n", "]d", function()
	diag.jump({ count = 1, float = true })
end)

-- see Credits #4 for '[e' & ']e'
-- jump to previous error
map("n", "[e", function()
	diag.jump({ count = -1, float = true, severity = sev.ERROR })
end)
-- jump to next error
map("n", "]e", function()
	diag.jump({ count = 1, float = true, severity = sev.ERROR })
end)
-- }}}

-- buffer- & tab-related keymaps {{{
-- '[b' and ']b' for jumping to the previous/next buffer, respectively, are
-- already set by neovim :)

-- go to previous tab
map("n", "<leader>[t", "<cmd>tabp<CR>", { silent = true })
-- go to next tab
map("n", "<leader>]t", "<cmd>tabn<CR>", { silent = true })
-- }}}
