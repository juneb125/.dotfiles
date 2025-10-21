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
	{ src = gh .. "saadparwaiz1/cmp_luasnip" },     -- dependency for LuaSnip
	{ src = gh .. "rafamadriz/friendly-snippets" }, -- dependency for LuaSnip
})

vim.cmd("colorscheme catppuccin")

require("mason").setup()
vim.lsp.enable({ "nil_ls", "rust_analyzer" })

-- only enable lua_ls (Lua LSP) when needed
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.lua" },
	command = function()
		vim.lsp.enable("lua_ls")
	end,
})

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

require("lualine").setup({
	options = {
		theme = "palenight",
		ignore_focus = { "neo-tree" }
	},
	sections = {
		lualine_b = {
			{
				"branch",
				icons_enabled = false,
				fmt = function(str)
					return " " .. str
				end,
			},
			"diff",
			"diagnostics",
		},

		lualine_x = {
			"encoding",
			{
				"fileformat",
				symbols = {
					unix = "unix", -- default: linux penguin icon
					dos = "dos",
					mac = "mac",
				},
			},
			"filetype",
		},
	},
})

require("neo-tree").setup({})
vim.keymap.set("n", "<C-n>", "<cmd>Neotree filesystem reveal left toggle<CR>", { silent = true })

-- Completions --
local cmp = require("cmp")
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = {
		["<C-j>"] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end,
		["<C-k>"] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end,
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	}, {
		{ name = "buffer" },
	}),
})
