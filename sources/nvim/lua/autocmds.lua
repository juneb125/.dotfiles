-- Autocommands --

if vim.g.loaded_autocmds then
	return
end
vim.g.loaded_autocmds = true

local create_autocmd = vim.api.nvim_create_autocmd
local create_augroup = vim.api.nvim_create_augroup
local gh = "https://github.com/"

vim.filetype.add({
	-- recognize {lhs} file pattern as a {rhs} file
	pattern = {
		-- ["man*/*.[0-9]"] = "nroff",
		["flake.lock"] = "json",
		["Cargo.lock"] = "toml"
	}
})

create_autocmd("FileType", {
	pattern = { "man*/*.[0-9]*", "*.[0-9]*" },
	command = "setlocal ft=nroff"
})

create_autocmd("VimEnter", {
	-- calculates the startup time & sets it as a global var
	callback = function()
		local startuptime = vim.fn.reltimefloat(vim.fn.reltime(vim.g.start_time))
		--- how long it took for nvim to start up, in milliseconds
		vim.g.startup_time_ms = startuptime * 1000
	end
})

local lazy_load_plugins = create_augroup("lazy_load_plugins", {})
create_autocmd({ "BufRead", "BufNewFile" }, {
	group = lazy_load_plugins,
	callback = function()
		vim.pack.add({
			{ src = gh .. "lewis6991/gitsigns.nvim" },
			{ src = gh .. "lukas-reineke/indent-blankline.nvim" },
		})

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
		map("n", "[h", gitsigns.prev_hunk, { desc = "Navigate to previous git hunk" })
		map("n", "]h", gitsigns.next_hunk, { desc = "Navigate to next git hunk" })

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

create_autocmd("InsertEnter", {
	group = lazy_load_plugins,
	callback = function()
		vim.pack.add({
			{ src = gh .. "windwp/nvim-autopairs" },
		})
		require("nvim-autopairs").setup({
			disable_filetype = { "snacks_picker", "snacks_picker_input" },
			disable_in_macro = true,
		})
		require("completions")
	end,
	once = true
})

-- terminal autocmd's,  see Credits #6 {{{
create_autocmd({"TermOpen", "TermEnter"}, {
  pattern = "term://*",
  command = "setlocal nonumber signcolumn=no ft=term",
})

create_autocmd("BufEnter", {
  pattern = "term://*",
  command = "startinsert"
})
-- }}}
