return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = { "c", "gleam", "lua", "markdown", "rust", "toml" },
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
