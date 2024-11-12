return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			-- "BurntSushi/ripgrep", -- necessary for live_grep and grep_string
		},
		opts = {
			defaults = { initial_mode = "insert" },
		},
		keys = {
			{
				"<C-p>",
				"<cmd>Telescope find_files hidden=true<CR>",
				silent = true,
				desc = "Telescope fuzzy find files",
			},
			{ "<leader>fb", "<cmd>Telescope buffers<CR>", silent = true, desc = "Telescope buffers" },
			{ "<leader>fr", "<cmd>Telescope registers<CR>", silent = true, desc = "Telescope registers" },
		},
	},
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
