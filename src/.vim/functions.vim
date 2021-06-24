" Custom functions

" Show the syntax stack by typing <leader>sp
nmap <leader>sp :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Show the syntax groups by typing <leader>sg
nmap <leader>sg :call <SID>SynGroup()<CR>
function! <SID>SynGroup()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun

" COC
function! FloatScroll(forward) abort
  let float = coc#util#get_float()
  if !float | return '' | endif
  let buf = nvim_win_get_buf(float)
  let buf_height = nvim_buf_line_count(buf)
  let win_height = nvim_win_get_height(float)
  if buf_height < win_height | return '' | endif
  let pos = nvim_win_get_cursor(float)
  if a:forward
    if pos[0] == 1
      let pos[0] += 3 * win_height / 4
    elseif pos[0] + win_height / 2 + 1 < buf_height
      let pos[0] += win_height / 2 + 1
    else
      let pos[0] = buf_height
    endif
  else
    if pos[0] == buf_height
      let pos[0] -= 3 * win_height / 4
    elseif pos[0] - win_height / 2 + 1  > 1
      let pos[0] -= win_height / 2 + 1
    else
      let pos[0] = 1
    endif
  endif
  call nvim_win_set_cursor(float, pos)
  return ''
endfunction

function CompileCurrentFileToHTML()
  " Create an HTML subdirectory and compile the current file to HTML
  " within that subdirectory called html/.
  echo "Compiled '" . expand("%:t") . "' to 'html/" . expand("%:t") . ".html'"
  execute "silent ! mkdir -p html"
  execute "silent ! pandoc --standalone -f gfm -t html % > html/%.html"
endfunction

function! GetVimwikiFilepath() 
  " Get the base vimwiki filepath. This centralizes this string so as to be
  " able to be used in scripts and other places. If this needs changed, this
  " is the place to do that.
  return "/Users/potts_g/iCloud/Notes"
endfunction

function! GetFilenameFromUserAndCreateFile(type)
  " Get the file name form the user that will be used to create the file in
  " the vimwiki folder structure. This is called either by <leader>m for
  " meetings or <leader>p for projects. This script also creates the file in
  " the file structure.
  "
  " @param type: str; either m or p for meeting or project

  if a:type == "m" " If this is a meeting
    echo "Create a new meeting file in your vimwiki wiki\n"
    let title=substitute(toupper(input("Meeting Title: ")), " ", "-", "g")
    " We need to know the date and time
    let prepend_datetime=toupper(strftime("%Y-%m-%d-%I%M%p"))
    " Set the subdirectory to /meeting
    let subdirectory="/meeting/"
    let filename=prepend_datetime . "_" . title . ".txt"
  elseif a:type == "p" " If this is a project
    let title=substitute(toupper(input("Project Name: ")), " ", "-", "g")
    " Set the subdirectory to project
    let subdirectory="/project/"
    let filename=title . ".txt"
  endif

  " The base directory of the vimwiki wiki
  let base_wiki_filepath = GetVimwikiFilepath()
  " Concat the string together to provide a fully qualified filepath
  let fp = base_wiki_filepath . subdirectory . filename
  " Touch the file ... aka write the file to the system

  " Make sure the user actually wants to write the file as it was created
  let sure = toupper(input("Are you sure you want to create " . fp . "? (y/n) "))
  echom "\r"
  if sure == "Y"
    call system("touch " . fp)
    echom "Wrote " . fp
  else
    echom "Cancelled..."
  endif
endfunction
