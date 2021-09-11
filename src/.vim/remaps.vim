" Navigating with Guides a la Luke Smith
inoremap <leader><leader> <Esc><CR>"_c4l
vnoremap <leader><leader> <Esc>/<++><CR>"_c4l
map <leader><leader> <Esc>/<++><CR>"_c4l

" Soft wrap navigating is easier
noremap <silent> k gk
noremap <silent> j gj
noremap <silent> 0 g0
noremap <silent> $ g$

" NERDTree
nnoremap <C-t> :NERDTreeToggle<CR>

" FZF
nnoremap <leader>of :Files<CR>
nnoremap <leader>ob :Buffers<CR>
nnoremap <leader>oc :Commits<CR>

" Date
nnoremap <leader>d :put=strftime('%a-%Y-%m-%d')<CR>

nnoremap <silent> <leader>w<leader>w :call GenerateVimwikiTemplateAndWriteFile("d", vimwiki_filepath . "/daily/")<CR>
nnoremap <silent> <leader>wm :call GenerateVimwikiTemplateAndWriteFile("m", vimwiki_filepath . "/meeting/")<CR>
nnoremap <silent> <leader>wp :call GenerateVimwikiTemplateAndWriteFile("p", vimwiki_filepath . "/project/")<CR>
nnoremap <silent> <leader>wt :call GenerateVimwikiTemplateAndWriteFile("t", vimwiki_filepath . "/task/")<CR>

" Calendar widget
nnoremap <leader>cal :Calendar<CR>

nnoremap <leader>wit I<Esc>:put =strftime('%I:%M %p: ')<CR>A
inoremap <leader>wit <Esc>:put =strftime('%I:%M %p: ')<CR>A
