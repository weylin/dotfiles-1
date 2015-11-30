" Plug Bundle Configuration {{{
call plug#begin('~/.config/nvim/plugged')

" the tpope section {{{

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'

" Considering
" Plug 'tpope/vim-speeddating'

" }}}

Plug 'ctrlpvim/ctrlp.vim'
Plug 'w0ng/vim-hybrid'
Plug 'bling/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'Shougo/deoplete.nvim'

" Considering
" Plug 'svermeulen/vim-easyclip'

call plug#end()
" }}}

let g:python_host_prog = '/usr/local/bin/python'

set background=dark
colorscheme hybrid
set hidden                 " Allow unsaved buffers to be put in the background

" Leader
let mapleader = " "
let localleader = "\\"

" Toggle line numbering
set nonumber
set relativenumber
nnoremap <silent> <F7> :exe'se'&nu+&rnu?'rnu!':'nu'<CR>

" 2 spaces indent.
set softtabstop=2
set shiftwidth=2
set expandtab

" {{{ Leader shortcuts for system clipboard
vmap <leader>y "+y
vmap <leader>d "+d
nmap <leader>y "+y
nmap <leader>d "+d
nmap <leader>p "+p
nmap <leader>P "+P
vmap <leader>p "+p
vmap <leader>P "+P
" }}}

" Airline Settings {{{
let g:airline_powerline_fonts = 1
let g:airline_theme='tomorrow'
" }}}

" Setup folding {{{
set foldmethod=syntax
set foldcolumn=0
nnoremap <leader>z zMzvzz

" Enter to toggle folds, unless in Quickfix
nnoremap <silent> <CR> za
vnoremap <silent> <CR> za

autocmd CmdwinEnter * nnoremap <buffer> <cr> <cr>
autocmd FileType qf nnoremap <buffer> <cr> <cr>
" }}}

" FileType specific settings {{{
" Vim {{{
augroup ft_vim
    au!

    au FileType vim setlocal foldmethod=marker
    au FileType help setlocal textwidth=78
augroup END
" }}}
" }}}

" ctrlp settings {{{
let g:ctrlp_cmd = 'CtrlPBuffer'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:20,results:20'
let g:ctrlp_map = '<leader><space>'
let g:ctrlp_mruf_relative = 1
let g:ctrlp_custom_ignore = {
  \ 'dir': 'build\|target\|bin'
  \ }

nnoremap <leader>. :CtrlPBufTag<cr>

function! CtrlpSeed()
  :let g:ctrlp_default_input = tolower(expand('<cword>'))
  :CtrlP
  :let g:ctrlp_default_input = ''
endfunction

nnoremap <silent> <leader>g :call CtrlpSeed()<cr>
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ -g ""'
" }}}

let g:deoplete#enable_at_startup = 1