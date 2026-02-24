-- User commands & Lua functions --

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

return M
