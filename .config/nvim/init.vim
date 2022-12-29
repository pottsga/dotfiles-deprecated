set nocompatible

set rnu

let mapleader=","

map <leader>h :noh<CR>
nnoremap <leader>t :NERDTreeToggle<CR>

" highlight CursorLine term=bold ctermbg=Grey cterm=bold
" highlight Visual cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=#5fd700 guifg=#000000
" highlight StatusLine cterm=NONE ctermbg=231 ctermfg=160 gui=NONE guibg=#ffffff guifg=#d70000
" highlight Normal cterm=NONE ctermbg=17 gui=NONE guibg=#00005f
" highlight NonText cterm=NONE ctermbg=17 gui=NONE guibg=#00005f

highlight CursorLine cterm=NONE
highlight CursorLineNr cterm=NONE


source~/.config/nvim/plugins.vim
