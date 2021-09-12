"" NERD Tree
let g:NERDTreeStatusline = '%#StatusLineNC#'
let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeDirArrowExpandable = ' '
let g:NERDTreeDirArrowCollapsible = ' '
let g:NERDTreeDirArrows=0
let g:NERDTreeNodeDelimiter = "\u00a0"
let g:NERDTreeIgnore=[
\   '__pycache__', '\.pyc$', '\.o$', '\.so$', '\.a$', '\.swp',
\   '*\.swp', '\.swo', '\.swn', '\.swh', '\.swm', '\.swl', '\.swk',
\   '\.sw*$', '[a-zA-Z]*egg[a-zA-Z]*', '.DS_Store', '^node_modules$',
\ ]

" NERDTree
nnoremap <C-t> :NERDTreeToggle<CR>
