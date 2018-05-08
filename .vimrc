set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" =-=-=-=-=-=-=-=-=-(BEGIN PLUGIN INSTALLATION)-=-=-=-=-=-=-=-=-=-=-=-
" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'xuyuanp/nerdtree-git-plugin'
Plugin 'airblade/vim-gitgutter'
Plugin 'mattn/emmet-vim'
Bundle 'lepture/vim-jinja'
Plugin 'tpope/vim-commentary'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'morhetz/gruvbox'
Bundle 'jistr/vim-nerdtree-tabs'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'cespare/vim-toml'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" =-=-=-=-=-=-=-=-=-(END PLUGIN INSTALLATION)-=-=-=-=-=-=-=-=-=-=-=-
syntax enable 
set ruler
set number

" Remap change window command to C-o
map <C-o> <C-w>w

" CONFIGURE EMMET
let g:user_emmet_settings = {
\ 'indentation': '  ',
\ 'javascript.jsx': {
\   'extends': 'jsx',
\ }
\}
let g:user_emmet_complete_tag = 1
let g:user_emmet_expandabbr_key='<C-J>'

map <C-t> :NERDTreeToggle<Enter>

" colorscheme gruvbox
" set noeb vb t_vb =
set guioptions=
set encoding=UTF-8
set guifont=Monaco:h12

:hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white

set autochdir
set autowriteall

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
