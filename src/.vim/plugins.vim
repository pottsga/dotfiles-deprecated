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
Plug 'lepture/vim-jinja' " Jinja2 syntax
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
source ~/.vim/configuration/emmet.vim
source ~/.vim/configuration/nerdtree.vim
source ~/.vim/configuration/python-syntax.vim
source ~/.vim/configuration/ctrlp.vim
source ~/.vim/configuration/fzf.vim
source ~/.vim/configuration/coc.vim
source ~/.vim/configuration/calendar.vim
source ~/.vim/configuration/vimwiki.vim
source ~/.vim/configuration/ripgrep.vim
