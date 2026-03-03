" TODO: highlighting, A, B, & icons

"  
"  
" 

" TODO: git & diagnostic info
" BUG: 'mode()' just shows '0' ???
function! GetStlAB()
	let b = printf(" %s ", mode())

	" git {{{
	let b += printf('  %s', "branch")
	let b += "  diff"
	" }}}

	" diagnostics {{{
	let b += printf("  %s", "diag")
	" }}}

	return b . " "
endfunction

function! GetStlLeft()
	return printf(" %%{GetStlAB()}%%< %%t %%m")
endfunction

" ALL DONE
function! GetStlRight()
  let fileicon = "?"
  let x = printf("%s[%s]  %s %s", &fileencoding, &fileformat, fileicon, &filetype)

  let [cur_line, cur_col] = getpos(".")[1:2]
  let total = line("$")
	let y = ""
  if cur_line == 1
    let y = "Top"
  elseif cur_line == total
    let y = "Bot"
  else
    let y = printf("%.0f%%", 100 * cur_line / total)
  endif

  let z = printf("%3d:%-2d", cur_line, cur_col)

  return printf("%s  %s  %s ", x, y, z)
endfunction
