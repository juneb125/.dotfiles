-- Settings --
require("settings")

-- Keymaps --
require("keymaps")

-- Plugins --
local gh = "https://github.com/"
vim.pack.add({
	{ src = gh .. "catppuccin/nvim" },
	{ src = gh .. "mason-org/mason.nvim" },
	{ src = gh .. "neovim/nvim-lspconfig" },
	{ src = gh .. "nvim-treesitter/nvim-treesitter" },
	{ src = gh .. "lewis6991/gitsigns.nvim" },
	{ src = gh .. "lukas-reineke/indent-blankline.nvim" },
	{ src = gh .. "windwp/nvim-autopairs" },
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

local signs = {
	add = { text = "┃" },
	change = { text = "┃" },
	delete = { text = "_" },
	topdelete = { text = "‾" },
	changedelete = { text = "~" },
	untracked = { text = "┆" },
}
require("gitsigns").setup({
	signs = signs,
	signs_staged = signs
})

require("ibl").setup({
	scope = {
		enabled = true,
		show_start = false,
		show_end = false,
	}
})

require("nvim-autopairs").setup({})
