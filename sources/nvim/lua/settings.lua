-- Settings --
-- to make settings less verbose
local opt = vim.opt

-- ui {{{
opt.number = true         -- add line numbers
opt.cursorline = true     -- highlight current cursorline
opt.showmatch = true      -- show matching brackets
opt.winborder = "rounded" -- always use rounded borders for floating windows
opt.termguicolors = true  -- use GUI colors for the terminal
opt.signcolumn = "yes"    -- show sign column so that text doesn't shift
opt.showmode = false      -- lualine already shows the mode
opt.helpheight = math.min(20, vim.o.columns)
--- }}}

-- tabs & indentation
opt.tabstop = 2    -- number of columns occupied by a tab
opt.shiftwidth = 2 -- number of spaces to use for each step of (auto)indent

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true  -- search case-sensitively if search pattern has uppercase chars

-- misc. settings {{{
opt.mouse = "nv"     -- enable mouse clicks only in normal & visual mode
opt.wrap = false     -- turn off line wrap by default
opt.swapfile = false -- turn off swapfile
opt.history = 2500   -- reduce cmd history from 10k to 2.5k
opt.foldmethod = "marker"
-- }}}

-- same as '../spell/en.utf-8.add'
opt.spellfile = vim.fn.stdpath("config") .. "/spell/en.utf-8.add"

-- default split window behavior
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

opt.clipboard:append("unnamedplus") -- use system clipboard as default register
