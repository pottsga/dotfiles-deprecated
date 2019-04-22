" .vimrc
" AUTHOR: Greg Potts
" CREATED_ON: Feb 26, 2019

set nocompatible " Don't try to be vi
filetype plugin indent on
syntax enable 

" General
let mapleader=","
set backspace=indent,eol,start " Sane backspacing
set autoread " Automatically read files changed outside of vim
set noswapfile " Disable .swp file
set nobackup " Disable backup files

" Text
set encoding=utf-8
set autoindent " New lines inherit indentation of previous
set expandtab " Convert tabs to spaces
set shiftwidth=2 " When shifting '>>' or '<<' indent x spaces
set tabstop=2 " Number of spaces for a tab
set nowrap

" UI
colo pottsga "~/.vim/colors/pottsga.vim
set ruler " Show the ruler
set number " Show line numbers
set splitbelow " Split horizontally below the current pane (sane)
set splitright " Split vertically to the right of the current pane (sane)
set hlsearch " Enable highlight-searching
set incsearch " Show partial matches
set smartcase " Switch to case-sensitive when contains upcase letter
set laststatus=2 " Show the status line

source ~/.vim/plugins.vim
source ~/.vim/functions.vim
source ~/.vim/autocmds.vim
