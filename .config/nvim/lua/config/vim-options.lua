-- Settings --

-- navigation ui
vim.cmd("set number") -- add line numbers
vim.cmd("set cursorline") -- highlight current cursorline
vim.cmd("set showmatch") -- show matching brackets

-- tabs & indentation
vim.cmd("set tabstop=2") -- number of columns occupied by a tab (2 or 4)
vim.cmd("set shiftwidth=2") -- width for auto-indents
vim.cmd("set autoindent") -- indent a new line the same amount as the line just typed
vim.cmd("set smarttab") -- ?
vim.cmd("set softtabstop=2") -- see multiple spaces as tabstops so <BS> does the right thing
vim.cmd("filetype plugin indent on") -- allow auto-indenting depending on file type

-- search settings
vim.opt.ignorecase = true -- ignore case when searching
vim.opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- misc. settings
vim.cmd("set mouse=a") -- enable mouse click
vim.cmd("syntax on") -- turn syntax highlighting on (?)
vim.cmd("let g:netrw_liststyle=3") -- set the style of Vim's built-in file explorer to tree
vim.opt.wrap = false -- turn off line wrap by default (see keymap below)
vim.opt.termguicolors = true -- ?
vim.opt.background = "dark" -- colorschemes that have both light/dark modes will be set to dark
vim.opt.signcolumn = "yes" -- show sign column so that text doesn't shift

vim.opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- default split window behavior
vim.opt.splitright = true -- split vertical window to the right
vim.opt.splitbelow = true -- split horizontal window to the bottom

-- keymaps
-- vim.g.mapleader = " "
-- vim.g.maplocalleader = "\\"
