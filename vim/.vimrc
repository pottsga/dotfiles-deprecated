" Plugins {
    " Install vim-plug curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    " Installation {
        call plug#begin()
        
        Plug 'ctrlpvim/ctrlp.vim'       " CTRL+P
        Plug 'mattn/emmet-vim'          " Emmet
        Plug 'drmingdrmer/vim-tabbar'   " Tabbar

        call plug#end()
    " }
    
    " Configuration {
    
        " Emmet {
            let g:user_emmet_settings = {
            \ 'indentation': '  ',
            \ }
            let g:user_emmet_complete_tag=1
            let g:user_emmet_expandabbr_key='<C-J>'
        " }

    " }
" }


" General {
    set nocompatible			        " Use VIM settings not VI settings	
    set noswapfile                      " Disable .swp files
    set nobackup                        " Disable backup files
    set backspace=indent,eol,start      " Sane backspacing
    set confirm                         " Ask before closing a file
" }

" Text-rendering {
	set encoding=utf-8		        " Editor's encoding is UTF8
	set scrolloff=5			        " Number of lines to keep under the current line
	set sidescrolloff=5		        " Number of columns to keep to the right
	syntax enable			        " Turn on syntax highlighting
" }

" Indentation {
	set autoindent 			        " New lines inhreit indentation of previous
	set expandtab			        " Convert tabs to spaces
	set shiftwidth=4		        " When shifting, indent four spaces
	set tabstop=4			        " Set number of spaces for a tab
	set smarttab			        " Set 'tabstop' number of spaces on tab press

    " HTML-specific indentation
	autocmd BufRead,BufNewFile 
		\ *.htm,*.html 
		\ setlocal tabstop=2 shiftwidth=2 softtabstop=2
" }

" Search {
    set hlsearch!                   " Enable highlight-searchign
    set incsearch                   " Show partial matches
    set smartcase                   " Switch to case-sensitive when contains upcase letter
" }

" UI {
    set number                      " Show line numbers
    set nowrap                      " Don't wrap lines
    set ruler                       " Always show the cursor's position
    set mouse=a                     " Allow mouse for scrolling/resizing
    set splitbelow                  " Split horizontally below the current pane (sane)
    set splitright                  " Split vertically to the right of the current pane (sane)
" }

" Navigation {
    " Move left, right, up, and down in windows with H,J,K,L
    nnoremap <C-J> <C-W><C-J>
    nnoremap <C-K> <C-W><C-K>
    nnoremap <C-L> <C-W><C-L>
    nnoremap <C-H> <C-W><C-H>
" }

" Colorscheme {
    colo morning                    " Set colorscheme
" }


