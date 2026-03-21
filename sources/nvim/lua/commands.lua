-- User commands --

local create_usercmd = vim.api.nvim_create_user_command
local utils = require("utils")

--- The names of all the plugins registered to vim.pack
---@type string[]
vim.g.all_plugins = vim.iter(ipairs(vim.pack.get())):map(
	function(_, v) return v.spec.name end
):totable()

-- vim.pack update user fn's {{{1
create_usercmd("PackUpdateAll", function() vim.pack.update() end, {
	nargs = 0,
	desc = "Update all vim.pack plugins"
})

create_usercmd("PackUpdate", function(opts)
	if #opts.fargs ~= 0 then
		vim.pack.update(opts.fargs)
		return
	end
	vim.api.nvim_echo({
		{ "Required arguments(s) not provided\n", "ErrorMsg" },
		{ "\nUse ':PackUpdateAll' to update all plugins\n", "WarningMsg" }
	}, true, {})
end, {
	nargs = "*",
	desc = "Update specific vim.pack plugins",
	complete = function(ArgLead, _, _)
		local choices = vim.g.all_plugins
		if ArgLead == "" then
			return choices
		end
		return vim.fn.matchfuzzy(choices, ArgLead)
	end,
})

-- Snacks picker user fn's {{{1
create_usercmd("Pick", function(opts)
	Snacks.picker(opts.fargs[1], {})
end, {
	nargs = "?",
	desc = "Quickly open a Snacks.nvim picker (default = files)",
	complete = utils.picker_completions.general,
})

create_usercmd("PickGit", function(opts)
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
