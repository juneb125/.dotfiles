return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons"
	},
	config = function()
		require("lualine").setup({
			options = {
				theme = 'palenight'
				-- https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md
				-- possible other themes: modus-vivendi, ayu_mirage, nightfly, onedark?, etc.
			}
		})
	end
}
