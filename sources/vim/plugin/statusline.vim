" TODO: highlighting, B, & icons

" mode table {{{
" vimscript-ified Mode.map table from
"   github:nvim-lualine/lualine.nvim@master (path: lua/lualine/utils/mode.lua)
let s:mode_map = {
      \ 'n'      : 'NORMAL',
      \ 'no'     : 'O-PENDING',
      \ 'nov'    : 'O-PENDING',
      \ 'noV'    : 'O-PENDING',
      \ "no\<C-V>": 'O-PENDING',
      \ 'niI'    : 'NORMAL',
      \ 'niR'    : 'NORMAL',
      \ 'niV'    : 'NORMAL',
      \ 'nt'     : 'NORMAL',
      \ 'ntT'    : 'NORMAL',
      \ 'v'      : 'VISUAL',
      \ 'vs'     : 'VISUAL',
      \ 'V'      : 'V-LINE',
      \ 'Vs'     : 'V-LINE',
      \ "\<C-V>" : 'V-BLOCK',
      \ "\<C-V>s": 'V-BLOCK',
      \ 's'      : 'SELECT',
      \ 'S'      : 'S-LINE',
      \ "\<C-S>" : 'S-BLOCK',
      \ 'i'      : 'INSERT',
      \ 'ic'     : 'INSERT',
      \ 'ix'     : 'INSERT',
      \ 'R'      : 'REPLACE',
      \ 'Rc'     : 'REPLACE',
      \ 'Rx'     : 'REPLACE',
      \ 'Rv'     : 'V-REPLACE',
      \ 'Rvc'    : 'V-REPLACE',
      \ 'Rvx'    : 'V-REPLACE',
      \ 'c'      : 'COMMAND',
      \ 'cv'     : 'EX',
      \ 'ce'     : 'EX',
      \ 'r'      : 'REPLACE',
      \ 'rm'     : 'MORE',
      \ 'r?'     : 'CONFIRM',
      \ '!'      : 'SHELL',
      \ 't'      : 'TERMINAL',
      \ }
" }}}

"  
"  
" 

function! s:GetStlA()
  try   | return printf(" %s ", s:mode_map[mode()])
  catch | return toupper(mode()))
  endtry
endfunction

" TODO: git & diagnostic info
function! s:GetStlB()
  let b = ''

  " git {{{
  let b += printf("  %s", 'branch')
  let b += '  diff'
  " }}}

  " diagnostics {{{
  let b += printf("  %s", 'diag')
  " }}}

  return empty(b) ? '' : $" {b} "
endfunction

function! GetStlLeft()
  return printf(" %s%s%%< %%t %%m", s:GetStlA(), s:GetStlB())
endfunction

" ALL DONE
function! GetStlRight()
  let fileicon = '?'
  let x = printf(" %s[%s]  %s %s", &fenc, &ff, fileicon, &ft)

  let [cur_line, cur_col] = getpos('.')[1:2]
  let total = line('$')
  let y = ''
  if cur_line == 1
    let y = 'Top'
  elseif cur_line == total
    let y = 'Bot'
  else
    let y = printf("%2.0f%%", 100 * cur_line / total)
  endif

  let z = printf("%3d:%-2d", cur_line, cur_col)

  return printf("%s  %s  %s ", x, y, z)
endfunction
