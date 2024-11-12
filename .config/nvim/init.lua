-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		lazyrepo,
		lazypath,
	})
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Vim settings
require("config.vim-options") -- base customizations
require("config.keymaps") -- keymaps

-- Setup lazy.nvim
require("lazy").setup({
	spec = { { import = "plugins" } },
	-- configure any other settings here
	install = { colorscheme = { "catppuccin" } }, -- colorscheme that will be used when installing plugins.
	checker = {
		enabled = true, -- automatically check for plugin updates,
		notify = true, -- and then notify us
	},
	change_detection = { notify = true },
})
