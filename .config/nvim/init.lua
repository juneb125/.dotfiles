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
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
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
