" Navigating with Guides a la Luke Smith
inoremap <leader><leader> <Esc><CR>"_c4l
vnoremap <leader><leader> <Esc>/<++><CR>"_c4l
map <leader><leader> <Esc>/<++><CR>"_c4l

" Soft wrap navigating is easier
noremap <silent> k gk
noremap <silent> j gj
noremap <silent> 0 g0
noremap <silent> $ g$

" Navigate up and down in the quickfix buffer a la emacs
map <C-n> :cn<CR>
map <C-p> :cp<CR>
map <C-c> :ccl<CR>
