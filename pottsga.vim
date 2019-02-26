" Author: Greg Potts

set background=dark

highlight clear
if exists("syntax on")
    syntax reset
endif

let g:colors_name="pottsga"

" ---

" term:    non-color terminals
" cterm:   color terminals
" ctermfg: color terminals' foreground
" ctermbg: color terminals' background
" gui:     gui
" guifg:   gui foreground
" guibg:   gui background

" UI
hi Normal        ctermbg=NONE
hi Comment       ctermfg=8 cterm=italic
hi Todo          ctermfg=Red ctermbg=None
hi CursorLine    ctermbg=239 cterm=NONE
hi LineNr        ctermfg=7
hi Search        ctermbg=249 ctermfg=11

hi TabLineFill ctermfg=White ctermbg=NONE cterm=NONE
hi TabLine ctermfg=White ctermbg=None cterm=NONE
hi TabLineSel ctermfg=Black ctermbg=250 cterm=italic


" General
hi String        ctermfg=10

" Jinja
hi jinjaTagBlock ctermfg=Red

" HTML
hi htmlTag ctermfg=249
hi htmlEndTag ctermfg=249
hi htmlArg ctermfg=222
hi htmlTagName ctermfg=Red

" JavaScript
hi jsObjectProp ctermfg=Red
hi jsFunction ctermfg=10

" Python
hi pythonAtrribute ctermfg=Red
hi pythonStatement ctermfg=10
hi pythonFunction ctermfg=6
hi pythonBuiltin ctermfg=13
