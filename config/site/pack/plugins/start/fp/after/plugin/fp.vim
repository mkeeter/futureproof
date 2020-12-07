
augroup fp
  autocmd!
  autocmd FileType glsl call rpcnotify(0, 'Fp', 'buf_new', str2nr(expand('<abuf>')))
  autocmd FileType qf call AdjustWindowHeight(2, 10)
augroup end

let s:bg= synIDattr(synIDtrans(hlID("SignColumn")), "bg#")
let s:fg= synIDattr(synIDtrans(hlID("ErrorMsg")), "bg#")
exe ":highlight fpErr guifg=" . s:fg . " guibg=" . s:bg
sign define fpErr text=>> texthl=fpErr

" Very simple format for error messages
set errorformat=%l:%m

" Resize the quickfix window to fix errors
function! AdjustWindowHeight(min_rows, max_rows)
  execute max([min([line("$"), a:max_rows]), a:min_rows]) . "wincmd _"
endfunction
