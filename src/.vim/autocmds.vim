function CompileCurrentFileToHTML()
  " Create an HTML subdirectory and compile the current file to HTML
  " within that subdirectory called html/.
  echo "Compiled '" . expand("%:t") . "' to 'html/" . expand("%:t") . ".html'"
  execute "silent ! mkdir -p html"
  execute "silent ! pandoc --standalone -f gfm -t html % > html/%.html"
endfunction

" Daily notes text width
au BufRead,BufNewFile notes.txt
      \ setlocal textwidth=80

au BufWritePost *.notes.md
      \ call CompileCurrentFileToHTML()

" Automatically compile rmarkdown
au Filetype rmd
      \ map <leader>co :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>
