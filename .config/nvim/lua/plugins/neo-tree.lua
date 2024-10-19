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
			-- vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>', {})
			vim.keymap.set('n', '<C-n>', ':Neotree toggle<CR>', {})
		end
}
