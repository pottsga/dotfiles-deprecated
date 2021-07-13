" Navigating with Guides a la Luke Smith
inoremap <leader><leader> <Esc><CR>"_c4l
vnoremap <leader><leader> <Esc>/<++><CR>"_c4l
map <leader><leader> <Esc>/<++><CR>"_c4l

" Custom script that finds all TODO statements in the vimwiki directory
nnoremap <leader>dt :!todos<CR>

" Soft wrap navigating is easier
noremap <silent> k gk
noremap <silent> j gj
noremap <silent> 0 g0
noremap <silent> $ g$

" Open goyo with leader+gy
nnoremap <leader>gy :Goyo<CR>

" NERDTree
nnoremap <C-t> :NERDTreeToggle<CR>

" FZF
nnoremap <leader>of :Files<CR>
nnoremap <leader>ob :Buffers<CR>
nnoremap <leader>oc :Commits<CR>

" scroll the popup window with up and down arrow keys
inoremap <silent><expr> <down> coc#util#has_float() ? FloatScroll(1) : "\<down>"
inoremap <silent><expr>  <up>  coc#util#has_float() ? FloatScroll(0) :  "\<up>"

" Limelight
nnoremap <leader>l :Limelight<CR>
inoremap <leader>l :Limelight<CR>

" Date
nnoremap <leader>d :put=strftime('%Y-%m-%d')<CR>

" Write meeting and project files to vimwiki with nice interface
nnoremap <leader>wm :call GetFilenameFromUserAndCreateFile("m")<CR>
nnoremap <leader>wp :call GetFilenameFromUserAndCreateFile("p")<CR>

" Open todo file in vimwiki
nnoremap <leader>ot :execute 'e ' . GetVimwikiFilepath() . "/todo.txt"<CR>

" Calendar widget
nnoremap <leader>cal :Calendar<CR>
