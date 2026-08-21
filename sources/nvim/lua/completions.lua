-- Completions --

if vim.g.loaded_cmp then
	return
end

local gh = "https://github.com/"
vim.pack.add({
	{ src = gh .. "hrsh7th/nvim-cmp" },
	{ src = gh .. "saadparwaiz1/cmp_luasnip" },     -- dependency for LuaSnip
	{ src = gh .. "rafamadriz/friendly-snippets" }, -- dependency for LuaSnip
	{ src = gh .. "L3MON4D3/LuaSnip" },
	{ src = gh .. "hrsh7th/cmp-nvim-lsp" }
})

local cmp = require("cmp")
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = {
		["<C-j>"] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end,
		["<C-k>"] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end,
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	}, {
		{ name = "buffer" },
	}),
})
