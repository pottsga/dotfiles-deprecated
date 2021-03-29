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

Plug 'evanleck/vim-svelte' " Svelte
Plug 'pangloss/vim-javascript' " JavaScript Syntax
Plug 'mxw/vim-jsx' "JSX Syntax
Plug 'leafgarland/typescript-vim' " Typescript
Plug 'pottsga/vim-jinja' " Jinja2 syntax
Plug 'JulesWang/css.vim' " Modern css syntax
Plug 'vim-python/python-syntax' " Python syntax
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'vimwiki/vimwiki' " Vimwiki 

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
nnoremap <C-t> :NERDTreeToggle<CR>

"" Python-syntax
let g:python_highlight_indent_errors = 0
let g:python_highlight_space_errors = 0
let g:python_highlight_all = 1

"" CtrlP
set wildignore+=*/tmp*,*.so,*.swp,*.zip,*/vendor/*,*/\.git/*,*/env/*

"" FZF
nnoremap <leader>of :Files<CR>
nnoremap <leader>ob :Buffers<CR>
nnoremap <leader>oc :Commits<CR>

"" COC
function! FloatScroll(forward) abort
  let float = coc#util#get_float()
  if !float | return '' | endif
  let buf = nvim_win_get_buf(float)
  let buf_height = nvim_buf_line_count(buf)
  let win_height = nvim_win_get_height(float)
  if buf_height < win_height | return '' | endif
  let pos = nvim_win_get_cursor(float)
  if a:forward
    if pos[0] == 1
      let pos[0] += 3 * win_height / 4
    elseif pos[0] + win_height / 2 + 1 < buf_height
      let pos[0] += win_height / 2 + 1
    else
      let pos[0] = buf_height
    endif
  else
    if pos[0] == buf_height
      let pos[0] -= 3 * win_height / 4
    elseif pos[0] - win_height / 2 + 1  > 1
      let pos[0] -= win_height / 2 + 1
    else
      let pos[0] = 1
    endif
  endif
  call nvim_win_set_cursor(float, pos)
  return ''
endfunction
let g:coc_node_path = '/usr/local/bin/node'

""" scroll the popup window with up and down arrow keys
inoremap <silent><expr> <down> coc#util#has_float() ? FloatScroll(1) : "\<down>"
inoremap <silent><expr>  <up>  coc#util#has_float() ? FloatScroll(0) :  "\<up>"
