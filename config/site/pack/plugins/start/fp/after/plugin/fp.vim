
augroup fp
  autocmd!
  autocmd FileType glsl call rpcnotify(0, 'Fp', 'buf_new', str2nr(expand('<abuf>')))
augroup end

let s:bg= synIDattr(synIDtrans(hlID("SignColumn")), "bg#")
let s:fg= synIDattr(synIDtrans(hlID("ErrorMsg")), "bg#")
exe ":highlight fpErr guifg=" . s:fg . " guibg=" . s:bg
sign define fpErr text=>> texthl=fpErr

set errorformat=%l:%m

" Set up a background buffer for error messages
new
setlocal buftype=nofile
setlocal bufhidden=hide
setlocal noswapfile
setlocal nobuflisted
setlocal buftype=nowrite
q
