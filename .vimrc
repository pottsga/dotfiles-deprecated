" .vimrc
" AUTHOR: Greg Potts
" CREATED_ON: Feb 26, 2019
" ITALICS: https://sookocheff.com/post/vim/italics/ 
" PLUG: curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" Plugins {
    call plug#begin()

    Plug 'vim-python/python-syntax'     " Improved Python syntax
    Plug 'pangloss/vim-javascript'      " Improved JS syntax
    Plug 'leafgarland/typescript-vim'   " Typescript Syntax
    Plug 'mxw/vim-jsx'                  " JSX-syntax
    Plug 'plasticboy/vim-markdown'      " Markdown syntax
    Plug 'Glench/Vim-Jinja2-Syntax'     " Jinja2

    Plug 'kien/ctrlp.vim'               " CTRLP
    Plug 'mattn/emmet-vim'              " Emmet
    Plug 'scrooloose/nerdtree'          " NERDTree
    Plug 'mkitt/tabline.vim'            " Better tab-line

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
    set mouse=nicr                      " Allow mouse for scrolling/resizing
    set splitbelow                      " Split horizontally below the current pane (sane)
    set splitright                      " Split vertically to the right of the current pane (sane)
    set showcmd                         " Show command in the bottom bar
    set wildmenu                        " Visual autocomplete for command menu
    set colorcolumn=80                  " Show a visual marker at 75 cols 
    " set cursorline                      " Enable the cursor line
    set laststatus=2                    " Always show the statusline
    set statusline=%f

    if !has('gui-running')
        set t_Co=256                    " 256 colors
    endif
" }

" Navigation {
    " Move left, right, up, and down in windows with H,J,K,L
    nnoremap <C-J> <C-W><C-J>
    nnoremap <C-K> <C-W><C-K>
    nnoremap <C-L> <C-W><C-L>
    nnoremap <C-H> <C-W><C-H>

    nnoremap <leader>j 5<C-W>-
    nnoremap <leader>k 5<C-W>+
    nnoremap <leader>l 5<C-W><
    nnoremap <leader>h 5<C-W>>
" }

" Functions {
    nmap <leader>sp :call <SID>SynStack()<CR>
    function! <SID>SynStack()
      if !exists("*synstack")
        return
      endif
      echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
    endfunc

    nmap <leader>sg :call <SID>SynGroup()<CR>
    function! <SID>SynGroup()
        let l:s = synID(line('.'), col('.'), 1)
        echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
    endfun

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
    " CTRLP {
        let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
        if executable('ag')
            let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
        endif 
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

    " Python-syntax {
        let g:python_highlight_all=1 
    " }
" }

