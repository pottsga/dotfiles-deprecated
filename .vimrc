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
Bundle 'jistr/vim-nerdtree-tabs'
" Plugin 'pangloss/vim-javascript'
" Plugin 'mxw/vim-jsx'
Plugin 'scrooloose/syntastic'
Plugin 'plasticboy/vim-markdown'
Plugin 'joshdick/onedark.vim'
Plugin 'sheerun/vim-polyglot'
" Plugin 'vim-airline/vim-airline'
Plugin 'itchyny/lightline.vim'

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
set laststatus=2
:hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white

let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }

set autochdir
set autowriteall

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Fix syntax highlighting lag
:syn sync minlines=999999

let g:onedark_termcolors=256

let g:lightline = {
\ 'colorscheme': 'onedark',
\ }

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

syntax on
colorscheme onedark


