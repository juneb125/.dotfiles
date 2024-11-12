return {
	{
		"williamboman/mason.nvim",
		opts = {},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = { "lua_ls", "nil_ls", "rust_analyzer" },
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({ capabilities = capabilities }) -- lua
			lspconfig.nil_ls.setup({ capabilities = capabilities }) -- nix
			lspconfig.rust_analyzer.setup({ capabilities = capabilities }) -- rust

			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Info on hover" })
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Jump to definition" })
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Jump to references" })
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Open code action menu" })
		end,
	},
}
