return {
	"nvim-telescope/telescope.nvim", tag = '0.1.8',
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		-- local builtin = require("telescope.builtin")
		-- vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = "Fuzzy find files" })
		vim.keymap.set('n', '<C-p>', '<cmd>Telescope find_files hidden=true<CR>', { desc = "Fuzzy find files" })
		-- vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', {})
	end
}
