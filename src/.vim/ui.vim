set encoding=utf-8

" UI / Colorscheme
set termguicolors
set cursorline
colorscheme nord

set clipboard=unnamedplus " Unnamedplus uses the clipboard by default
set backspace=indent,eol,start " Sane backspacing

set splitright splitbelow " Split vertically/horiz. in a sane way
set ignorecase " Ignore case in search
set smartcase " Switch to case-sensitive when contains upcase letter
set incsearch " Show partial matches
set wildmenu " Visual autocomplete for command menu
set updatetime=300 " shorten update time for better user experience
set autoread " Automatically read files changed outside of vim
" Who likes backup and swp files anyway?
set noswapfile " Disable .swp files
set nobackup " Disable .bak files

set number " Insert line numbers
set numberwidth=5 " The number column should be larger
set cmdheight=2 " More command height for displaying messages
set signcolumn=yes " Always show the signcolumn, otherwise text can shift

" Tabs
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab " Insert spaces in place of tabs
set listchars=space:·,tab:>-

" Folding
set foldmethod=syntax " Fold based off of indent
set foldnestmax=10
set foldlevelstart=1 " start off pre-folded, remember folds exist
set foldopen= " don't automatically open my folds!
