-- Keymaps --

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- to make settings less verbose
local keymap = vim.keymap

-- to make the option field less verbose
local opts = function(a, b)
	if not a then
		return { desc = b }
	end
	return { silent = true, desc = b }
end

keymap.set("n", "<leader>wt", "<cmd>set wrap!<CR>", opts(true, "Toggle line wrapping")) -- toggles line wrapping
-- keymap.set('n', '<C-t>v', '<C-w>v<cmd>terminal<CR>', opts(true, "Open Nvim terminal emulator in new vertical split")
-- keymap.set('n', '<C-t>h', '<C-w>s<cmd>terminal<CR>', opts(true, "Open Nvim terminal emulator in new horizontal split")
keymap.set("t", "<Esc>", "<C-\\><C-n>", opts(false, "Exit Nvim terminal emulator without closing it"))

-- navigate Vim panes better
-- from https://github.com/typecraft-dev/dotfiles/nvim/.../vim-options.lua
keymap.set("n", "<C-k>", "<cmd>wincmd k<CR>", opts(true, "Navigate to pane above"))
keymap.set("n", "<C-j>", "<cmd>wincmd j<CR>", opts(true, "Navigate to pane below"))
keymap.set("n", "<C-h>", "<cmd>wincmd h<CR>", opts(true, "Navigate to left pane"))
keymap.set("n", "<C-l>", "<cmd>wincmd l<CR>", opts(true, "Navigate to right pane"))

-- the following keymaps are from josean-dev/dev-environment-files on github
keymap.set("n", "<leader>nh", "<cmd>nohlsearch<CR>", opts(true, "Clear search highlighting")) -- clears search highlighting

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", opts(false, "Split window vertically"))    -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", opts(false, "Split window horizontally"))  -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", opts(false, "Make splits equal size"))     -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", opts(true, "Close current split")) -- close current split window

-- tab management
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", opts(true, "Open new tab"))                     -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", opts(true, "Close current tab"))              -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", opts(true, "Go to next tab"))                     --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", opts(true, "Go to previous tab"))                 --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", opts(true, "Open current buffer in new tab")) --  move current buffer to new tab
-- web-browser-like keymaps for tab management
keymap.set("n", "<C-w>", "<cmd>tabclose<CR>", opts(true, "Close current tab"))
-- keymap.set('n', '<C-Tab>', '<cmd>tabn<CR>', opts(true, "Go to next tab")) -- ctrl tab
-- keymap.set('n', '<C-`>', '<cmd>tabp<CR>', opts(true, "Go to previous tab")) -- ctrl [grave]
