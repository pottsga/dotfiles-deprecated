" .vimrc
" AUTHOR: Greg Potts
" CREATED_ON: Feb 26, 2019
" ITALICS: https://sookocheff.com/post/vim/italics/ 
" PLUG: curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" Plugins {
    call plug#begin()

    " Syntax
    Plug 'vim-python/python-syntax'     " Improved Python syntax
    Plug 'pangloss/vim-javascript'      " Improved JS syntax
    Plug 'leafgarland/typescript-vim'   " Typescript Syntax
    Plug 'mxw/vim-jsx'                  " JSX-syntax
    Plug 'hail2u/vim-css3-syntax'       " CSS3 syntax
    Plug 'plasticboy/vim-markdown'      " Markdown syntax
    Plug 'Glench/Vim-Jinja2-Syntax'     " Jinja2
    Plug 'prettier/vim-prettier', { 'do': 'npm install' }

    Plug 'kien/ctrlp.vim'               " CTRLP
    Plug 'mattn/emmet-vim'              " Emmet
    Plug 'scrooloose/nerdtree'          " NERDTree
    Plug 'mkitt/tabline.vim'            " Better tab-line

    call plug#end()
" }

" General {
    filetype plugin indent on
    let mapleader=","
    set nocompatible			              " Use VIM settings not VI settings	
    set noswapfile                      " Disable .swp files
    set nobackup                        " Disable backup files
    set backspace=indent,eol,start      " Sane backspacing
    set confirm                         " Ask before closing a file
    set autoread                        " Automatically read files changed outside vim
    if system('uname -s') ==  "Darwin\n"
      set clipboard=unnamed "OSX
    else
      set clipboard=unnamedplus "GNU/Linux
    endif
    set paste                           " Paste from a windows or from vim
    set go+=a                           " Visual selection automatically copied to the clipboard
" }

" Colorscheme {
    colo pottsga
" }

" Text-rendering {
	set encoding=utf-8		                " Editor's encoding is UTF8
	set scrolloff=8			                  " Number of lines to keep under the current line
	set sidescrolloff=15                  " Number of columns to keep to the right
  set sidescroll=1

	syntax enable			                    " Turn on syntax highlighting
" }

" Syntax {
    autocmd BufRead,BufNewFile *.js setlocal syntax=javascript.jsx

    " Prettier
    let g:prettier#autoformat = 0
    autocmd BufWritePre
          \ *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html
          \ PrettierAsync

    augroup VimCSS3Syntax
      autocmd!
      autocmd FileType css setlocal iskeyword+=-
    augroup END
" }

" Indentation {
	set autoindent 			            " New lines inhreit indentation of previous
	set expandtab			            " Convert tabs to spaces
	set shiftwidth=2		            " When shifting, indent four spaces
	set tabstop=2			            " Set number of spaces for a tab
	set smarttab			            " Set 'tabstop' number of spaces on tab press

  " Python-specific indentation
	autocmd BufRead,BufNewFile 
		\ *.py
		\ setlocal tabstop=4 shiftwidth=4 softtabstop=4
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
    " set mouse=nicr                      " Allow mouse for scrolling/resizing
    set splitbelow                      " Split horizontally below the current pane (sane)
    set splitright                      " Split vertically to the right of the current pane (sane)
    set showcmd                         " Show command in the bottom bar
    set wildmenu                        " Visual autocomplete for command menu
    set colorcolumn=80                  " Show a visual marker at 75 cols 
    set laststatus=2                    " Always show the statusline

    if !has('gui-running')
        set t_Co=256                    " 256 colors
    endif

    au BufRead,BufNewFile *.md setlocal textwidth=80
" }

" Folding {
  set foldmethod=indent
  set foldlevel=2
  set nofoldenable
  set foldnestmax=10
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

    " Vim-prettier {
       let g:prettier#quickfix_auto_focus = 0
    " }
    
    " plasticboy/vim-markdown {
       let g:vim_markdown_folding_disabled = 1
       let g:vim_markdown_frontmatter = 1
    " }
" }

