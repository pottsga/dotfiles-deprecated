set nocompatible        " Use Vim settings, rather than Vi settings
filetype off 		" required

" ========== VUNDLE INIT/PLUGIN INSTALL ==========
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
" alternatively, pass a path where Vundle should install plugins call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required Plugin 'gmarik/vundle'
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'mattn/emmet-vim'
Bundle 'lepture/vim-jinja'
Plugin 'tpope/vim-commentary'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/syntastic'
Plugin 'joshdick/onedark.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'itchyny/lightline.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-sensible'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-sleuth'
Plugin 'dhruvasagar/vim-table-mode'
" Plugin 'posva/vim-vue'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" ========== GENERAL CONFIG ==========
set number 			" Use line numbers
set backspace=indent,eol,start  " Allow backspace in insert mode
set history=1000		" Store lots of :cmdline history
set showmode			" Show current mode at the bottom
set gcr=a:blinkon0		" Disable cursor blink
set autoread			" Reload files changed outside vim

set guifont=Monaco:h12
set encoding=UTF-8

set guioptions=
set autochdir
set autowriteall

set tabstop=2
set shiftwidth=2
set softtabstop=2

au FileType php setl sw=4 sts=4 ts=4 et
au BufNewFile,BufRead,BufReadPost *.vue set syntax=HTML

set expandtab

set hidden			" Allow buffers to exist in the background
				" without being in a window

syntax on 			" Turn on syntax highlighting

let mapleader=","		" Change the leader key to , instead of \

" Show a red marker if the line is > 80 characters
highlight ColorColumn ctermbg=red
call matchadd('colorColumn', '\%81v', 100)

map <C-o> <C-w>w 		

set noswapfile			" Turn off the swap file
set nobackup
set nowb

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ========== PLUGIN CONFIGURATION ==========

" CONFIGURE EMMET
let g:user_emmet_settings = {
\ 'indentation': '  ',
\ 'javascript.jsx': {
\   'extends': 'jsx',
\ }
\}
let g:user_emmet_complete_tag = 1
let g:user_emmet_expandabbr_key='<C-J>'

" CONFIGURE NERD TREE
map <C-t> :NERDTreeToggle<Enter>

" CONFIGURE CTRLP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

" CONFIGURE VIM-MARKDOWN
let g:vim_markdown_folding_disabled = 1

" CONFIGURE ONEDARK
let g:onedark_termcolors=256

" CONFIGURE LIGHTLINE
let g:lightline = {
\'colorscheme': 'onedark',
\}

" CONFIGURE TABLE MODE
let g:table_mode_corner_corner="+"

" CONFIGURE COMPLETION
set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

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

colorscheme onedark
