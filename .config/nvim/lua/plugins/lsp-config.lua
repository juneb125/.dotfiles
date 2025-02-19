return {
	{
		"williamboman/mason.nvim",
		opts = {},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")

			lspconfig.clangd.setup({ capabilities = capabilities }) -- c lsp
			lspconfig.gleam.setup({ capabilities = capabilities }) -- gleam lsp
			lspconfig.lua_ls.setup({ capabilities = capabilities }) -- lua lsp
			lspconfig.nil_ls.setup({ capabilities = capabilities }) -- nix lsp
			lspconfig.rust_analyzer.setup({ capabilities = capabilities }) -- rust lsp
			lspconfig.taplo.setup({ capabilities = capabilities }) -- toml lsp

			local buf = vim.lsp.buf
			local map = vim.keymap

			map.set("n", "K", buf.hover, { desc = "Displays hover information about the symbol under the cursor" })
			map.set("n", "<leader>gd", buf.definition, { desc = "Jumps to definition of the symbol under the cursor" })
			map.set("n", "<leader>gi", buf.implementation, { desc = "Lists all the implementations for the symbol under the cursor" })
			map.set("n", "<leader>gr", buf.references, { desc = "Lists all the references to the symbol under the cursor" })
			map.set("n", "<leader>gf", buf.format, { desc = "Formats current buffer using the attached LSP client(s)" })

			map.set("n", "<leader>ca", buf.code_action, { desc = "Selects a code action available at the current cursor position" })
			map.set("n", "<leader>rn", buf.rename, { desc = "Renames all references to the symbol under the cursor" })
			map.set("n", "<leader>td", buf.type_definition, { desc = "Jumps to the definition of the type of the symbol under the cursor" })
		end,
	},
}
