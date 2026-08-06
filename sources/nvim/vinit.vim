" Options {{{1
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

" Autocommands {{{1
" I couldn't get lua to do this :( , so vimscript it is
" almost completely from Credits #5
augroup local_spell_check
  autocmd FileType markdown,text,nroff setlocal spell
augroup end

" vimscript b/c it's less verbose than lua in this case
" et=expandtab fp=formatprg ts=tabstop sw=shiftwidth
augroup per_file_formatting
  autocmd FileType nix,vim,sh,bash,zsh setlocal ts=2 sw=2 et
  autocmd FileType json,jsonc setlocal ts=2 sw=2 et
  autocmd FileType c,markdown,text setlocal ts=4 sw=4 noet
  autocmd Filetype just,justfile setlocal ts=4 sw=4 et
  autocmd Filetype make,makefile,gitconfig setlocal ts=4 sw=4 noet
  autocmd Filetype man,roff,nroff,troff,groff setlocal ft=nroff tw=80 noet
augroup end
