return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- optional image support in preview window
		},
		config = function()
			vim.keymap.set('n', '<C-n>', '<cmd>Neotree filesystem reveal left toggle<CR>', { silent = true, desc = "Toggle Neotree (left)" })
			vim.keymap.set('n', '<leader>e', '<cmd>Neotree focus<CR>', { silent = true, desc = "Focus Neotree" })
			vim.keymap.set('n', '<leader>ta', function() -- maybe change `ta` to something else
				vim.fn.feedkeys(":Neotree dir=") -- feeds `:Neotree dir=` into the cmd line in CMD mode
			end, { desc = "Interactively change directories with Neotree" })
		end
}
