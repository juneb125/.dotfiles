return {
	{
		"williamboman/mason.nvim",
		opts = {},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = { "lua_ls" },
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({})

			vim.keymap.set("n", "Y", vim.lsp.buf.hover, { desc = "Info on hover" })
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Jump to definition" })
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Jump to references" })
			vim.keymap.set({ "n", "v" }, "<leader>gf", vim.lsp.buf.format, { desc = "Format code" })
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Open code action menu" })
		end
	},
}
