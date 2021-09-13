"" Vimwiki
let g:vimwiki_filepath = "/Users/potts_g/iCloud/Notes" " The file path to your personal vim wiki

let g:vimwiki_list = [{
  \ 'path': vimwiki_filepath,
  \ 'syntax': 'markdown',
  \ 'ext': '.md',
  \ 'nested_syntaxes': {'python': 'python', 'html': 'html', 'css': 'css', 'js': 'js', 'sql': 'sql', 'bash': 'sh'}
  \ }]
let g:vimwiki_url_maxsave=0
let g:vimwiki_folding = 'syntax'

au Filetype vimwiki
      \ setlocal wrap linebreak nolist foldmethod=syntax tw=100 colorcolumn=100

" Write the file to the filesystem. If the ask parameter is 1, then ask the
" user whether or not they'd like to write the file. Else, just write it.
"
" Args:
"   template (str): The template string to insert into the file
"   filepath (str): The full file path of the file
"   ask (str): 1 or 0. If 1, then ask the user if they are sure they want to write
function! WriteFile(template, filepath, ask)
  " Get rid of any spaces and replace them with -s. Also convert everything to
  " uppercase
  if !filereadable(a:filepath)
    if a:ask == 1
      let sure = toupper(input("Write file? " . a:filepath . " (y/n) "))
      if sure == "Y"
        call writefile(a:template, a:filepath)
        echom " Wrote file..."
        " Tell vim to edit the file
        execute "e " . a:filepath
      else
        echom " Cancelled..."
      endif
    else
      call writefile(a:template, a:filepath)
      " tell vim to edit the file
      execute "e " . a:filepath
    endif
  else
    " File already exists on the disk
    " tell vim to edit the file
    execute "e " . a:filepath
  endif
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
  if a:type == "daily" || a:type == "d"
    let template = [
      \ "# " . date, "",
      \ "# NOTES", "",
      \ "<++>"
      \ ]
    let filename = date
    let filename = substitute(toupper(filename), " ", "-", "g") . "." . file_extension
    return [template, filename]
  elseif a:type == "project" || a:type == "p"
    let project_name = GetUserInputAndSanitizeForVimwiki("Project name? ")
    let template = [
      \ "# PROJECT: " . project_name, "",
      \ "- STAKEHOLDERS: <++>",
      \ "- DATE: " . date,
      \ "- TICKET: <++>",
      \ "- GIT: <++>",
      \ "- TAGS: :todo:",
      \ "---", "",
      \ "# NOTES", "",
      \ "<++>"
      \ ]

    let filename = date . "_" . project_name
    let filename = substitute(toupper(filename), " ", "-", "g") . "." . file_extension
    return [template, filename]
  elseif a:type == "task" || a:type == "t"
    let task_name = GetUserInputAndSanitizeForVimwiki("Task name? ")
    let template = [
      \ "# TASK: " . task_name, "",
      \ "- STAKEHOLDERS: <++>",
      \ "- DATE: " . date,
      \ "- TICKET: <++>",
      \ "- TAGS: :todo:",
      \ "---", "",
      \ "# NOTES", "",
      \ "<++>"
      \ ]
    let filename = date . "_" . task_name
    let filename = substitute(toupper(filename), " ", "-", "g") . "." . file_extension
    return [template, filename]
  elseif a:type == "meeting" || a:type == "m"
    let meeting_title = GetUserInputAndSanitizeForVimwiki("Meeting title? ")
    let custom_date_time = GetUserInputAndSanitizeForVimwiki("Override current date/time? (y/n) ")
    let time = toupper(strftime('%I:%M %p'))
    if custom_date_time == "Y"
      let date = GetUserInputAndSanitizeForVimwiki("Date (YYYY-MM-DD-DAY): ")
      let time = GetUserInputAndSanitizeForVimwiki("Time (HH:MM AM/PM): ")
    endif
    let template = [
      \ "# MEETING: " . meeting_title, "",
      \ "- DATE: " . date,
      \ "- TIME: " . time,
      \ "- ATTENDEES: <++>",
      \ "- TAGS: <++>",
      \ "---", "",
      \ "# NOTES", "",
      \ "<++>"
      \ ]

    let filename = date . "-" . time . "_" . meeting_title
    let filename = substitute(toupper(filename), " ", "-", "g") . "." . file_extension
    return [template, filename]
  endif
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
  let date = toupper(strftime('%Y-%m-%d-%a'))

  let result = GenerateVimwikiTemplateAndFilename(a:type, date)
  let template = result[0]
  let filename = result[1]

  if a:type == "daily" || a:type == "d"
    let filepath = a:base_filepath . filename
    call WriteFile(template, filepath, 0)
  elseif a:type == "project" || a:type == "p"
    let filepath = a:base_filepath . filename

    call WriteFile(template, filepath, 1)
  elseif a:type == "task" || a:type == "t"
    let filepath = a:base_filepath . filename

    call WriteFile(template, filepath, 1)
  elseif a:type == "meeting" || a:type == "m"
    let filepath = a:base_filepath . filename

    call WriteFile(template, filepath, 1)
  endif
endfunction

nnoremap <silent> <leader>w<leader>w :call GenerateVimwikiTemplateAndWriteFile("d", vimwiki_filepath . "/daily/")<CR>
nnoremap <silent> <leader>wm :call GenerateVimwikiTemplateAndWriteFile("m", vimwiki_filepath . "/meeting/")<CR>
nnoremap <silent> <leader>wp :call GenerateVimwikiTemplateAndWriteFile("p", vimwiki_filepath . "/project/")<CR>
nnoremap <silent> <leader>wt :call GenerateVimwikiTemplateAndWriteFile("t", vimwiki_filepath . "/task/")<CR>

" Remap to insert current time and start a list for the daily notes
nnoremap <leader>wit I<Esc>:put =strftime('%I:%M %p: ')<CR>kddA<CR>- 
inoremap <leader>wit I<Esc>:put =strftime('%I:%M %p: ')<CR>kddA<CR>- 

" Search for any note with the :todo: flag in it.
nnoremap <leader>dt :Rg :todo:<CR>
