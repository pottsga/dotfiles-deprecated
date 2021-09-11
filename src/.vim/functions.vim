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

" Write the file to the filesystem. If the ask parameter is 1, then ask the
" user whether or not they'd like to write the file. Else, just write it.
"
" Args:
"   template (str): The template string to insert into the file
"   filepath (str): The full file path of the file
"   ask (str): 1 or 0. If 1, then ask the user if they are sure they want to write
function! WriteFile(template, filepath, ask)
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
    let filename = date . "." . file_extension
    return [template, filename]
  elseif a:type == "project" || a:type == "p"
    let project_name = GetUserInputAndSanitizeForVimwiki("Project name? ")
    let template = [
      \ "# PROJECT: " . project_name, "",
      \ "- STAKEHOLDERS: <++>",
      \ "- DATE: " . date,
      \ "- GIT: <++>",
      \ "- TICKET: <++>",
      \ "---", "",
      \ "# NOTES", "",
      \ "<++>"
      \ ]

    let filename = date . "_" . project_name . "." . file_extension
    return [template, filename]
  elseif a:type == "task" || a:type == "t"
    let task_name = GetUserInputAndSanitizeForVimwiki("Task name? ")
    let template = [
      \ "# TASK: " . task_name, "",
      \ "- STAKEHOLDERS: <++>",
      \ "- DATE: " . date,
      \ "- TICKET: <++>",
      \ "---", "",
      \ "# NOTES", "",
      \ "<++>"
      \ ]
    let filename = date . "_" . task_name . "." . file_extension
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
      \ "---", "",
      \ "# NOTES", "",
      \ "<++>"
      \ ]

    let filename = date . "-" . time . "_" . meeting_title . "." . file_extension
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

" Custom version of the vimwiki#diary#calendar_action function that inserts a
" diary file through a calendar.vim integration.
" 
" Args:
"   base_filepath (str): the base place on the filesystem to put the file
"     generated per the template.
"   day (str): The day of the new file
"   month (str): The month of the new file
"   year (str): The year of the new file
"   is_Xday (int): 1 if the day of the week is that day of the week, else 0.
function! CalendarAction(base_filepath, day, month, year, is_monday, is_tuesday, is_wednesday, is_thursday, is_friday, is_saturday, is_sunday)
  let day_of_week = ''
  if a:is_monday == 1
    let day_of_week = 'MON'
  elseif a:is_tuesday == 1
    let day_of_week = 'TUE'
  elseif a:is_wednesday == 1
    let day_of_week = 'WED'
  elseif a:is_thursday == 1
    let day_of_week = 'THU'
  elseif a:is_friday == 1
    let day_of_week = 'FRI'
  elseif a:is_saturday == 1
    let day_of_week = 'SAT'
  elseif a:is_sunday == 1
    let day_of_week = 'SUN'
  endif

  let date = a:year . '-' . a:month . '-' . a:day . '-' . day_of_week

  let result = GenerateVimwikiTemplateAndFilename("d", date)
  let template = result[0]
  let filename = result[1]

  let filepath = a:base_filepath . filename
  call WriteFile(template, filepath, 0)
endfunction
