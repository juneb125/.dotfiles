-- Settings --
require("settings")

-- Keymaps --
vim.g.mapleader = " "

local map = vim.keymap.set
map("n", "<leader>o", "<cmd>update<CR> <cmd>source<CR>")
map("n", "<leader>nh", "<cmd>nohlsearch<CR>", {})

local buf = vim.lsp.buf
map("n", "K", buf.hover)
map("n", "<leader>gf", buf.format)
map("n", "<leader>ca", buf.code_action)

-- Plugins --
vim.pack.add({
	{ src = "https://github.com/catppuccin/nvim" },
	{ src = "https://github.com/mason-org/mason.nvim" },
})

vim.lsp.enable({ "lua_ls" })

require("mason").setup()

vim.cmd("colorscheme catppuccin")
