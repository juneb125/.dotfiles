-- Settings --
require("settings")

-- Keymaps --
require("keymaps")

-- Plugins --
local gh = "https://github.com/"
vim.pack.add({
	{ src = gh .. "catppuccin/nvim" },
	{ src = gh .. "nvim-lualine/lualine.nvim" },
	{ src = gh .. "mason-org/mason.nvim" },
	{ src = gh .. "neovim/nvim-lspconfig" },
	{ src = gh .. "nvim-treesitter/nvim-treesitter" },
	{ src = gh .. "stevearc/oil.nvim" },

	{ src = gh .. "nvim-tree/nvim-web-devicons" }, -- dependency for lualine & neotree
	{ src = gh .. "MunifTanjim/nui.nvim", },       -- dependency for neotree
	{ src = gh .. "nvim-lua/plenary.nvim", },      -- dependency for neotree
	{ src = gh .. "nvim-neo-tree/neo-tree.nvim" },

	{ src = gh .. "lewis6991/gitsigns.nvim" },
	{ src = gh .. "lukas-reineke/indent-blankline.nvim" },
	{ src = gh .. "windwp/nvim-autopairs" },

	-- completions
	{ src = gh .. "hrsh7th/cmp-nvim-lsp" },
	{ src = gh .. "L3MON4D3/LuaSnip" },
	{ src = gh .. "hrsh7th/nvim-cmp" },
	{ src = gh .. "saadparwaiz1/cmp_luasnip" },    -- dependency for LuaSnip
	{ src = gh .. "rafamadriz/friendly-snippets" } -- dependency for LuaSnip
})

vim.cmd("colorscheme catppuccin")

require("mason").setup()
vim.lsp.enable({ "rust_analyzer", "clangd" })

vim.api.nvim_create_augroup("lazy_lsp", {})

-- only enable lua_ls (Lua LSP) when needed
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	group = "lazy_lsp",
	pattern = "*.lua",
	command = "lua vim.lsp.enable('lua_ls')",
	once = true
})

-- only enable nil_ls (Nix LSP) when needed
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	group = "lazy_lsp",
	pattern = "*.nix",
	command = "lua vim.lsp.enable('nil_ls')",
	once = true
})

-- see Credits #5
vim.cmd([[
  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal spell
  augroup end
]])

require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"lua",
		"markdown",
		"nix",
		"rust"
	},
	sync_install = false,
	highlight = { enable = true },
	indent = { enable = true }
})

local oil = require("oil")
oil.setup({
	default_file_explorer = true,
	view_options = {
		show_hidden = false
	},
	float = {
		min_width = 0.4,
		min_height = 0.4,
		max_width = 0.7,
		max_height = 0.7,
		border = "rounded"
	},
	keymaps = {
		-- keymaps for oil to behave a little more like NeoTree
		["H"] = { "actions.toggle_hidden", mode = "n" },
		["<BS>"] = { "actions.parent", mode = "n" },
		["."] = { "actions.cd", mode = "n" },
		-- misc. keymaps
		["q"] = { "actions.close", mode = "n" },
		["<Esc>"] = { "actions.close", mode = "n" }
	}
})
vim.keymap.set("n", "<C-o>", oil.toggle_float, { silent = true })

local signs = {
	add = { text = "┃" },
	change = { text = "┃" },
	delete = { text = "_" },
	topdelete = { text = "‾" },
	changedelete = { text = "~" },
	untracked = { text = "┆" }
}
require("gitsigns").setup({
	signs = signs,
	signs_staged = signs
})

require("ibl").setup({
	scope = {
		enabled = true,
		show_start = false,
		show_end = false
	}
})

require("nvim-autopairs").setup({})

require("lualine").setup({
	options = {
		theme = "palenight",
		ignore_focus = { "neo-tree", "oil" }
	},
	sections = {
		lualine_b = {
			{
				"branch",
				icons_enabled = false,
				fmt = function(str)
					-- nf-cod-source_control (U+EA68)
					return " " .. str
				end
			},
			"diff",
			"diagnostics"
		},

		lualine_x = {
			"encoding",
			{
				"fileformat",
				symbols = {
					unix = "unix", -- default: linux penguin icon
					dos = "dos",
					mac = "mac"
				}
			},
			"filetype"
		}
	}
})

require("neo-tree").setup({})
vim.keymap.set("n", "<C-n>", "<cmd>Neotree filesystem reveal left toggle<CR>", { silent = true })

require("completions")
