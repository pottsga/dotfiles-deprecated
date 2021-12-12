autocmd BufEnter * set expandtab " Always expand tab regardless

" Python Settings
augroup pythonSettingsGroup
  autocmd FileType python 
        \ setlocal shiftwidth=4|
        \ setlocal tabstop=4|
        \ setlocal softtabstop=4
augroup END
