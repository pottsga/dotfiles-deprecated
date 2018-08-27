" Install vim-plug
" 	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" Install plugins
call plug#begin()
Plug 'joshdick/onedark.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'mattn/emmet-vim'
Plug 'itchyny/lightline.vim'
call plug#end()

" +=======================+
" | GENERAL CONFIGURATION |
" +=======================+

set backspace=indent,eol,start "make baskapce behave in a sane way
set number "enable line numbers
set tabstop=2 " tabs are 2 spaces
set shiftwidth=2 "when indenting with '>'
set softtabstop=2
set expandtab "on pressing tab, insert spaces

set splitbelow "more natural split opening
set splitright

" Move left, right, up, and down in windows similar to how it is done in the
" editor
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Map <Esc> to exit terminal-mode
tnoremap <Esc> <C-\><C-n>


map <C-o> <C-w>w

" +=======================+
" | PLUGIN CONFIGURATIONS |
" +=======================+

" emmet-vim
let g:user_emmet_settings = {
\ 'indentation': '  ',
\ 'javascript.jsx': {
\   'extends': 'jsx',
\ }
\}
let g:user_emmet_complete_tag = 1
let g:user_emmet_expandabbr_key='<C-J>'

" nerdtree
map <C-t> :NERDTreeToggle<Enter>

" lightline
let g:lightline = {
\ 'colorscheme': 'onedark',
\}

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

syntax on
colorscheme onedark
