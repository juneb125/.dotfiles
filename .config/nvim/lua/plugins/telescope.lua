return {
	"nvim-telescope/telescope.nvim", tag = '0.1.8',
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		vim.keymap.set('n', '<C-p>', '<cmd>Telescope find_files hidden=true<CR>', { silent = true, desc = "Fuzzy find files" })
		-- local builtin = require("telescope.builtin")
		-- vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', {})
	end
}
