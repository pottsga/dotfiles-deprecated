" Calendar.vim -> vimwiki integration
autocmd FileType calendar nmap <silent> <buffer> <CR> :<C-u>call CalendarAction(vimwiki_filepath . "/daily/", b:calendar.day().get_day(), b:calendar.day().get_month(), b:calendar.day().get_year(), b:calendar.day().is_monday(), b:calendar.day().is_tuesday(), b:calendar.day().is_wednesday(), b:calendar.day().is_thursday(), b:calendar.day().is_friday(), b:calendar.day().is_saturday(), b:calendar.day().is_sunday())<CR>

" Calendar widget
nnoremap <leader>cal :Calendar<CR>
