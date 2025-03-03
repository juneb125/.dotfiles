return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		local builtins = null_ls.builtins

		null_ls.setup({
			sources = {
				-- formatting
				builtins.formatting.clang_format, -- c
				builtins.formatting.stylua,       -- lua
				builtins.formatting.nixfmt,       -- nix
				-- rust formatter included w/ rust_analyzer (see lsp-config.lua)
				builtins.formatting.swift_format, -- swift
			},
		})
	end,
}
