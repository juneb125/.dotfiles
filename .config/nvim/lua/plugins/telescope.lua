return {
	{
		"nvim-telescope/telescope.nvim", tag = '0.1.8',
		dependencies = {
			"nvim-lua/plenary.nvim",
			-- "BurntSushi/ripgrep", -- necessary for live_grep and grep_string
		},
		opts = {
			defaults = { initial_mode = 'insert' },
		},
		keys = {
			{ '<C-p>', '<cmd>Telescope find_files hidden=true<CR>', silent = true, desc = "Telescope fuzzy find files" },
			{ '<leader>fb', '<cmd>Telescope buffers<CR>', silent = true, desc = 'Telescope buffers' },
			{ '<leader>fr', '<cmd>Telescope registers<CR>', silent = true, desc = 'Telescope registers' },
		},
		-- config = function()
			-- defaults = { initial_mode = 'normal' }
			-- vim.keymap.set('n', '<C-p>', '<cmd>Telescope find_files hidden=true<CR>', { silent = true, desc = "Telescope fuzzy find files" })
			-- vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep hidden=true<CR>', { silent = true, desc = 'Telescope live grep' })
			-- vim.keymap.set('n', '<leader>fs', '<cmd>Telescope grep_string<CR>', { silent = true, desc = 'Telescope grep string under cursor' })
			-- vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<CR>', { silent = true, desc = 'Telescope buffers' })
			-- vim.keymap.set('n', '<leader>fr', '<cmd>Telescope registers<CR>', { silent = true, desc = 'Telescope registers' })
		-- end
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = { require("telescope.themes").get_dropdown({}) }
				}
			})
			require("telescope").load_extension("ui-select")
		end
	},
}
