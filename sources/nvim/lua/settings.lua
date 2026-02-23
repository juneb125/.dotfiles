-- Settings --
-- to make settings less verbose
local opt = vim.opt

-- ui {{{
opt.number = true         -- add line numbers
opt.cursorline = true     -- highlight current cursorline
opt.showmatch = true      -- show matching brackets
opt.winborder = "rounded" -- always use rounded borders for floating windows
opt.termguicolors = true  -- enable 24-bit RGB color
opt.signcolumn = "yes"    -- show sign column so that text doesn't shift
opt.showmode = false      -- lualine already shows the mode
opt.helpheight = math.min(20, vim.o.columns)

-- nvim's *builtin* popup menu
opt.pumborder = "none" -- no border
opt.pumheight = 20     -- max num of completions values shown at a time
--- }}}

-- tabs & indentation
opt.tabstop = 2    -- num of columns occupied by a tab
opt.shiftwidth = 2 -- num of spaces to use for each step of (auto)indent

-- search settings
opt.ignorecase = true -- search case-insensitively
opt.smartcase = true  -- search case-sensitively if pattern has uppercase chars

-- misc. settings {{{
opt.mouse = "nv"     -- enable mouse clicks only in normal & visual mode
opt.wrap = false     -- turn off line wrap by default
opt.swapfile = false -- turn off swapfile
opt.history = 500    -- reduce cmd history (default = 10k)
opt.foldmethod = "marker"
opt.scrollback = 10  -- scroll no more than 10 lines off window
-- }}}

-- same as '../spell/en.utf-8.add'
opt.spellfile = vim.fn.stdpath("config") .. "/spell/en.utf-8.add"

-- default split window behavior
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- builtin nvim completions & formatting
opt.completeopt = "menu,popup,noinsert"
opt.wildignorecase = true  -- case-insensitively complete file names
opt.formatoptions = "jtcl" -- see ":h 'fo-table'", old = "jtcroal"

vim.filetype.add({
	-- recognize {lhs} file pattern as a {rhs} file
	pattern = {
		["flake.lock"] = "json",
		["Cargo.lock"] = "toml"
	}
})
