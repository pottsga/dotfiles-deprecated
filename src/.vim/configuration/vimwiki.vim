"" Vimwiki
let g:vimwiki_filepath = "/Users/potts_g/iCloud/Notes" " The file path to your personal vim wiki

let g:date_format = '%Y%m%d%a' " what format should the dates be in?
let g:time_format = '%I%M%p' " what format should all the time be in?
let g:uid_separator = '-' " the character to use to separate the uid from the ID

let g:vimwiki_list = [{
  \ 'path': vimwiki_filepath,
  \ 'syntax': 'markdown',
  \ 'ext': '.md',
  \ 'nested_syntaxes': {'python': 'python', 'html': 'html', 'css': 'css', 'js': 'js', 'sql': 'sql', 'bash': 'sh'}
  \ }]
let g:vimwiki_url_maxsave=0
" let g:vimwiki_folding = 'syntax'
let g:vimwiki_folding = 'expr'

au Filetype vimwiki
      \ setlocal nowrap linebreak nolist tw=100 colorcolumn=101 foldlevel=5

" Open links with t in a split
autocmd FileType vimwiki nnoremap t :VimwikiVSplitLink<CR>

" Write the file to the filesystem. If the ask parameter is 1, then ask the
" user whether or not they'd like to write the file. Else, just write it.
"
" Args:
"   template (str): The template string to insert into the file
"   filepath (str): The full file path of the file
"   ask (str): 1 or 0. If 1, then ask the user if they are sure they want to write
function! WriteFile(template, filepath, ask)
  "
  " If the file does not exist on the disk
  if !filereadable(a:filepath)
    " If we should ask the user, ask them if they really want to write the file.
    if a:ask == 1
      let sure = toupper(input("Write file? " . a:filepath . " (y/n) "))
      if sure != "Y"
        " Write out cancelled and return
        echom " Cancelled..."
        return
      endif
    endif

    " Write the file to the disk
    call writefile(a:template, a:filepath)
    echom " Wrote file..."
  endif

  " Open the file
  execute "e " . a:filepath
endfunction

" Get user input from user and convert it all to uppercase and replace any
" spaces with a dash.
"
" Args:
"   prompt (str): The prompt to show the user
"
" Returns:
"   The sanitized user input 
function! GetUserInputAndSanitizeForVimwiki(prompt)
  return substitute(toupper(input(a:prompt)), " ", "-", "g")
endfunction

" Generate the vimwiki template string based on the type passed in. And return
" it.
"
" Args:
"   type (str): p, t, d, or m. The type of the vimwiki file. Used to
"     generate template
"   date (str): The date for the file
"
" Returns:
"   The vimwiki template string
function! GenerateVimwikiTemplateAndFilename(type, date)
  let date = a:date
  let file_extension = "md"

  let template = ''
  let filename = ''

  if a:type == "daily" || a:type == "d"
    let template = [
      \ "# " . date, "",
      \ "# NOTES", "",
      \ "<++>"
      \ ]
    let filename = date
  elseif a:type == "project" || a:type == "p"
    let project_name = GetUserInputAndSanitizeForVimwiki("Project name? ")
    let template = [
      \ "# PROJECT: " . project_name, "",
      \ "- STAKEHOLDERS: <++>",
      \ "- GIT: <++>",
      \ "- TAGS:",
      \ "  - <++>",
      \ "---", "",
      \ "# NOTES", "",
      \ "<++>", "",
      \ "# TASKS", "",
      \ ]

    let filename = project_name
  elseif a:type == "meeting" || a:type == "m"
    let meeting_title = GetUserInputAndSanitizeForVimwiki("Meeting title? ")
    let custom_date_time = GetUserInputAndSanitizeForVimwiki("Override current date/time? (y/n) ")
    let time = toupper(strftime(g:time_format))

    if custom_date_time == "Y"
      let date = GetUserInputAndSanitizeForVimwiki("Date (YYYYMMDDDAY; Ex: 20210915WED): ")
      let time = GetUserInputAndSanitizeForVimwiki("Time (HHMM(AM/PM) Ex: 0900AM): ")
    endif

    let template = [
      \ "# MEETING: " . meeting_title, "",
      \ "- DATE: " . date,
      \ "- TIME: " . time,
      \ "- ATTENDEES: <++>",
      \ "- TAGS:",
      \ "  - <++>",
      \ "---", "",
      \ "# NOTES", "",
      \ "<++>"
      \ ]

    let filename = date . time . g:uid_separator . meeting_title
  elseif a:type == "other" || a:type == "o"
    let file_name = GetUserInputAndSanitizeForVimwiki("File name? ")
    let time = toupper(strftime(g:time_format))

    let template = [
      \ "# FILE NAME: " . file_name, "",
      \ "- DATE: " . date,
      \ "- TIME: " . time,
      \ "- TAGS:",
      \ "  - <++>",
      \ "---", "",
      \ "<++>",
      \ ]

    let filename = file_name
  else
    " type was unsupported
    return []
  endif

  " let filename = substitute(toupper(filename), " ", "-", "g") . "." . file_extension
  let filename = filename . '.' . file_extension
  return [template, filename]
