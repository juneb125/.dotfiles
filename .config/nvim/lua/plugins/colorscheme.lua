return {
	"catppuccin/nvim",
	lazy = false,
	name = "catppuccin",
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("catppuccin")
		-- flavors: https://github.com/catppuccin/catppuccin?tab=readme-ov-file#-palette
		-- latte, *frappe*, macchiato, mocha
	end
}
