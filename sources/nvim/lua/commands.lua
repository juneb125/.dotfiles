-- User commands & Lua functions --

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

local M = {}

--- Updates `vim.pack` and treesitter grammars. Designed to be easily passed in
--- via nvim cli and run before any configuration: `nvim --cmd 'lua require("commands").update_nvim()'`
--- `quit` defaults to `false`
---@param quit boolean? whether to quit nvim after function is finished
M.update_nvim = function(quit)
	if vim.fn.has("nvim-0.12") and vim.pack ~= nil then
		vim.pack.update()
	end
	if package.loaded["nvim-treesitter"] then
		vim.cmd("TSUpdate")
	end

	if quit or false then
		vim.cmd("wqa!")
	end
end

M.picker_completions = {}

M.picker_completions.general = function(ArgLead, _, _)
	-- excluded: cliphist, lazy, pickers, zoxide
	local choices = {
		"autocmds", "buffers", "colorschemes", "command_history", "commands",
		"diagnostics", "diagnostics_buffer", "explorer", "files",
		-- [[ git-related ones are in PickGit ]]
		"grep", "grep_buffers", "grep_word", "help", "highlights",
		"icons", "jumps", "keymaps", "lines", "loclist",
		-- [[ lsp-related ones are in PickLsp ]]
		"man", "marks", "notifications", "picker_actions", "picker_format",
		"picker_layouts", "picker_preview", "projects", "qflist", "recent", "registers",
		"resume", "search_history", "smart", "spelling", "treesitter", "undo"
	}
	if ArgLead == "" then
		return choices
	end
	return vim.fn.matchfuzzy(choices, ArgLead)
end

M.picker_completions.git = function(ArgLead, _, _)
	local choices = { "branches", "diff", "files", "grep", "log", "log_file", "log_line", "stash", "status" }
	if ArgLead == "" then
		return choices
	end
	return vim.fn.matchfuzzy(choices, ArgLead)
end

M.picker_completions.lsp = function(ArgLead, _, _)
	local choices = {
		"config", "declarations", "definitions", "implementations", "references",
		"symbols", "type_definitions", "workspace_symbols"
	}
	if ArgLead == "" then
		return choices
	end
	return vim.fn.matchfuzzy(choices, ArgLead)
end

return M
