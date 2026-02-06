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
vim.keymap.set("n", "<C-p>", Snacks.picker.files)
vim.keymap.set("n", "<leader>fb", Snacks.picker.buffers)
vim.keymap.set("n", "<leader>fg", Snacks.picker.grep)
vim.keymap.set("n", "<leader>fk", Snacks.picker.keymaps)

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
vim.keymap.set("n", "<C-o>", oil.toggle_float, { silent = true })

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

-- I couldn't get lua to do this :( , so vimscript it is
-- almost completely from Credits #5
vim.cmd([[
  augroup local_spell_check
    autocmd FileType markdown,text setlocal spell
  augroup end
]])

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	callback = function()
		local signs = {
			add = { text = "┃" },
			change = { text = "┃" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			untracked = { text = "┆" }
		}
		local gitsigns = require("gitsigns")
		gitsigns.setup({
			signs = signs,
			signs_staged = signs,
		})
		vim.keymap.set("n", "[h", gitsigns.prev_hunk, {})
		vim.keymap.set("n", "]h", gitsigns.next_hunk, {})

		require("ibl").setup({
			scope = {
				enabled = true,
				show_start = false,
				show_end = false
			}
		})
	end,
	once = true
})

vim.api.nvim_create_autocmd("InsertEnter", {
	callback = function()
		require("nvim-autopairs").setup({})
		require("completions")
	end,
	once = true
})
