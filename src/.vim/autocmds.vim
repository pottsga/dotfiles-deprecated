function CompileCurrentFileToHTML()
  " Create an HTML subdirectory and compile the current file to HTML
  " within that subdirectory called html/.
  echo "Compiled '" . expand("%:t") . "' to 'html/" . expand("%:t") . ".html'"
  execute "silent ! mkdir -p html"
  execute "silent ! pandoc --standalone -f gfm -t html % > html/%.html"
endfunction

au BufWritePost *.notes.md
      \ call CompileCurrentFileToHTML()

" Automatically compile rmarkdown
au Filetype rmd
      \ map <leader>co :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>
