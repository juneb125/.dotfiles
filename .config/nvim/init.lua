-- Settings --
require("settings")

-- Keymaps --
vim.g.mapleader = " "

local map = vim.keymap.set
map("n", "<leader>o", ":update<CR>:source<CR>")
map("n", "<leader>nh", "<cmd>nohlsearch<CR>")

-- Plugins --
vim.pack.add({
		{ src = "https://github.com/catppuccin/nvim" },
})

vim.cmd("colorscheme catppuccin")
