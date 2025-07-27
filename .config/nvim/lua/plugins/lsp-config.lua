return {
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			_servers = {
				"clangd",        -- c
				"gleam",         -- gleam
				"hls",           -- haskell
				"lua_ls",        -- lua
				"nil_ls",        -- nix
				"rust_analyzer", -- rust
				"sourcekit",     -- swift
				"taplo",         -- toml
			},
		},
		config = function(_, opts)
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			-- local _lspconfig = require("lspconfig")

			for _, server in pairs(opts._servers) do
				vim.lsp.config(server, { capabilities = capabilities })
			end

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
