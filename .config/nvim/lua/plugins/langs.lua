-- Language-specific plugins
return {
	-- Markdown (.md)
	{
		"toppair/peek.nvim",
		event = { "VeryLazy" },
		build = "deno task --quiet build:fast",
		ft = "markdown",
		opts = { syntax = false },
		config = function()
			local peek = require("peek")
			vim.api.nvim_create_user_command("PeekOpen", peek.open, {})
			vim.api.nvim_create_user_command("PeekClose", peek.close, {})
		end,
	},
	-- Rust (.rs)
	{
		"rust-lang/rust.vim",
		ft = "rust",
		config = function()
			vim.g.rustfmt_autosave = 1
		end,
	},
}
