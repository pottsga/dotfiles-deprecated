" I like to use vim-plug. Use this command to install it.
"
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible' " Sensible defaults -- one step above set nocompatible
Plug 'tpope/vim-surround' " Vim surround
Plug 'tpope/vim-commentary' " Vim commentary
Plug 'tpope/vim-fugitive' " Git client for vim
Plug 'preservim/nerdtree' " NerdTree file browser
Plug 'SirVer/ultisnips' " Snippet engine
Plug 'airblade/vim-gitgutter' " Git gutter in the signcolumn
Plug 'junegunn/goyo.vim' " Distraction free writing
Plug 'ctrlpvim/ctrlp.vim' " Ctrlp

Plug 'vimwiki/vimwiki' " Vim wiki
Plug 'mattn/emmet-vim' " Emmet
Plug 'lepture/vim-jinja' " Jinja2 syntax highlighting
Plug 'vim-python/python-syntax' " Python syntax
Plug 'JulesWang/css.vim' " Modern css syntax
Plug 'leafgarland/typescript-vim' " Typescript
Plug 'pangloss/vim-javascript' " JavaScript Syntax
Plug 'mxw/vim-jsx' "JSX Syntax
Plug 'arcticicestudio/nord-vim' " Nord Colorscheme
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" NerdTree
nnoremap <leader>t :NERDTreeToggle<CR>
let g:NERDTreeIgnore=[
	    \   '__pycache__', '\.pyc$', '\.o$', '\.so$', '\.a$', '\.swp',
	    \   '*\.swp', '\.swo', '\.swn', '\.swh', '\.swm', '\.swl', '\.swk',
	    \   '\.sw*$', '[a-zA-Z]*egg[a-zA-Z]*', '.DS_Store', '^node_modules$',
	    \ ]

" UtiliSnips
let g:UltiSnipsSnippetStorageDirectoryForUltiSnipsEdit = "~/.vim/UltiSnips" " where to look for/save snippets
let g:UltiSnipsExpandTrigger="<tab>" " What key to expand the snippet with
let g:UltiSnipsJumpForwardTrigger="<tab>" " What key to jump to the next placeholder with
let g:UltiSnipsJumpBackwardTrigger="<S-tab>" " What key to jump to the previous placeholder with
let g:UltiSnipsEditSplit="vertical" " open up ultisnips in a vertical split

" Emmet
let g:user_emmet_settings = {
	    \ 'indentation': '  ',
      \ 'default_attributes': {
        \ 'a': {'href': ''},
        \ 'textarea': [{'name': ''}, {'rows': '5'}, {'id': ''}, {'class': ''}],
        \ 'link': [{'rel': 'stylesheet'}, {'href': ''}],
        \ } 
	    \ }
let g:user_emmet_complete_tag = 1
let g:user_emmet_expandabbr_key = '<C-J>'

" Goyo
let g:goyo_width=120
nnoremap <leader>gy :Goyo<cr>

" CtrlP
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/*,*/\.git/*,*/env/*
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" Commentary
"" Jinja2 comments
autocmd FileType jinja setlocal commentstring=\{\#\ %s\ \#\}

" Vimwiki
let g:vimwiki_table_mappings = 0 " allows for using <tab> in insert mode for ultisnips
let wiki = {}
let wiki.path = '~/Desktop/Notes'
let wiki.nested_syntaxes = {'python': 'python', 'javascript': 'javascript', 'html': 'html', 'css': 'css', 'sql': 'sql', 'bash': 'bash'}
let g:vimwiki_list = [wiki]
