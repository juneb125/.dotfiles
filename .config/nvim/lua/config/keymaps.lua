-- Keymaps --

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- to make settings less verbose
local keymap = vim.keymap

-- to make the option field less verbose
local opts = function(silent, b)
	if silent then
		return { silent = true, desc = b }
	end
	return { desc = b }
end

keymap.set("n", "<leader>wt", "<cmd>set wrap!<CR>", opts(true, "Toggle line wrapping"))

-- the next 7 keymaps are from github:omerxx/dotfiles/nvim/lua/keymaps.lua
keymap.set({ "n", "v" }, "<Space>", "<Nop>", opts(false, "")) -- disables default "<Space>" map to "l"
keymap.set({ "n", "v" }, "B", "^", opts(false, "")) -- easier mapping to go to first non-blank char in line

-- -/+ for vertical, shift and -/+ for horizontal
keymap.set("n", "-", "<cmd>vertical resize -5<CR>", opts(true, ""))
keymap.set("n", "=", "<cmd>vertical resize +5<CR>", opts(true, ""))
keymap.set("n", "_", "<cmd>horizontal resize -5<CR>", opts(true, ""))
keymap.set("n", "+", "<cmd>horizontal resize +5<CR>", opts(true, ""))

keymap.set("t", "<Esc>", "<C-\\><C-n>", opts(false, "Exit Nvim terminal emulator without closing it"))

keymap.set("n", "<leader>L", "<cmd>Lazy<CR>", opts(true, "Open Lazy popup"))
keymap.set("n", "<leader>M", "<cmd>Mason<CR>", opts(true, "Open Mason popup"))

-- navigate Vim panes better, from
-- github:typecraft-dev/dotfiles/nvim/.config/lua/vim-options.lua
keymap.set("n", "<C-k>", "<cmd>wincmd k<CR>", opts(true, "Navigate to pane above"))
keymap.set("n", "<C-j>", "<cmd>wincmd j<CR>", opts(true, "Navigate to pane below"))
keymap.set("n", "<C-h>", "<cmd>wincmd h<CR>", opts(true, "Navigate to left pane"))
keymap.set("n", "<C-l>", "<cmd>wincmd l<CR>", opts(true, "Navigate to right pane"))

-- the following keymaps are from 
-- github:josean-dev/dev-environment-files/.config/nvim/lua/josean/core/keymaps.lua
keymap.set("n", "<leader>nh", "<cmd>nohlsearch<CR>", opts(true, "Clear search highlighting"))

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", opts(false, "Split window vertically"))
keymap.set("n", "<leader>sh", "<C-w>s", opts(false, "Split window horizontally"))
keymap.set("n", "<leader>se", "<C-w>=", opts(false, "Make splits equal size"))
keymap.set("n", "<leader>sx", "<cmd>close<CR>", opts(true, "Close current split"))

-- tab management
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", opts(true, "Open new tab"))
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", opts(true, "Close current tab"))
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", opts(true, "Go to next tab"))
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", opts(true, "Go to previous tab"))
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", opts(true, "Open current buffer in new tab"))
