" Install vim-plug
"
" 	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" Plugins {
    call plug#begin()

    Plug 'scrooloose/nerdtree'              " NerdTree file tree
    Plug 'ctrlpvim/ctrlp.vim'               " Ctrl+P
    Plug 'mattn/emmet-vim'                  " Emmet for vim
    Plug 'alvan/vim-closetag'               " Close (x)html tags

    Plug 'othree/html5.vim'                 " HTML5 syntax for nonstandard elements
    Plug 'lepture/vim-jinja'                " Jinja2 syntax
    Plug 'elixir-editors/vim-elixir'        " Elixir syntax
    Plug 'vim-syntastic/syntastic'          " Syntastic (syntax highlighting for a lot of langs)
    Plug 'leafgarland/typescript-vim'       " Typescript vim
    Plug 'pangloss/vim-javascript'          " JavaScript syntax
    Plug 'mxw/vim-jsx'                      " JSX syntax
    
    Plug 'joshdick/onedark.vim'             " Onedark theme
    Plug 'rakr/vim-one'                     " One theme
    Plug 'itchyny/lightline.vim'            " Lightline bar

    call plug#end()
" }

" Configuration {
	set nocompatible                        " Use VIM settings instead of VI settings

	"" Indentation options {
		set autoindent                      " New lines inherit indentation of previous lines
		set expandtab                       " Convert tabs to spaces
		set shiftwidth=4                    " When shifting, indent using four spaces
		set smarttab                        " Set 'tabstop' number of spaces on tab press
		set tabstop=4                       " Tab == 4 spaces

        autocmd BufRead,BufNewFile *.htm,*.html setlocal tabstop=2 shiftwidth=2 softtabstop=2 " HTML-specific indentation
	"" }

	"" Search options {
		set hlsearch!                       " Enable search highlighting.
		set ignorecase                      " Ignore case when searching.
		set incsearch                       " Incremental search that shows partial matches.
		set smartcase                       " Automatically switch search to case-sensitive when search query contains an 
                                            "   uppercase letter.
	"" }

    "" Text rendering options {
        set encoding=utf-8                  " Set the editor's encoding to UTF-8
        set scrolloff=5                     " Set the number of lines to keep under the 
                                            "   current line
        set sidescrolloff=5                 " Set the number of columns to keep to the right 
                                            "   of the cursor
        syntax enable                       " Turn on syntax highlighting
    "" }

    "" UI options {
        set number                          " Show line numbers
        set nowrap                          " Don't wrap lines
        set ruler                           " Always show the cursor position
        set wildmenu                        " Display command line’s tab complete options as 
                                            "   a menu.

        set wrap                            " Set the line wrapping.
        set mouse=a                         " Allow mouse for scrolling and resizing
        set title
        set splitbelow                      " Split horizontally below the current pane
        set splitright                      " Split vertically to the right of the current pane

        " set t_8b=^[[48;2;%lu;%lu;%lum       " Vim inside of TMUX
        " set t_8f=^[[38;2;%lu;%lu;%lum       " Vim inside of TMUX

        "Credit joshdick
        "Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
        "If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
        "(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
        if (has("nvim"))
            "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
            let $NVIM_TUI_ENABLE_TRUE_COLOR=1
        endif
        "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
        "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
        " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
        if (has("termguicolors"))
            set termguicolors

            set background=dark " for the dark version
            " set background=light " for the light version
            colorscheme one

        endif


            "" }

    "" Navigation options {
        " Move left, right, up, and down in windows with H,J,K,L
        nnoremap <C-J> <C-W><C-J>
        nnoremap <C-K> <C-W><C-K>
        nnoremap <C-L> <C-W><C-L>
        nnoremap <C-H> <C-W><C-H>
    "" }

    "" Code folding options {
        set foldmethod=indent               " Fold based on indention levels.
        set foldnestmax=3                   " Only fold up to three nested levels.
        " set nofoldenable                    " Disable folding by default.

        " Map shift-tab to toggle fold
        nnoremap <s-tab> za                 
    "" }

    "" Misc options {
        set noswapfile                       " Disable .swp files
        set nobackup                         " Disable backup files
        set backspace=indent,eol,start       " Allow backspacing over indention, line breaks and insertion start.
        set confirm                          " Show a confirmation dialog on close file that is not saved
    "" }

    """ Plugins {
        """" Syntastic {
            set statusline+=%#warningmsg#
            set statusline+=%{SyntasticStatuslineFlag()}
            set statusline+=%*

            let g:syntastic_always_populate_loc_list = 1
            let g:syntastic_auto_loc_list = 1
            let g:syntastic_check_on_open = 1
            let g:syntastic_check_on_wq = 0
            let g:syntastic_html_tidy_ignore_errors=[
            \   " proprietary attribute ",
            \   "trimming empty <", 
            \   "unescaped &" , 
            \   "lacks \"action", 
            \   "is not recognized!", 
            \   "discarding unexpected",
            \   "attribute name ",
            \   "lacks value",
            \   "lacks \"src\" attribute",
            \ ]
        """" }
    
        """" Emmet {
            let g:user_emmet_settings = {
            \   'indentation': '  ',
            \ }
            let g:user_emmet_complete_tag = 1
            let g:user_emmet_expandabbr_key = '<C-J>'
        """" }

        """" NerdTree {
            map <C-t> :NERDTreeToggle<Enter>
            let g:NERDTreeIgnore=['\.DS_STORE', '\~$', '\.swp']
        """" }

        """" Lightline {
            let g:lightline = {
            \   'colorscheme': 'one',
            \ }
        """" }

    """ }
" }
