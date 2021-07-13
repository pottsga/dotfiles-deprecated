
" Vimwiki Configuration
au Filetype vimwiki
      \ setlocal wrap linebreak nolist

"" Vimwiki Templates
au BufNewFile ~/*/diary/*.txt
      \ let template = GetVimwikiTemplate("diary")
      \ call append(0, template)
      " \ call append(0,[
      " \ "= " . split(expand('%:r'),'/')[-1] . "=", "",
      " \ "= MEETINGS =",  "",
      " \ "= NOTES =", "",
      " \ "<++>"])

au BufNewFile ~/*/meeting/*.txt
      \ let template = GetVimwikiTemplate("meeting")
      \ call append(0, template)

au BufNewFile ~/*/project/*.txt
      \ let template = GetVimwikiTemplate("project")
      \ call append(0, template)

" Limelight integration into Goyo
" autocmd! User GoyoEnter Limelight
" autocmd! User GoyoLeave Limelight!

