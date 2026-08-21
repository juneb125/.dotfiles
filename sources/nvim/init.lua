--- what time nvim was started (keep at the very top!)
vim.g.start_time = vim.fn.reltime()

-- options
-- `vim.fn.getenv("XDG_CONFIG_HOME") .. "/nvim"` is usually faster than `vim.fn.stdpath("config")`
vim.cmd("source " .. vim.fn.getenv("XDG_CONFIG_HOME") .. "/nvim/vinit.vim")
vim.opt.helpheight = math.min(15, vim.o.lines)
vim.opt.clipboard:append("unnamedplus")

---@diagnostic disable-next-line: lowercase-global
map = vim.keymap.set
---@diagnostic disable-next-line: lowercase-global
nmap = function(...) map("n", ...) end

vim.api.nvim_create_autocmd("UIEnter", {
	callback = function()
		require("commands")
		require("keymaps")
	end,
	once = true
})

require("autocmds")

-- Plugins --
-- disable some builtin plugins
vim.g.loaded_gzip = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_2html_plugin = 1

-- check that vim.pack is available {{{
if (not vim.fn.has("nvim-0.12")) and vim.pack == nil then
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
	{ src = gh .. "catppuccin/nvim", name = "catppuccin" },
	{ src = gh .. "nvim-tree/nvim-web-devicons" }, -- dependency for snacks, lualine, & oil
	{ src = gh .. "folke/snacks.nvim" },
	{ src = gh .. "nvim-lualine/lualine.nvim" },
	{ src = gh .. "stevearc/oil.nvim" },
	{ src = gh .. "nvim-treesitter/nvim-treesitter" },

	{ src = gh .. "mason-org/mason.nvim" },
})

vim.cmd("colorscheme catppuccin")

-- Snacks config {{{1
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
				local ms = ("%.2f"):format(vim.g.startup_time_ms) or "?"
				-- from github:folke/snacks.nvim@main (path: lua/snacks/dashboard.lua#L1098-L1106)
				return {
					align = "center",
					text = {
						{ "Neovim loaded in ", hl = "footer" },
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
-- don't show ':intro' (default dashboard)
vim.cmd("set shortmess-=I")

nmap("<C-p>", Snacks.picker.files, { desc = "Open Snacks picker" })
nmap("<leader>fb", Snacks.picker.buffers, { desc = "Find Buffers (Snacks)" })
nmap("<leader>fg", Snacks.picker.grep, { desc = "Find & Grep across files (Snacks)" })
nmap("<leader>fk", Snacks.picker.keymaps, { desc = "Find Keymaps (Snacks)" })
nmap("<leader>fr", Snacks.picker.recent, { desc = "Find Recently visited files (Snacks)" })

-- statusline (lualine) {{{1
require("lualine").setup({
	options = {
		theme = "palenight",
		ignore_focus = { "help", "oil" }
	},
	sections = {
		-- a={'mode'}, c={'filename'}, y={'progress'}, z={'location'}
		lualine_b = {
			-- nf-cod-source_control (U+EA68)
			{ "branch", icon = "" },
			"diff",
			"diagnostics"
		},
		lualine_x = {
			function()
				if (vim.bo.fileencoding == "utf-8") and (vim.bo.fileformat == "unix") then
					return ""
				end
				return ("%s[%s]"):format(vim.bo.fileencoding, vim.bo.fileformat)
			end,
			"filetype"
		},
	}
})
vim.cmd("set noshowmode")

-- oil (file explorer) {{{1
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
nmap("-", oil.toggle_float, { desc = "Open Oil float" })
-- completely disable netrw if oil config is okay
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- language support {{{1
require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"c",
		"bash",
		"lua",
		"markdown",
		"markdown_inline",
		"nix",
		"rust",
		"zig"
	},
	sync_install = false,
	highlight = { enable = true },
	indent = { enable = true }
})

require("mason").setup()
vim.lsp.enable({ "rust_analyzer", "clangd", "lua_ls", "nil_ls", "zls" })
-- }}}
