" Python
au BufRead *.py 
  \ setlocal shiftwidth=4 | 
  \ setlocal tabstop=4 |
  \ setlocal expandtab

" HTML
au BufRead *.html
  \ setlocal ft=jinja

au Filetype rmd map <leader>co :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>
