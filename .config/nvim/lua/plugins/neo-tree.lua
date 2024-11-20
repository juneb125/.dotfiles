return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- optional image support in preview window
	},
	-- keys = {}
	config = function()
		vim.keymap.set(
			"n",
			"<C-n>",
			"<cmd>Neotree filesystem reveal left toggle<CR>",
			{ silent = true, desc = "Toggle Neotree (left)" }
		)
		vim.keymap.set("n", "<leader>e", "<cmd>Neotree focus<CR>", { silent = true, desc = "Focus Neotree" })
		vim.keymap.set("n", "<leader>ta", function()
			vim.fn.feedkeys(":Neotree dir=")
		end, { desc = "Change root directory with Neotree" })
	end,
}
