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

function! GetDateFromUserForMeeting()
  " Get the user's input for a date and make sure that the date input matches
  " the expected format of YYYY-MM-DD

  " The current date as of when the script was ran.
  let current_date = toupper(strftime("%Y-%m-%d"))
  let meeting_date = current_date
  " Is the current date the correct date for the meeting? If so, let's
  " just use that.
  let current_date_correct = toupper(input("Is the meeting today, " . current_date . "? (y/n) "))

  " Else, if the current date is not correct, we need to get that
  " information from the user.
  if current_date_correct == "N"
    " Is the date format correct?
    let format_correct = "N"
    " While the format is incorrect, keep asking the user for input.
    while format_correct == "N"
      " Get the user's input on what the date should be.
      let user_meeting_date = toupper(input("What is the date? (YYYY-MM-DD): "))

      " If the user's input matches the format expected
      if user_meeting_date =~ '^\d\d\d\d-\d\d-\d\d$'
        let format_correct = "Y"
        let meeting_date = strptime("%Y-%m-%d", user_meeting_date)
      else
        echo " ERROR: Incorrect format"
      endif
    endwhile

    return meeting_date
  endif
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

    " Ask the user if the meeting has a specific time or not
    let has_time = toupper(input("Does the meeting have a specific date and time? (y/n) "))

    " If it does have a specific time, we want to get that information from
    " the user. When is the meeting, and on what day?
    if has_time == "Y"
      let format_correct = "N" " set the format to incorrect by default since we haven't yet checked it.

      while format_correct == "N"
        " Get the user's input for the date and time to be used
        let user_input_datetime = toupper(input("Enter the time in YYYY-MM-DD-HHMM[AM|PM] format: "))
        
        " Make sure the user's input matches the expected format.
        if user_input_datetime =~ '\v^\d{4}-\d{2}-\d{2}-\d{3,4}(AM|PM)$'
          let format_correct = "Y"
          let prepend_datetime=user_input_datetime
          " Set the prepend_datetime to whatever the user input since that is
          " of a valid format. Also, set format_correct equal to yes so we
          " break the loop.
        else
          echo " ERROR: Incorrect format."
          " Loop
        endif
      endwhile
    else
      " The date/time is right now
      let prepend_datetime=toupper(strftime("%Y-%m-%d-%I%M%p"))
      " Just let the user know what's going on.
      echo "\rUsing the currend date and time value of: " . prepend_datetime
    endif

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
    " call system("touch " . fp)

    let template=GetVimwikiTemplate(a:type)

    call writefile(template, fp, "a")

    echom "Wrote " . fp
  else
    echom "Cancelled..."
  endif
endfunction

function! GetVimwikiTemplate(template_name)
  " Define what should be inserted into the file automatically
  " let current_date = strftime("%Y-%m-%d")

  if a:template_name == "diary"
    let diary = [
          \ "= " . split(expand('%:r'),'/')[-1] . "=", "",
          \ "= MEETINGS =",  "",
          \ "= NOTES =", "",
          \ "<++>"]
    return diary
  elseif a:template_name == "meeting" || a:template_name == "m"
    let meeting = [
          \ "= <++> =", "",
          \ "- ATTENDEES: <++>", "",
          \ "- DATE: <++>", 
          \ "- TIME: <++>", 
          \ "----", "",
          \ "= NOTES =", "",
          \ "<++>"]
    return meeting
  elseif a:template_name == "project" || a:template_name == "p"
    let project = [
          \ "= <++> =", "",
          \ "- STAKEHOLDERS: <++>",
          \ "- TICKET: <++>",
          \ "- GIT: <++>",
          \ "----", "",
          \ "= NOTES =", "",
          \ "<++>"]
    return project
  endif
endfunction