endfunction

" On passing of a template type, enerate the Vimwiki template for that type
" and write it to the filesystem based on the base_filepath.
"
" Args:
"   type (str): p, t, d, or m. The type of the vimwiki file. Used to
"     generate template
"   base_filepath (str): the base place on the filesystem to put the file
"     generated per the template.
function! GenerateVimwikiTemplateAndWriteFile(type, base_filepath)
  let date = toupper(strftime(g:date_format))

  let result = GenerateVimwikiTemplateAndFilename(a:type, date)
  if result == []
    echo " Unsupported type..."
    return
  endif

  let template = result[0]
  let filename = result[1]

  let ask_user = 1
  if a:type == "daily" || a:type == "d"
    " If the note is a daily note, don't ask the user for input before writing
    let ask_user = 0
  endif

  " Create the filepath and write the file
  let filepath = a:base_filepath . filename
  call WriteFile(template, filepath, ask_user)
endfunction

" Map some helper keys to create daily, meeting, project, and task notes in
" their correct subdirectories according to vimwiki_filepath
nnoremap <silent> <leader>w<leader>w :call GenerateVimwikiTemplateAndWriteFile("d", vimwiki_filepath . "/daily/")<CR>
nnoremap <silent> <leader>wm :call GenerateVimwikiTemplateAndWriteFile("m", vimwiki_filepath . "/meeting/")<CR>
nnoremap <silent> <leader>wp :call GenerateVimwikiTemplateAndWriteFile("p", vimwiki_filepath . "/project/")<CR>
nnoremap <silent> <leader>wo :call GenerateVimwikiTemplateAndWriteFile("o", vimwiki_filepath . "/other/")<CR>

" Remap to insert current time and start a list for the daily notes
nnoremap <leader>wit I<Esc>:put =toupper(strftime(g:time_format))<CR>kddA<CR>- 
inoremap <leader>wit I<Esc>:put =toupper(strftime(g:time_format))<CR>kddA<CR>- 

" Search for any note with the :todo: flag in it.
nnoremap <leader>dt :Rg :todo:<CR>

" Convert a :todo: flag to :done: and insert the time next to it
nnoremap <leader>d ^/:todo:<CR><S-V>:s/:todo:/:done: ( /g<CR><Esc>/done: (<CR>f(li<C-r>=toupper(strftime('ON ' . g:date_format . g:time_format))<CR>)<Esc>:noh<CR>

" Create a task for a project
nnoremap <silent> <leader>wt i## TASK: <++><CR>  - TICKET: <++><CR>- :todo:<CR><CR><++><Esc>?<++><CR>nnh:noh<CR>
inoremap <silent> <leader>wt ## TASK: <++><CR>  - TICKET: <++><CR>- :todo:<CR><CR><++><Esc>?<++><CR>nnh:noh<CR>
