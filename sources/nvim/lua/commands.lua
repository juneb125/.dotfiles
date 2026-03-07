-- User commands --

local utils = require("utils")

--- The names of all the plugins registered to vim.pack
---@type string[]
vim.g.all_plugins = vim.iter(ipairs(vim.pack.get())):map(
	function(_, v) return v.spec.name end
):totable()

-- vim.pack update user fn's {{{
vim.api.nvim_create_user_command("PackUpdateAll", vim.pack.update, { desc = "Update all vim.pack plugins" })

vim.api.nvim_create_user_command("PackUpdate", function(opts)
	vim.pack.update(opts.fargs)
end, {
	nargs = "+",
	desc = "Update specific vim.pack plugins",
	complete = function(ArgLead, _, _)
		local choices = vim.g.all_plugins
		if ArgLead == "" then
			return choices
		end
		return vim.fn.matchfuzzy(choices, ArgLead)
	end,
})
-- }}}

-- Snacks picker user fn's {{{
vim.api.nvim_create_user_command("Pick", function(opts)
	Snacks.picker(opts.fargs[1], {})
end, {
	nargs = "?",
	desc = "Quickly open a Snacks.nvim picker (default = files)",
	complete = utils.picker_completions.general,
})

vim.api.nvim_create_user_command("PickGit", function(opts)
	Snacks.picker("git_" .. opts.fargs[1], {})
end, {
	nargs = 1,
	desc = "Quickly open a Snacks.nvim Git-related picker",
	complete = utils.picker_completions.git,
})

vim.api.nvim_create_user_command("PickLsp", function(opts)
	Snacks.picker("lsp_" .. opts.fargs[1], {})
end, {
	nargs = 1,
	desc = "Quickly open a Snacks.nvim LSP-related picker",
	complete = utils.picker_completions.lsp,
})
-- }}}
