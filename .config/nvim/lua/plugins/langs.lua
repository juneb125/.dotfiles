-- Language-specific plugins
return {
	-- Markdown (.md)
	{
		"toppair/peek.nvim",
    event = { "VeryLazy" },
    build = "deno task --quiet build:fast",
		ft = "markdown",
		opts = { syntax = false, },
    config = function()
        vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
        vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
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
