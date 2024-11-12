-- Settings --

-- to make settings less verbose
local opt = vim.opt

-- navigation ui
opt.number = true     -- add line numbers
opt.cursorline = true -- highlight current cursorline
opt.showmatch = true  -- show matching brackets

-- tabs & indentation
opt.tabstop = 2                      -- number of columns occupied by a tab
opt.shiftwidth = 2                   -- number of spaces to use for each step of (auto)indent
opt.autoindent = true                -- indent a new line the same amount as the line just typed
opt.smarttab = true                  -- make a <Tab> in front of a line insert spaces according to 'shiftwidth'
opt.softtabstop = 2                  -- see multiple spaces as tabstops so <BS> does the right thing
vim.cmd("filetype plugin indent on") -- allow auto-indenting depending on file type

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true  -- if you include mixed case in your search, assumes you want case-sensitive

-- misc. settings
opt.mouse = "a"                     -- enable mouse click
opt.syntax = "on"                   -- turn syntax highlighting on (?)
vim.g.netrw_liststyle = 3           -- set the style of Vim's built-in file explorer to 'tree'
opt.wrap = false                    -- turn off line wrap by default (see keymap in ./keymaps.lua)
opt.termguicolors = true            -- use GUI colors for the terminal
opt.background = "dark"             -- colorschemes that have both light/dark modes will be set to dark
opt.signcolumn = "yes"              -- show sign column so that text doesn't shift
opt.swapfile = false                -- turn off swapfile

opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- default split window behavior
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom
