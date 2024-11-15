return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				-- formatting
				null_ls.builtins.formatting.stylua, -- lua
				null_ls.builtins.formatting.nixfmt, -- nix
				-- rust: included with rust_analyzer (see lsp-config.lua)
			},
		})
	end,
}
