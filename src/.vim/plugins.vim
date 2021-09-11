" The plugin manager I use is VIM Plug. Install it by using the following command: 
"   curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

call plug#begin()

Plug 'scrooloose/nerdtree' " NERDTree
Plug 'mattn/emmet-vim' " Emmet
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " FZF
Plug 'junegunn/fzf.vim' " FZF
Plug 'airblade/vim-gitgutter'
Plug 'arcticicestudio/nord-vim'
Plug 'tpope/vim-surround' " Vim surround
Plug 'vimwiki/vimwiki' " Vimwiki 
Plug 'itchyny/calendar.vim' "calendar
Plug 'jremmen/vim-ripgrep' "vim-ripgrep (tags, searching) ... IMPORTANT: This requires rg to be installed


Plug 'elixir-editors/vim-elixir' " Elixir
Plug 'evanleck/vim-svelte' " Svelte
Plug 'pangloss/vim-javascript' " JavaScript Syntax
Plug 'mxw/vim-jsx' "JSX Syntax
Plug 'leafgarland/typescript-vim' " Typescript
Plug 'pottsga/vim-jinja' " Jinja2 syntax
Plug 'JulesWang/css.vim' " Modern css syntax
Plug 'vim-python/python-syntax' " Python syntax
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" For COC, the following are needed. Install via :CocInstall xxx
"   - coc-pyright # Python
"   - coc-html
"   - coc-css
"   - coc-tsserver

call plug#end()

" CONFIGURATION

"" Emmet
let g:user_emmet_settings = {
\   'indentation': '  ',
\ }
let g:user_emmet_complete_tag = 1
let g:user_emmet_expandabbr_key = '<C-J>'

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

"" Python-syntax
let g:python_highlight_indent_errors = 0
let g:python_highlight_space_errors = 0
let g:python_highlight_all = 1

"" CtrlP
set wildignore+=*/tmp*,*.so,*.swp,*.zip,*/vendor/*,*/\.git/*,*/env/*

"" Vimwiki
let g:vimwiki_filepath = "/Users/potts_g/iCloud/Notes" " The file path to your personal vim wiki
let g:vimwiki_list = [{
  \ 'path': vimwiki_filepath,
  \ 'syntax': 'markdown',
  \ 'ext': '.md',
  \ 'nested_syntaxes': {'python': 'python', 'html': 'html', 'css': 'css', 'js': 'js', 'sql': 'sql', 'bash': 'sh'}
  \ }]
let g:vimwiki_url_maxsave=0
let g:vimwiki_folding = 'syntax'

au Filetype vimwiki
      \ setlocal wrap linebreak nolist foldmethod=syntax

" Calendar.vim -> vimwiki integration
autocmd FileType calendar nmap <silent> <buffer> <CR> :<C-u>call CalendarAction(vimwiki_filepath . "/diary/", b:calendar.day().get_day(), b:calendar.day().get_month(), b:calendar.day().get_year(), b:calendar.day().is_monday(), b:calendar.day().is_tuesday(), b:calendar.day().is_wednesday(), b:calendar.day().is_thursday(), b:calendar.day().is_friday(), b:calendar.day().is_saturday(), b:calendar.day().is_sunday())<CR>
