-- Keymaps --

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- function to cut down config boilerplate, from
-- github:nmasur/dotfiles/pkgs/applications/editors/neovim/nmasur/neovim/lua/keybinds.lua
local map = function(mode, key_sequence, action, params)
    params = params or {}
    vim.keymap.set(mode, key_sequence, action, params)
end

-- to make the option field less verbose
local opts = function(silent, b)
	if silent then
		return { silent = true, desc = b }
	end
	return { desc = b }
end

-- to make settings less verbose
local nv = { "n", "v" }

map("n", "<leader>wt", "<cmd>set wrap!<CR>", opts(true, "Toggle line wrapping"))

-- the next 7 keymaps are from github:omerxx/dotfiles/nvim/lua/keymaps.lua
map(nv, "<Space>", "<Nop>", opts(false, "")) -- disables default "<Space>" map to "l"
map(nv, "<C-b>", "^", opts(false, "Go to first non-blank char in current line"))
map(nv, "<C-e>", "$", opts(false, "Go to last char in current line"))

-- Window resizing
-- -/+ for vertical, shift and -/+ for horizontal
map("n", "-", "<cmd>vertical resize -5<CR>", opts(true, "Resize vertical split (smaller)"))
map("n", "=", "<cmd>vertical resize +5<CR>", opts(true, "Resize vertical split (bigger)"))
map("n", "_", "<cmd>horizontal resize -5<CR>", opts(true, "Resize horizontal split (smaller)"))
map("n", "+", "<cmd>horizontal resize +5<CR>", opts(true, "Resize horizontal split (bigger)"))

map("n", "<leader>.", function()
	vim.cmd.vnew()
	vim.cmd.term()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 15)
end, opts(false, "Open terminal in split below"))
map("t", "<Esc>", "<C-\\><C-n>", opts(false, "Exit Nvim terminal emulator without closing it"))

map("n", "<leader>L", "<cmd>Lazy<CR>", opts(true, "Open Lazy popup"))
map("n", "<leader>M", "<cmd>Mason<CR>", opts(true, "Open Mason popup"))

-- navigate Vim panes better, from
-- github:typecraft-dev/dotfiles/nvim/.config/lua/vim-options.lua
map("n", "<C-k>", "<cmd>wincmd k<CR>", opts(true, "Navigate to pane above"))
map("n", "<C-j>", "<cmd>wincmd j<CR>", opts(true, "Navigate to pane below"))
map("n", "<C-h>", "<cmd>wincmd h<CR>", opts(true, "Navigate to left pane"))
map("n", "<C-l>", "<cmd>wincmd l<CR>", opts(true, "Navigate to right pane"))

-- the following keymaps are from 
-- github:josean-dev/dev-environment-files/.config/nvim/lua/josean/core/keymaps.lua
map("n", "<leader>nh", "<cmd>nohlsearch<CR>", opts(true, "Clear search highlighting"))

-- window management
map("n", "<leader>sv", "<C-w>v", opts(false, "Split window vertically"))
map("n", "<leader>sh", "<C-w>s", opts(false, "Split window horizontally"))
map("n", "<leader>se", "<C-w>=", opts(false, "Make splits equal size"))
map("n", "<leader>sx", "<cmd>close<CR>", opts(true, "Close current split"))

-- tab management
map("n", "<leader>to", "<cmd>tabnew<CR>", opts(true, "Open new tab"))
map("n", "<leader>tx", "<cmd>tabclose<CR>", opts(true, "Close current tab"))
map("n", "<leader>tn", "<cmd>tabn<CR>", opts(true, "Go to next tab"))
map("n", "<leader>tp", "<cmd>tabp<CR>", opts(true, "Go to previous tab"))
map("n", "<leader>tf", "<cmd>tabnew %<CR>", opts(true, "Open current buffer in new tab"))
