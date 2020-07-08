" .vimrc
" AUTHOR: Greg Potts
" CREATED_ON: Feb 26, 2019

set nocompatible " Don't try to be vi
set history=500
filetype plugin indent on
syntax enable

" General
colo pottsga

let mapleader=","
set backspace=indent,eol,start " Sane backspacing
set autoread " Automatically read files changed outside of vim
set noswapfile " Disable .swp files
set nobackup " Disable .bak files

set hidden " TextEdit might fail if hidden is not set
set updatetime=300 " shorten update time for better user experience
set shortmess+=c " don't give ins-completion-menu messages
set signcolumn=yes " always show the signcolumn, otherwise text can shift
set cmdheight=2 " more command height for displaying messages
set clipboard=unnamed

source ~/.vim/ui.vim " ui configuration
source ~/.vim/plugins.vim " plugin installation/configuration
source ~/.vim/functions.vim " custom functions
source ~/.vim/autocmds.vim " autocmds for specific tasks
source ~/.vim/snippets.vim " custom snippets
source ~/.vim/language_settings.vim " language specific settings
