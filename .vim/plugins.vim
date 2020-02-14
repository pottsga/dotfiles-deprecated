" The plugin manager I use is VIM Plug. Install it by using the following command: 
"   curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

call plug#begin()

Plug 'scrooloose/nerdtree' " NERDTree
Plug 'mattn/emmet-vim' " Emmet
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " FZF
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive' " Fugitive

Plug 'evanleck/vim-svelte' " Svelte
Plug 'pangloss/vim-javascript' " JavaScript Syntax
Plug 'mxw/vim-jsx' "JSX Syntax
Plug 'leafgarland/typescript-vim' " Typescript
Plug 'pottsga/vim-jinja' " Jinja2 syntax
Plug 'Vimjas/vim-python-pep8-indent' " Pep8 indentation
Plug 'JulesWang/css.vim' " Modern css syntax
Plug 'vim-python/python-syntax' " Python syntax
call plug#end()

" CONFIGURATION

"" Emmet
let g:user_emmet_settings = {
\   'indentation': '  ',
\ }
let g:user_emmet_complete_tag = 1
let g:user_emmet_expandabbr_key = '<C-J>'

"" NERD Tree
let g:NERDTreeDirArrowExpandable = ' '
let g:NERDTreeDirArrowCollapsible = ' '
let g:NERDTreeDirArrows=0
let g:NERDTreeNodeDelimiter = "\u00a0"
let g:NERDTreeIgnore=[
\   '__pycache__', '\.pyc$', '\.o$', '\.so$', '\.a$', '\.swp',
\   '*\.swp', '\.swo', '\.swn', '\.swh', '\.swm', '\.swl', '\.swk',
\   '\.sw*$', '[a-zA-Z]*egg[a-zA-Z]*', '.DS_Store'
\ ]
nnoremap <C-t> :NERDTreeToggle<CR>

"" auto-pairs
" au Filetype vim let b:AutoPairs = {"(": ")", "[": "]", "{": "}", "'": "'"}

"" Python-syntax
let g:python_highlight_indent_errors = 0
let g:python_highlight_space_errors = 0
let g:python_highlight_all = 1

"" CtrlP
set wildignore+=*/tmp*,*.so,*.swp,*.zip,*/vendor/*,*/\.git/*,*/env/*

" FZF
nnoremap <leader>of :Files<CR>
nnoremap <leader>ob :Buffers<CR>
nnoremap <leader>oc :Commits<CR>
