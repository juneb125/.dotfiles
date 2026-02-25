--- what time nvim was started (keep at the very top!)
vim.g.start_time = vim.fn.reltime()

-- Settings --
require("settings")

-- Keymaps --
---@diagnostic disable-next-line: lowercase-global
map = vim.keymap.set
require("keymaps")

-- Commands --
local cmds = require("commands")

-- Plugins --
-- disable some builtin plugins
vim.g.loaded_gzip = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_2html_plugin = 1

-- check that vim.pack is available {{{
if vim.fn.has("nvim-0.12") ~= 1 and vim.pack ~= nil then
	-- from lazy.nvim's bootstrapping error handling
	vim.api.nvim_echo({
		{ "Failed to load packages with vim.pack\n", "ErrorMsg" },
		{ "Switch to nvim v0.12 or edit init.lua to fix this error", "WarningMsg" },
		{ "\nPress any key to acknowledge..." },
	}, true, {})
	vim.fn.getchar()
	return
end
-- }}}

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

Snacks = require("snacks")
Snacks.setup({
	bigfile = {
		enabled = true,
		notify = true
	},
	dashboard = {
		enable = true,
		sections = {
			{ section = "header" },
			{ section = "keys", gap = 1, padding = 1 },
			-- emulates the 'startup' section w/o Lazy stuff
			function()
				-- TODO: get the values for loaded_plugins, total_plugins, and ms
				local loaded_plugins = "?"
				local total_plugins = "?"
				-- for some reason, vim.g.startup_time is nil ???
				local ms = "?"
				-- from github:folke/snacks.nvim@main (path: lua/snacks/dashboard.lua#L1098-L1106)
				return {
					align = "center",
					text = {
						{ "Neovim loaded ", hl = "footer" },
						{ loaded_plugins .. "/" .. total_plugins, hl = "special" },
						{ " plugins in ", hl = "footer" },
						{ ms .. "ms", hl = "special" }
					}
				}
			end
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
-- completely disable ':intro' dashboard if Snacks config is okay
vim.cmd("set shortmess-=I")

map("n", "<C-p>", Snacks.picker.files, { desc = "Open Snacks picker" })
map("n", "<leader>fb", Snacks.picker.buffers, { desc = "Find Buffers (Snacks)" })
map("n", "<leader>fg", Snacks.picker.grep, { desc = "Find & Grep across files (Snacks)" })
map("n", "<leader>fk", Snacks.picker.keymaps, { desc = "Find Keymaps (Snacks)" })
map("n", "<leader>fr", Snacks.picker.recent, { desc = "Find Recently visited files (Snacks)" })

-- Snacks picker user fn's {{{
vim.api.nvim_create_user_command("Pick", function(opts)
	Snacks.picker(opts.fargs[1], {})
end, {
	nargs = "?",
	desc = "Quickly open a Snacks.nvim picker (default = files)",
	complete = cmds.picker_completions.general,
})

vim.api.nvim_create_user_command("PickGit", function(opts)
	Snacks.picker("git_" .. opts.fargs[1], {})
end, {
	nargs = 1,
	desc = "Quickly open a Snacks.nvim Git-related picker",
	complete = cmds.picker_completions.git,
})

vim.api.nvim_create_user_command("PickLsp", function(opts)
	Snacks.picker("lsp_" .. opts.fargs[1], {})
end, {
	nargs = 1,
	desc = "Quickly open a Snacks.nvim LSP-related picker",
	complete = cmds.picker_completions.lsp,
})
-- }}}

require("lualine").setup({
	options = {
		theme = "palenight",
		ignore_focus = { "help", "oil" }
	},
	-- only 'lualine_b' and 'lualine_x' sections were changed from their default
	sections = {
		lualine_a = { "mode" },
		lualine_b = {
			-- nf-cod-source_control (U+EA68)
			{ "branch", icon = "" },
			"diff",
			"diagnostics"
		},
		lualine_c = { "filename" },
		lualine_x = {
			function()
				return ("%s[%s]"):format(vim.bo.fileencoding, vim.bo.fileformat)
			end,
			"filetype"
		},
		lualine_y = { "progress" },
		lualine_z = { "location" }
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
-- completely disable netrw if oil config is okay
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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
