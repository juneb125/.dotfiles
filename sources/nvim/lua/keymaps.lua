-- Keymaps --

-- see ':h default-mappings' for all of the default mappings

local nmap = function(...) map("n", ...) end

nmap("<Space>", "<Nop>", {})
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

nmap("<leader>wt", "<cmd>set wrap!<CR>", { silent = true })
nmap("<leader>sc", "<cmd>setlocal spell!<CR>", { silent = true })

nmap("S", "C") -- match end-of-line actions, like D and Y

map("t", "<Esc>", "<C-\\><C-n>")

-- *sometimes* emacs is right {{{1
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

-- navigate Vim panes better, see Credits #1 {{{1
nmap("<C-k>", "<C-w>k")
nmap("<C-j>", "<C-w>j")
nmap("<C-h>", "<C-w>h")
nmap("<C-l>", "<C-w>l")
-- }}}

-- clear highlighting, see Credits #2
nmap("<leader>nh", "<cmd>nohl<CR>", { silent = true })

-- keep selection when changing indentation, see Credits #3
map("v", "<", "<gv")
map("v", ">", ">gv")

-- shuffle lines around, see Credits #3
nmap("<A-j>", "<cmd>m .+1<CR>==", { silent = true })
nmap("<A-k>", "<cmd>m .-2<CR>==", { silent = true })

-- center search results
nmap("n", "nzz")
nmap("N", "Nzz")

-- lsp-related keymaps {{{1
local buf = vim.lsp.buf

nmap("K", buf.hover)
nmap("<leader>gf", buf.format)
nmap("<leader>ca", buf.code_action)
nmap("<leader>rn", buf.rename)

-- 'jumping' keymaps {{{2
local diag = vim.diagnostic
local sev = diag.severity

-- '[d' and ']d' for jumping to the previous/next diagnostic, respectively, are
-- already set by neovim, but not with the float option :/
-- jump to previous diagnostic
nmap("[d", function()
	diag.jump({ count = -1, float = true })
end)
-- jump to next diagnostic
nmap("]d", function()
	diag.jump({ count = 1, float = true })
end)

-- see Credits #4 for '[e' & ']e'
-- jump to previous error
nmap("[e", function()
	diag.jump({ count = -1, float = true, severity = sev.ERROR })
end)
-- jump to next error
nmap("]e", function()
	diag.jump({ count = 1, float = true, severity = sev.ERROR })
end)
-- }}}2

-- buffer- & tab-related keymaps {{{1
-- '[b' and ']b' for jumping to the previous/next buffer, respectively, are
-- already set by neovim :)

nmap("[t", "<cmd>tabprev<CR>", { silent = true }) -- go to previous tab
nmap("]t", "<cmd>tabnext<CR>", { silent = true }) -- go to next tab

-- go to last viewed buffer
nmap("<leader><leader>", "<cmd>e #<CR>", { silent = true })
