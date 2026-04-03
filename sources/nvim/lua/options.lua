-- Options --

vim.cmd([[
  " ui
  set number cursorline showmatch termguicolors noshowmode
  set winborder=rounded signcolumn=yes
  set pumborder=none pumheight=20 " nvim's *builtin* popup menu

  set tabstop=2 shiftwidth=2 " tabs & indentation
  set ignorecase smartcase   " search settings

  " misc.
  set nowrap noswapfile
  set mouse=nv history=500 foldmethod=marker scrollback=10

  " same as '../spell/en.utf-8.add'
  let &spellfile=$"{stdpath('config')}/spell/en.utf-8.add"

  set splitright splitbelow " default split behavior

  " builtin nvim completions & formatting
  set completeopt=menu,popup,noinsert
  set wildignorecase
  set formatoptions=jtcl " see ":h 'fo-table'"
]])

vim.opt.helpheight = math.min(15, vim.o.lines)
vim.opt.clipboard:append("unnamedplus")
