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
" Plugin 'plasticboy/vim-markdown'
Plugin 'tpope/vim-surround'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" =-=-=-=-=-=-=-=-=-(END PLUGIN INSTALLATION)-=-=-=-=-=-=-=-=-=-=-=-

" ==================
" BASE CONFIGURATION
" ==================
syntax enable 
set ruler
set number
set noeb vb t_vb=
set guioptions=
set encoding=UTF-8
set guifont=Monaco:h12
set laststatus=2
set autochdir
set autowriteall
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
:hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white
:syn sync fromstart
:syn sync minlines=10000
autocmd BufEnter * :syntax sync fromstart
map <C-o> <C-w>w

:inoremap <C-l>c :!pdflatex %<CR>
:nnoremap <C-l>c :!pdflatex %<CR>
" ==================
" BASE CONFIGURATION
" ==================

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
