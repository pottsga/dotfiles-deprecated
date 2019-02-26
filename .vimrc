" AUTHOR: Greg Potts

" SUMMARY: .vimrc

" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" Refer to the article at https://sookocheff.com/post/vim/italics/ on how to enable italics

" ---

" Plugins {
    call plug#begin()

    Plug 'pangloss/vim-javascript'      " Improved JS syntax
    Plug 'leafgarland/typescript-vim'   " Improved JS syntax
    Plug 'mxw/vim-jsx'                  " JSX-syntax
    Plug 'nelsyeung/twig.vim'           " Jinja2 syntax
    Plug 'kien/ctrlp.vim'               " CTRLP
    Plug 'rafi/awesome-vim-colorschemes' 
    Plug 'mattn/emmet-vim'              " Emmet
    Plug 'scrooloose/nerdtree'          " NERDTree
    Plug 'lepture/vim-jinja'            " vim-jinja
    Plug 'mkitt/tabline.vim'            " Tabline stuff

    call plug#end()
" }

" General {
    filetype plugin indent on
    let mapleader=","
    set nocompatible			        " Use VIM settings not VI settings	
    set noswapfile                      " Disable .swp files
    set nobackup                        " Disable backup files
    set backspace=indent,eol,start      " Sane backspacing
    set confirm                         " Ask before closing a file
    set autoread                        " Automatically read files changed outside vim

" }

" Colorscheme {
    " colo onedark                        " Set colorscheme
    set t_Co=256
    colo pottsga
" }

" Text-rendering {
	set encoding=utf-8		            " Editor's encoding is UTF8
	set scrolloff=8			            " Number of lines to keep under the current line
	set sidescrolloff=15	            " Number of columns to keep to the right
    set sidescroll=1

	syntax enable			            " Turn on syntax highlighting
" }

" Indentation {
	set autoindent 			            " New lines inhreit indentation of previous
	set expandtab			            " Convert tabs to spaces
	set shiftwidth=4		            " When shifting, indent four spaces
	set tabstop=4			            " Set number of spaces for a tab
	set smarttab			            " Set 'tabstop' number of spaces on tab press

    " HTML-specific indentation
	autocmd BufRead,BufNewFile 
		\ *.htm,*.html,*.twig,*.jinja,*.jinja2,*.cshtml
		\ setlocal tabstop=2 shiftwidth=2 softtabstop=2

    " CSS-specific indentation
	autocmd BufRead,BufNewFile 
		\ *.css,*.scss,*.sass 
		\ setlocal tabstop=2 shiftwidth=2 softtabstop=2

" }

" Netrw {
    let g:netrw_liststyle=3             " Show tree-style lists
    let g:netrw_banner=0                " Disable banner
    let g:netrw_browse_split=3          " Open new files in a new tab
    let g:netrw_cursor=0
" }

" Search {
    set hlsearch!                       " Enable highlight-searchign
    set incsearch                       " Show partial matches
    set smartcase                       " Switch to case-sensitive when contains upcase letter
" }

" UI {
    set number                          " Show line numbers
    set nowrap                          " Don't wrap lines
    set ruler                           " Always show the cursor's position
    set mouse=a                         " Allow mouse for scrolling/resizing
    set splitbelow                      " Split horizontally below the current pane (sane)
    set splitright                      " Split vertically to the right of the current pane (sane)
    set showcmd                         " Show command in the bottom bar
    set wildmenu                        " Visual autocomplete for command menu
    set colorcolumn=75                  " Show a visual marker at 75 cols 

" }

" Navigation {
    " Move left, right, up, and down in windows with H,J,K,L
    nnoremap <C-J> <C-W><C-J>
    nnoremap <C-K> <C-W><C-K>
    nnoremap <C-L> <C-W><C-L>
    nnoremap <C-H> <C-W><C-H>
" }

" Functions {
    "" Show highlighting groups for current word
    nmap <C-n> :call <SID>SynStack()<CR>
    function! <SID>SynStack()
        if !exists("*synstack")
            return
        endif
        echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
    endfunc
" }

" Plugins {
    " Tabline {
    " }
    " Emmet {
        let g:user_emmet_settings = {
        \   'indentation': '  ',
        \ }
        let g:user_emmet_complete_tag = 1
        let g:user_emmet_expandabbr_key = '<C-J>'
    " }

    " NERDTree {
        let g:NERDTreeDirArrows=0
        let g:NERDTreeNodeDelimiter = "\u00a0"
        let g:NERDTreeIgnore=[
        \   '__pycache__', '\.pyc$', '\.o$', '\.so$', '\.a$', '\.swp', 
        \   '*\.swp', '\.swo', '\.swn', '\.swh', '\.swm', '\.swl', '\.swk', 
        \   '\.sw*$', '[a-zA-Z]*egg[a-zA-Z]*', '.DS_Store'
        \]

        nnoremap <C-t> :NERDTreeToggle<CR>
    " }
" }

