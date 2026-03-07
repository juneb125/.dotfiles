-- User commands --

--- The names of all the plugins registered to vim.pack
---@type string[]
vim.g.all_plugins = vim.iter(ipairs(vim.pack.get())):map(
	function(_, v) return v.spec.name end
):totable()

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
