-- Settings --
-- to make settings less verbose
local opt = vim.opt

-- navigation ui
opt.number = true     -- add line numbers
opt.cursorline = true -- highlight current cursorline
opt.showmatch = true  -- show matching brackets

-- tabs & indentation
opt.tabstop = 2    -- number of columns occupied by a tab
opt.shiftwidth = 2 -- number of spaces to use for each step of (auto)indent

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true  -- if you include mixed case in your search, assumes you want case-sensitive
          
-- misc. settings
opt.mouse = "a"          -- enable mouse clicks
opt.wrap = false         -- turn off line wrap by default
opt.termguicolors = true -- use GUI colors for the terminal
opt.signcolumn = "yes"   -- show sign column so that text doesn't shift
opt.swapfile = false     -- turn off swapfile

opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- Keymaps --
vim.g.mapleader = " "

local map = vim.keymap.set
map("n", "<leader>o", ":update<CR>:source<CR>")
map("n", "<leader>nh", "<cmd>nohlsearch<CR>")

-- Plugins --
vim.pack.add({
		{ src = "https://github.com/catppuccin/nvim" },
})

vim.cmd("colorscheme catppuccin")
