-- Settings --

-- navigation ui settings
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
vim.cmd("syntax on") -- turn syntax highlighting on (?)
vim.cmd("let g:netrw_liststyle=3") -- set the style of Vim's built-in file explorer to tree
vim.opt.wrap = false -- turn off line wrap
vim.opt.termguicolors = true -- ?
vim.opt.background = "dark" -- colorschemes that have both light/dark modes will be set to dark
vim.opt.signcolumn = "yes" -- show sign column so that text doesn't shift


vim.opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split window behavior
vim.opt.splitright = true -- split vertical window to the right
vim.opt.splitbelow = true -- split horizontal window to the bottom

-- keymaps
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- the following keymaps are from josean-dev/dev-environment-files on github
vim.keymap.set('n', '<leader>nh', ':nohl<CR>', { desc = "Clear search highlights" }) -- clears search entry

-- window management
vim.keymap.set('n', '<leader>sv', '<C-w>v', { desc = "Split window vertically" }) -- split window vertically
vim.keymap.set('n', '<leader>sh', '<C-w>s', { desc = "Split window horizontally" }) -- split window horizontally
vim.keymap.set('n', '<leader>se', '<C-w>=', { desc = "Make splits equal size" }) -- make split windows equal width & height
vim.keymap.set('n', '<leader>sx', '<cmd>close<CR>', { desc = "Close current split" }) -- close current split window

-- tab management
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab