augroup fp
  autocmd!
  autocmd FileType glsl call rpcnotify(0, 'Fp', 'buf_new', str2nr(expand('<abuf>')))
  autocmd FileType qf call AdjustWindowHeight(2, 10)
  autocmd FileType qf nnoremap <buffer> <Enter> :call JumpToErrLine()<Enter>
augroup end

let s:bg= synIDattr(synIDtrans(hlID("SignColumn")), "bg#")
let s:fg= synIDattr(synIDtrans(hlID("ErrorMsg")), "bg#")
exe ":highlight fpErr guifg=" . s:fg . " guibg=" . s:bg
sign define fpErr text=>> texthl=fpErr

" Very simple format for error messages
set errorformat=%l:%m

" Resize the quickfix window to fix errors
function! AdjustWindowHeight(min_rows, max_rows)
  execute max([min([line("$") + 1, a:max_rows]), a:min_rows]) . "wincmd _"
  set nonumber
endfunction

function! JumpToErrLine()
  " Parse the location list line to get the line number
  let s:mx = '^.\([0-9]*\). .*$'
  let s:m = matchstr(getline("."), s:mx)
  let s:lineno = substitute(s:m, s:mx, '\1', '')

  " Jump back up to the text window
  wincmd k

  " Then move the cursor to that line
  call cursor(s:lineno, 0)
  echo ""
endfunction
