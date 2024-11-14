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

			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Info on hover" })
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Jump to definition" })
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Jump to references" })
			vim.keymap.set("n", "<leader>gf", function()
				vim.lsp.buf.format()
				print("Formatted!")
			end, { desc = "Format file" })
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Open code action menu" })
		end,
	},
}
