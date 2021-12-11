" I like to use vim-plug. Use this command to install it.
"
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible' " Sensible defaults -- one step above set nocompatible
Plug 'preservim/nerdtree' " NerdTree file browser
Plug 'SirVer/ultisnips' " Snippet engine

Plug 'mattn/emmet-vim' " Emmet
Plug 'Glench/Vim-Jinja2-Syntax' " Jinja2 syntax highlighting
Plug 'vim-python/python-syntax' " Python syntax

call plug#end()

" NerdTree
nnoremap <c-t> :NERDTreeToggle<CR>
let g:NERDTreeIgnore=[
	    \   '__pycache__', '\.pyc$', '\.o$', '\.so$', '\.a$', '\.swp',
	    \   '*\.swp', '\.swo', '\.swn', '\.swh', '\.swm', '\.swl', '\.swk',
	    \   '\.sw*$', '[a-zA-Z]*egg[a-zA-Z]*', '.DS_Store', '^node_modules$',
	    \ ]

" UtiliSnips
let g:UltiSnipsSnippetStorageDirectoryForUltiSnipsEdit = "~/.vim/UltiSnips" " where to look for/save snippets
let g:UltiSnipsExpandTrigger="<tab>" " What key to expand the snippet with
let g:UltiSnipsJumpForwardTrigger="<tab>" " What key to jump to the next placeholder with
let g:UltiSnipsJumpBackwardTrigger="<s-tab>" " What key to jump to the previous placeholder with
let g:UltiSnipsEditSplit="vertical" " open up ultisnips in a vertical split

" Emmet
let g:user_emmet_settings = {
	    \   'indentation': '  ',
	    \ }
let g:user_emmet_complete_tag = 1
let g:user_emmet_expandabbr_key = '<C-J>'

