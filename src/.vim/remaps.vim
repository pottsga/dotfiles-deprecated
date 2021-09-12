" Navigating with Guides a la Luke Smith
inoremap <leader><leader> <Esc><CR>"_c4l
vnoremap <leader><leader> <Esc>/<++><CR>"_c4l
map <leader><leader> <Esc>/<++><CR>"_c4l

" Soft wrap navigating is easier
noremap <silent> k gk
noremap <silent> j gj
noremap <silent> 0 g0
noremap <silent> $ g$



" Insert Current Date
nnoremap <leader>d :put=strftime('%a-%Y-%m-%d')<CR>

" Insert Current Time
nnoremap <leader>wit I<Esc>:put =strftime('%I:%M %p: ')<CR>A
inoremap <leader>wit <Esc>:put =strftime('%I:%M %p: ')<CR>A
