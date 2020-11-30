set runtimepath=config,$VIMRUNTIME
set packpath+=config/site

colorscheme monokai

" Buffers can exist in the background without being in a window
set hidden

" Line numbers
set number

" Indentation
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

" Wrapping
set nowrap " Don't wrap lines by default
set linebreak " When wrapping, break at convenient points

" Switching between buffers
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Yank to and put from system clipboard
set clipboard=unnamed

" ------------------------------------------------------------------------------
augroup fp
  autocmd!
  autocmd BufNewFile,BufReadPost * call rpcnotify(0, 'Fp', 'buf_new', str2nr(expand('<abuf>')))
augroup end
