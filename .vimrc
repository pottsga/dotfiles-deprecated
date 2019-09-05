" .vimrc
" AUTHOR: Greg Potts
" CREATED_ON: Feb 26, 2019

set nocompatible " Don't try to be vi
filetype plugin indent on
syntax enable

" General
colo pottsga
let mapleader=","
set backspace=indent,eol,start " Sane backspacing
set autoread " Automatically read files changed outside of vim
set noswapfile " Disable .swp files
set nobackup " Disable .bak files

" Text
set encoding=utf-8
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" UI
set laststatus=2 " Show the status line at the bottom
set ruler " Show ruler in the bottom-right hand corner
set splitright " Split vertically to the right of the current pane (sane)
set splitbelow " Split horizontally below the current pane (sane)
set ignorecase " Ignore case in search
set smartcase " Switch to case-sensitive when contains upcase letter
set incsearch " Show partial matches
set number " Show line number
set wildmenu " Visual autocomplete for command menu
set lazyredraw " Only redraw when you need to
set ttyfast
let g:loaded_matchparen=1

" Folding
set foldmethod=indent
set foldnestmax=10
set foldlevelstart=1 " start off pre-folded, remember folds exist
set foldopen= " don't automatically open my folds!

source ~/.vim/plugins.vim " plugin installation/configuration
source ~/.vim/functions.vim " custom functions
source ~/.vim/autocmds.vim " autocmds for specific tasks
source ~/.vim/snippets.vim " custom snippets
source ~/.vim/language_settings.vim
