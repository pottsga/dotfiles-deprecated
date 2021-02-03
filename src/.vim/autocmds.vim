function CompileToHTML()

  " echom "Compiled"+expand('%p')+"to html/"+expand('%p')+".html"
  " echom "Compiled"+expand('%p')+"to html/"+expand('%p')+".html"
  " Create an HTML subdirectory and compile the current file to HTML
  " within that subdirectory called html/.
  echo "Compiled '" . expand("%:t") . "' to 'html/" . expand("%:t") . ".html'"
  execute "silent ! mkdir -p html"
  execute "silent ! pandoc --standalone -f markdown -t html % > html/%.html"
endfunction

autocmd BufWritePost *.notes.md call CompileToHTML()

