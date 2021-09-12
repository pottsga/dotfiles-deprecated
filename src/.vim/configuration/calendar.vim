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

  let padded_month = a:month
  let padded_day = a:day

  " Pad the month if it's less than 10
  if a:month < 10
    let padded_month = "0" . a:month 
  endif

  " Pad the day if it's less than 10
  if a:day < 10
    let padded_day = "0" . a:day
  endif

  let date = a:year . '-' . padded_month . '-' . padded_day . '-' . day_of_week

  let result = GenerateVimwikiTemplateAndFilename("d", date)
  let template = result[0]
  let filename = result[1]

  let filepath = a:base_filepath . filename
  call WriteFile(template, filepath, 0)
endfunction

" Calendar.vim -> vimwiki integration
autocmd FileType calendar nmap <silent> <buffer> <CR> :<C-u>call CalendarAction(vimwiki_filepath . "/daily/", b:calendar.day().get_day(), b:calendar.day().get_month(), b:calendar.day().get_year(), b:calendar.day().is_monday(), b:calendar.day().is_tuesday(), b:calendar.day().is_wednesday(), b:calendar.day().is_thursday(), b:calendar.day().is_friday(), b:calendar.day().is_saturday(), b:calendar.day().is_sunday())<CR>

" Calendar widget
nnoremap <leader>cal :Calendar<CR>
