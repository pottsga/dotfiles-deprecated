" This command is used to install vim-plug.
" sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

call plug#begin()
Plug 'SirVer/ultisnips' " Snippet Engine 
Plug 'honza/vim-snippets' " Snippet Templates
Plug 'tpope/vim-sensible' " Sensible Defaults
Plug 'tpope/vim-fugitive' " Git Integration
Plug 'tpope/vim-surround' " Surrounding Text
Plug 'tpope/vim-commentary' " Commenting Text
Plug 'tpope/vim-repeat' " Repeat Commands
Plug 'tpope/vim-unimpaired' " Pairs of handy bracket mappings
Plug 'tpope/vim-abolish' " Search and Replace
Plug 'preservim/nerdtree' " Nerdtree File Explorer
Plug 'github/copilot.vim' " Github Copilot

call plug#end()

" SirVer/ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
