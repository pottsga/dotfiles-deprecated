" Python
au BufRead *.py 
  \ setlocal shiftwidth=4 | 
  \ setlocal tabstop=4 |
  \ setlocal expandtab

" HTML
au BufRead *.html
  \ setlocal ft=jinja

au Filetype rmd map <leader>co :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>

let g:python3_host_prog = '/usr/local/bin/nvim_env/bin/python' "python3 enabling
