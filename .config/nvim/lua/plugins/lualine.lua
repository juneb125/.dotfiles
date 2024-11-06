return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons"
	},
	opts = {
		options = {
			theme = 'palenight',
			-- https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md
			-- possible other themes: modus-vivendi, ayu_mirage, nightfly, onedark?, etc.
			sections = {
				lualine_x = { 'encoding', {
					'fileformat',
					symbols = {
						unix = 'unix', -- default: linux penguin icon
						dos = 'dos',
						mac = 'mac',
					},
				}, 'filetype' },
			},
		},
	},
}
