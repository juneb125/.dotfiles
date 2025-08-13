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
local gh = "https://github.com/"
vim.pack.add({
	{ src = gh .. "catppuccin/nvim" },
	{ src = gh .. "mason-org/mason.nvim" },
	{ src = gh .. "neovim/nvim-lspconfig" },
	{ src = gh .. "nvim-treesitter/nvim-treesitter" },
	{ src = gh .. "lewis6991/gitsigns.nvim" },
})

vim.cmd("colorscheme catppuccin")

require("mason").setup()
vim.lsp.enable({ "lua_ls", "nil_ls", "rust_analyzer" })

require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"lua",
		"markdown",
		"nix",
		"rust",
	},
	sync_install = false,
	highlight = { enable = true },
	indent = { enable = true },
})

require("gitsigns").setup({
	signs = {
		add = { text = "┃" },
		change = { text = "┃" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
		untracked = { text = "┆" },
	},
	signs_staged = {
		add = { text = "┃" },
		change = { text = "┃" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
		untracked = { text = "┆" },
	},
})
