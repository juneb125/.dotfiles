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

			lspconfig.lua_ls.setup({ capabilities = capabilities }) -- lua lsp
			lspconfig.nil_ls.setup({ capabilities = capabilities }) -- nix lsp
			lspconfig.rust_analyzer.setup({ capabilities = capabilities }) -- rust lsp
			lspconfig.taplo.setup({ capabilities = capabilities }) -- toml lsp

			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Displays hover information about the symbol under the cursor" })
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Jumps to definition of the symbol under the cursor" })
			vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, { desc = "Lists all the implementations for the symbol under the cursor" })
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Lists all the references to the symbol under the cursor" })
			vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Formats current buffer using the attached LSP client(s)" })

			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Selects a code action available at the current cursor position" })
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Renames all references to the symbol under the cursor" })
			vim.keymap.set("n", "<leader>td", vim.lsp.buf.type_definition, { desc = "Jumps to the definition of the type of the symbol under the cursor" })
		end,
	},
}
