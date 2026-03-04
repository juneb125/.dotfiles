" A super basic file explorer
" Like oil.nvim's float, but read-only and worse
"
" Name: file_explorer.vim

" TODO: highlighting (bg, text, & border)
" BUG: cursor in bg window is still visible :/
function! s:FexOpenWin(title, contents, filter, callback)
  let minwidth = float2nr(winwidth(0) * 0.7)
  let minheight = float2nr(winheight(0) * 0.7)
  let title_path_fmt = substitute(a:title, getenv("HOME"), '~', '')
  let winid = popup_create(a:contents, #{
        \ minwidth: minwidth - 2,
        \ minheight: minheight,
        \ title: title_path_fmt,
        \ pos: 'center',
        \ border: [1, 1, 1, 1],
        \ borderchars: ['─', '│', '─', '│', '╭', '╮', '╯', '╰'],
        \ padding: [0, 1, 0, 1],
        \ cursorline: v:true,
        \ filter: a:filter,
        \ callback: a:callback,
        \ })

  call setwinvar(winid, 'title', title_path_fmt)
  call setwinvar(winid, 'cwd', a:title)
  return winid
endfunction

" handles keyboard & mouse events while in popup win
" BUG: <BS> not being registered ???
function! s:FexFilter(winid, key)
  if a:key == 'q'
    return popup_close(a:winid, -1)
  elseif a:key == "\<BS>"
    " '..' is always going to be the first item
    return 1
  endif
  " to see what key combos pop_filter_menu()
  " handles, see ':h popup_filter_menu()'
  "
  " cancelling the menu returns -1
  return popup_filter_menu(a:winid, a:key)
endfunction

" handles what happens when the user exits or selects an item
function! s:FexCallback(winid, result)
  if a:result == -1 | return | endif

  let selection = a:result == 1 ? '..' :
        \ getbufline(winbufnr(a:winid), a:result)[0]
  let full_sel = simplify(getwinvar(a:winid, 'cwd') . selection)

  if isdirectory(full_sel)
    return FloatExplore(full_sel)
  endif
  " idk something weird happens when chdir gets called
  " try | call chdir(full_sel, 'buffer') | catch | endtry
  exec ':edit ' . full_sel
endfunction

function! FloatExplore(dir = getcwd(0))
  if !isdirectory(a:dir) | return | endif

  " always have a trailing '/'
  let fmt_dir = matchend(a:dir, ".*/$") != -1 ? a:dir : a:dir . '/'

  " format & sort children
  let dirs = filter(readdir(a:dir),
        \ { _, val -> isdirectory(fmt_dir . val) })
  let dirs = ['../'] + map(dirs, { _, val -> val . '/' })
  let others = filter(readdir(a:dir),
        \ { _, val -> !isdirectory(fmt_dir . val) })

  call s:FexOpenWin(fmt_dir, dirs + others, 's:FexFilter', 's:FexCallback')
endfunction


command! -nargs=? -complete=file Fexplore call FloatExplore(<f-args>)
command! -nargs=? -complete=file Fex call FloatExplore(<f-args>)

