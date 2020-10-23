" Python
au BufRead *.py 
  \ setlocal shiftwidth=4 | 
  \ setlocal tabstop=4 |
  \ setlocal expandtab

" HTML
au BufRead *.html
  \ setlocal ft=jinja

" Markdown
au BufRead,BufNewFile *.md
  \ setlocal wrap " wrap lines
