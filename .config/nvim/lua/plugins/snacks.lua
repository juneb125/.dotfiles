return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = {
			enabled = true,
			notify = true,
		},
		dashboard = {
			enable = true,
			sections = {
				{ section = "header" },
				{ section = "keys", gap = 1, padding = 1 },
				{ section = "startup" },
			},
			bo = {
				-- buffer options
				filetype = "snacks_dashboard",
			},
		},
		terminal = {
			enabled = true,
			bo = {
				filetype = "snacks_terminal",
			},
			win = {
				style = "terminal",
				position = "float",
				border = "rounded",
				width = 0.75,
				height = 0.6,
				zindex = 50,
			},
		},
	},
	keys = {
		{
			"<C-g>", -- <C-/> didn't work for some reason
			function()
				Snacks.terminal.toggle()
			end,
			mode = { "n", "t" },
			desc = "Toggle terminal with Snacks.nvim",
		},
	},
}
