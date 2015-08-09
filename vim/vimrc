syntax on
set background=dark

" Indentation
set expandtab
set tabstop=2
set shiftwidth=2
set smarttab
set autoindent

" Searching
set hlsearch    " Highlight all search results
set ignorecase  " Ignore case in search patterns
set smartcase   " Override 'ignorecase' if search contains upper case characters

" Use Bash-style tab completion
set wildmode=longest,list
set wildmenu

set foldmethod=syntax
set foldlevel=999

" File type indentation
set nocompatible
filetype plugin indent on
syntax enable

" Use jk as escape
inoremap jk <esc>
cnoremap jk <c-c>

" Ctags
set tags=./tags;/

" Use Ctrl-n to jump up the tag stack (opposite of Ctrl-t)
nnoremap <c-n> :tag<cr>

" vim-plug
call plug#begin('~/.vim/plugged')

Plug 'kien/ctrlp.vim'
Plug 'Valloric/YouCompleteMe', { 'for': ['c', 'cpp', 'python'], 'do': './install.sh' }
autocmd! User YouCompleteMe call youcompleteme#Enable()

call plug#end()

" YouCompleteMe settings
let g:ycm_autoclose_preview_window_after_insertion = 1
