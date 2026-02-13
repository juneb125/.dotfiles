--- what time nvim was started (keep at the very top!)
vim.g.start_time = vim.fn.reltime()

-- Settings --
require("settings")

-- Keymaps --
---@diagnostic disable-next-line: lowercase-global
map = vim.keymap.set
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
	-- core plugins
	{ src = gh .. "catppuccin/nvim" },
	{ src = gh .. "nvim-tree/nvim-web-devicons" }, -- dependency for snacks, lualine, & oil
	{ src = gh .. "folke/snacks.nvim" },
	{ src = gh .. "nvim-lualine/lualine.nvim" },
	{ src = gh .. "stevearc/oil.nvim" },
	{ src = gh .. "nvim-treesitter/nvim-treesitter" },

	{ src = gh .. "mason-org/mason.nvim" },

	-- QoL plugins
	{ src = gh .. "lewis6991/gitsigns.nvim" },
	{ src = gh .. "lukas-reineke/indent-blankline.nvim" },
	{ src = gh .. "windwp/nvim-autopairs" },

	-- completions
	{ src = gh .. "hrsh7th/nvim-cmp" },
	{ src = gh .. "saadparwaiz1/cmp_luasnip" },     -- dependency for LuaSnip
	{ src = gh .. "rafamadriz/friendly-snippets" }, -- dependency for LuaSnip
	{ src = gh .. "L3MON4D3/LuaSnip" },
	{ src = gh .. "hrsh7th/cmp-nvim-lsp" }
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
			{ section = "keys", gap = 1, padding = 1 }
		},
		-- buffer options
		bo = { filetype = "snacks_dashboard" }
	},
	picker = {
		enabled = true,
		layout = function()
			-- 'telescope' preset, but not as tall (default layout.height is 0.9)
			local telescope_layout = require("snacks.picker.config.layouts").telescope
			telescope_layout.layout.height = 0.7
			return telescope_layout
		end,
		bo = { filetype = "snacks_picker" }
	}
})
map("n", "<C-p>", Snacks.picker.files, { desc = "Open Snacks picker" })
map("n", "<leader>fb", Snacks.picker.buffers, { desc = "Find Buffers (Snacks)" })
map("n", "<leader>fg", Snacks.picker.grep, { desc = "Find & Grep across files (Snacks)" })
map("n", "<leader>fk", Snacks.picker.keymaps, { desc = "Find Keymaps (Snacks)" })
map("n", "<leader>fr", Snacks.picker.recent, { desc = "Find Recently visited files (Snacks)" })

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
		["H"] = "actions.toggle_hidden",
		["<BS>"] = "actions.parent",
		["."] = "actions.cd",
		-- misc. keymaps
		["q"] = "actions.close",
		["<Esc>"] = "actions.close"
	}
})
map("n", "-", oil.toggle_float, { desc = "Open Oil float" })

require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"c",
		"bash",
		"lua",
		"markdown",
		"markdown_inline",
		"nix",
		"rust"
	},
	sync_install = false,
	highlight = { enable = true },
	indent = { enable = true }
})

require("mason").setup()
vim.lsp.enable({ "rust_analyzer", "clangd", "lua_ls", "nil_ls" })

require("autocmds")
