vim.api.nvim_create_autocmd("VimEnter", {
	-- calculates the startup time & sets it as a global var
	callback = function()
		local startuptime = vim.fn.reltimefloat(vim.fn.reltime(vim.g.start_time))
		--- how long it took for nvim to start up, in seconds
		vim.g.startup_time = startuptime
		--- `vim.g.startup_time`, but in milliseconds
		vim.g.startup_time_ms = startuptime * 1000
	end
})

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

vim.api.nvim_create_autocmd("InsertEnter", {
	callback = function()
		require("nvim-autopairs").setup({})
		require("completions")
	end,
	once = true
})
