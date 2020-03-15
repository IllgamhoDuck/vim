" Basic setting ---------------{{{
set number
set ts=8
set sw=4
set sts=4
set smartindent
set cindent
syntax on
"set noswapfile
"nohlsearch
"}}}

" leader ---------------{{{
let mapleader="-"
let maplocalleader="\\"
"}}}

" vimrc editing ----------------{{{
nnoremap <leader>ev :vs $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" }}}

"autocmd ---------------{{{

" iff command ------------------------{{{
autocmd FileType python     :iabbrev <buffer> iff if:<left>
autocmd FileType javascript :iabbrev <buffer> iff if ()<left>
"}}}

"vimscript file setting -----------------------{{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

"}}}

" statusline setting for markdown ------------{{{
augroup status_md
    autocmd!
    autocmd FileType markdown setlocal statusline=%f\ -\ filetype:%y
augroup END
" }}}

" mapping ----------------{{{
" normal mapping ------------{{{
nnoremap <leader>l :ls<cr>:b<space>
" }}}

" insert mapping ------------{{{
inoremap jk <esc>
inoremap <esc> <nop>
" }}}

" operator mapping ------------{{{
onoremap p i(
onoremap b /return<cr> 
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>
onoremap F :<c-u>normal! 0f(hviw<cr>

onoremap ih :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<cr>
onoremap ah :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rg_vk0"<cr>
onoremap i2h :<c-u>execute "normal! ?^--\\+$\r:nohlsearch\rkvg_"<cr>
onoremap a2h :<c-u>execute "normal! ?^--\\+$\r:nohlsearch\rg_vk0"<cr>
onoremap in@ :<c-u>execute "normal! /\\S\\+@\\S\\+\r:nohlsearch\rvE"<cr>
" }}}
" }}}
