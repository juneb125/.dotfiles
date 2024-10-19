-- Settings --

-- navigation settings
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
-- vim.cmd("set ignorecase=true") -- ignore case when searching
-- vim.cmd("set smartcase=true") -- if you include mixed case in your search, assumes you want case-sensitive

-- misc. settings
vim.cmd("set mouse=a") -- enable mouse click
vim.cmd("syntax on") -- ?

vim.opt.clipboard:append("unnamedplus") -- use system clipboard as default register

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set('n', '<leader>nh', ':nohl<CR>', { desc = "Clear search highlights" })
