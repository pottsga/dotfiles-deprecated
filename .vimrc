set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
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

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" =-=-=-=-=-=-=-=-=-(END PLUGIN INSTALLATION)-=-=-=-=-=-=-=-=-=-=-=-
syntax enable 
set ruler
set number

" Remap change window command to C-o
map <C-o> <C-w>w
" Remap quit window command
map <C-q> <C-w>q
" Remap vertical split window
map <C-v> <C-w>v
" Remap horizontal split window
map <C-h> <C-w>s

set backspace=2 " make backspace work like most other programs

set tabstop=4
autocmd Filetype html setlocal tabstop=2 sw=2 expandtab
autocmd Filetype jinja setlocal tabstop=2 sw=2 expandtab
autocmd Filetype css setlocal tabstop=2 sw=2 expandtab

inoremap <C-a> <Home>
inoremap <C-e> <End>
nnoremap <C-a> 0
nnoremap <C-e> $
" CONFIGURE EMMET
let g:user_emmet_settings = {'indentation': '  '}
let g:user_emmet_complete_tag = 1
let g:user_emmet_expandabbr_key='<C-J>'

map <C-t> :NERDTreeToggle<Enter>

nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

colorscheme gruvbox
set noeb vb t_vb =
set guioptions=
set encoding=UTF-8
set guifont=Monaco:h12


