
" Vimwiki Configuration
au Filetype vimwiki
      \ setlocal wrap linebreak nolist

"" Vimwiki Templates
au BufNewFile ~/*/diary/*.txt
      \ call append(0,[
      \ "= " . split(expand('%:r'),'/')[-1] . "=", "",
      \ "= MEETINGS =",  "",
      \ "= NOTES =", "",
      \ "<++>"])

au BufNewFile ~/*/meeting/*.txt
      \ call append(0,[
      \ "= <++> =", "",
      \ "- ATTENDEES: <++>", "",
      \ "- DATE: <++>", 
      \ "- TIME: <++>", 
      \ "----", "",
      \ "= NOTES =", "",
      \ "<++>"])

au BufNewFile ~/*/project/*.txt
      \ call append(0,[
      \ "= <++> =", "",
      \ "- STAKEHOLDERS: <++>",
      \ "- TICKET: <++>",
      \ "- GIT: <++>",
      \ "----", "",
      \ "= NOTES =", "",
      \ "<++>"])

" Limelight integration into Goyo
" autocmd! User GoyoEnter Limelight
" autocmd! User GoyoLeave Limelight!

