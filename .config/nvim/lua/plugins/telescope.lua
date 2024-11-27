return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			-- "BurntSushi/ripgrep", -- necessary for live_grep and grep_string
		},
		config = function()
			local builtin = require("telescope.builtin")

			vim.keymap.set("n", "<C-p>", "<cmd>Telescope find_files hidden=true<CR>", { silent = true, desc = "Telescope find files" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
			vim.keymap.set("n", "<leader>fr", builtin.registers, { desc = "Telescope registers" })
			vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, { desc = "Telescope old files" })
			vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Telescope keymaps" })
			-- vim.keymap.set("n", "<leader>fvo", builtin.vim_options, { desc = "Telescope vim options" })
		end,
	},
	-- telescope plugins
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = { require("telescope.themes").get_dropdown({}) },
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
