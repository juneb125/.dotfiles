-- Settings --
require("settings")

-- Keymaps --
require("keymaps")

if vim.fn.has("nvim-0.12") ~= 1 then
	-- from lazy.nvim's bootstrapping error handling
	vim.api.nvim_echo({
		{ "Failed to load packages with vim.pack\n", "ErrorMsg" },
		{ "Switch to nvim v0.12 or edit init.lua to fix this error", "WarningMsg" },
		{ "\nPress any key to exit..." },
	}, true, {})
	vim.fn.getchar()
	return
end

-- Plugins --
local gh = "https://github.com/"
vim.pack.add({
	{ src = gh .. "catppuccin/nvim" },
	{ src = gh .. "folke/snacks.nvim" },
	{ src = gh .. "nvim-tree/nvim-web-devicons" }, -- dependency for lualine
	{ src = gh .. "nvim-lualine/lualine.nvim" },
	{ src = gh .. "mason-org/mason.nvim" },
	{ src = gh .. "nvim-treesitter/nvim-treesitter" },
	{ src = gh .. "stevearc/oil.nvim" },

	-- QoL plugins
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

local Snacks = require("snacks")
Snacks.setup({
	bigfile = {
		enabled = true,
		notify = true
	},
	dashboard = {
		enable = true,
		sections = {
			{ section = "header" },
			{ section = "keys",  gap = 1, padding = 1 }
		},
		-- buffer options
		bo = { filetype = "snacks_dashboard" }
	},
	picker = {
		enabled = true,
		layout = { preset = "telescope" }
	}
})
vim.keymap.set("n", "<C-p>", Snacks.picker.files)

require("mason").setup()
vim.lsp.enable({ "rust_analyzer", "clangd", "lua_ls", "nil_ls" })

-- I couldn't get lua to do this :( , so vimscript it is
-- almost completely from Credits #5
vim.cmd([[
  augroup local_spell_check
    autocmd FileType markdown,text setlocal spell
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
		ignore_focus = { "help", "oil" }
	},
	sections = {
		lualine_b = {
			-- nf-cod-source_control (U+EA68)
			{ "branch", icon = "" },
			"diff",
			"diagnostics"
		},

		lualine_x = {
			function()
				return ("%s[%s]"):format(vim.bo.fileencoding, vim.bo.fileformat)
			end,
			"filetype"
		}
	}
})

require("completions")
