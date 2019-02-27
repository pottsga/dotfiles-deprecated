<<<<<<< HEAD
set background=dark
hi clear
if (exists("syntax_on"))
    syntax reset
endif
let g:colors_name="pottsga"

" UI
hi Normal               ctermfg=White   ctermbg=NONE

" LineNR 
hi LineNR               ctermfg=Grey    ctermbg=NONE
hi CursorLineNR         ctermfg=White   ctermbg=Red     cterm=bold
hi CursorLine                                           cterm=NONE

" TabLinoe
hi TabLineFill          ctermfg=NONE    ctermbg=NONE    cterm=NONE
hi TabLine              ctermfg=White   ctermbg=NONE    cterm=NONE
hi TabLineSel           ctermfg=Black   ctermbg=White   cterm=NONE

" StatusLine
hi StatusLine           ctermfg=Red     ctermbg=NONE
hi StatusLineNC         ctermfg=White   ctermfg=NONE

" NerdTree
hi NerdTreeCWD          ctermfg=Red
hi NerdTreeDir          ctermfg=Blue
hi NerdTreeUp           ctermfg=Grey
hi NerdTreeHelp         ctermfg=Grey

" Syntax
hi Comment              ctermfg=Grey    ctermbg=NONE    cterm=italic
hi Function             ctermfg=Cyan    ctermbg=NONE
hi Type                 ctermfg=Cyan    ctermbg=NONE
hi String               ctermfg=Green   ctermbg=NONE

" HTML
hi htmlTag              ctermfg=Grey
hi htmlEndTag           ctermfg=Grey
hi htmlTagName          ctermfg=Red
hi htmlArg              ctermfg=Yellow
hi htmlString           ctermfg=Green
hi link htmlScriptTag htmlTag
hi link htmlSpecialTagName htmlTagName

" XML (JSX)
hi link xmlTag htmlTag
hi link xmlEndTag xmlTag
hi link xmlTagName htmlTagName
hi link xmlTagN xmlTagName
hi link xmlAttrib htmlArg
hi link xmlString htmlString

" JS
hi jsString             ctermfg=Green
hi jsTemplateString     ctermfg=Green
hi jsTemplateExpression ctermfg=Magenta
hi jsTemplateBraces     ctermfg=Yellow
hi jsNumber             ctermfg=Magenta
hi jsFunction           ctermfg=Magenta
hi jsReturn             ctermfg=Magenta

" Python
hi pythonStatement      ctermfg=Magenta

" CSS
hi cssClassName         ctermfg=Yellow
hi cssIdentifier        ctermfg=Green
hi cssTagName           ctermfg=Red

" Jinja2
hi jinjaVariable        ctermfg=Blue
hi jinjaString          ctermfg=Green
hi jinjaFilter          ctermfg=Red
hi jinjaAttribute       ctermfg=Yellow
hi jinjaStatement       ctermfg=Magenta
=======
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
>>>>>>> refs/remotes/origin/simplified
