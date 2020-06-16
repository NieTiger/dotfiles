" -----------------------------------------------------------------------------
" Name:           Halcyon Theme
" Description:    Halcyon Colour Theme
" Author:         Tiger Nie <nhl0819@gmail.com>
" Website:        https://github.com/tiega/halcyon-vim
" License:        MIT
" ----------------------------------------------------------------------------- 
" Initialisation: {{{
highlight clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name = 'halcyon'
set background=dark

if !(has('termguicolors') && &termguicolors) && !has('gui_running') && &t_Co != 256
  finish
endif

function!  GuiFor(group, ...)
  let histring = 'hi ' . a:group . ' '

  if strlen(a:1)
    let histring .= 'guibg=' . a:1 . ' '
  endif

  if strlen(a:2)
    let histring .= 'guifg=' . a:2 . ' '
  endif

  if a:0 >= 3 && strlen(a:3)
    let histring .= 'gui=' . a:3 . ' '
  endif

  execute histring
endfunction
"}}}

" Configuration:

let c = {
    \'bg0':     '#171c28',
    \'bg1':     '#1d2433',
    \'bg2':     '#2f3b54',
    \'bgs':     '#6679a4',
    \'fg2':     '#8695b7',
    \'fg1':     '#d7dce2',
    \'acc':     '#ffcc66',
    \'add':     '#bae67e',
    \'del':     '#ef6b73',
    \'mod':     '#5ccfe6',
    \
    \'kwd':     '#c3a6ff',
    \'cls':     '#ffd580',
    \'ops':     '#ffae57',
    \'str':     '#bae67e',
    \'spc':     '#5ccfe6',
    \'var':     '#a2aabc'  
\}



call GuiFor('Normal', 'NONE', c.fg1)

hi PMenuSel guifg=c.kwd guibg=NONE
hi Constant guifg=c.kwd guibg=NONE
hi Repeat guifg=c.kwd guibg=NONE
hi DiffAdd guifg=c.kwd guibg=NONE
hi GitGutterAdd guifg=c.kwd guibg=NONE
hi cssIncludeKeyword guifg=c.kwd guibg=NONE
hi Keyword guifg=c.kwd guibg=NONE

" Syntax:
" Keywords, constants, template literals (kwd) purple
call GuiFor('Type', 'NONE', c.kwd)
call GuiFor('Number', 'NONE', c.kwd)
call GuiFor("Constant", "NONE", c.kwd)
call GuiFor('Statement', 'NONE', c.kwd) " def, class
call GuiFor('Special', 'NONE', c.kwd)

call GuiFor('cssAttr', 'NONE', c.kwd)


" Functions, classes, object literal keys (cls) yellow
call GuiFor('Function', 'NONE', c.cls)
call GuiFor('Directory', 'NONE', c.cls)

call GuiFor('markdownLinkText', 'NONE', c.cls)

call GuiFor('javaScriptBoolean', 'NONE', c.cls)
call GuiFor('Storage', 'NONE', c.cls)

call GuiFor('PreProc', 'NONE', c.cls)

" Constants, operators (ops) orange
call GuiFor('Include', 'NONE', c.ops)
call GuiFor('Conditional', 'NONE', c.ops)
call GuiFor('Operator', 'NONE', c.ops)
call GuiFor('Exception', 'NONE', c.ops)

call GuiFor('javaScriptReserved', 'NONE', c.ops)

call GuiFor('cssClassName', 'NONE', c.ops)
call GuiFor('cssClassNameDot', 'NONE', c.ops)
call GuiFor('cssColor', 'NONE', c.ops)

call GuiFor('PreCondit', 'NONE', c.ops)
call GuiFor('Macro', 'NONE', c.ops)


" Strings, markdown headings (str) green
call GuiFor('Title', 'NONE', c.str)
call GuiFor('Debug', 'NONE', c.str)

call GuiFor('Todo', 'NONE', c.str)

call GuiFor('Label', 'NONE', c.str)
call GuiFor('Delimiter', 'NONE', c.str)

call GuiFor('CursorLineNR', 'NONE', c.str)
call GuiFor('Define', 'NONE', c.str)
call GuiFor('MoreMsg', 'NONE', c.str)
call GuiFor('Tag', 'NONE', c.kwd)
call GuiFor('String', 'NONE', c.str)
call GuiFor('MatchParen', 'NONE', c.str)
call GuiFor('DiffChange', 'NONE', c.str)
call GuiFor('GitGutterChange', 'NONE', c.str)


" Special keywords, classes, markdown code blocks (spc) blue
call GuiFor('SpecialChar', 'NONE', c.spc)

call GuiFor('cssBoxProp', 'NONE', c.spc)
call GuiFor('cssMediaProp', 'NONE', c.spc)
call GuiFor('cssBorderProp', 'NONE', c.spc)
call GuiFor('cssPositioningProp', 'NONE', c.spc)
call GuiFor('cssFlexibleBoxProp', 'NONE', c.spc)
call GuiFor('cssTextProp', 'NONE', c.spc)
call GuiFor('cssFontProp', 'NONE', c.spc)
call GuiFor('cssUIProp', 'NONE', c.spc)

call GuiFor('cssIdentifier ', 'NONE', c.spc)
call GuiFor('cssImportant', 'NONE', c.spc)
call GuiFor('Identifier ', 'NONE', c.spc)

call GuiFor('cssBraces', 'NONE', c.spc)
call GuiFor('cssTagName', 'NONE', c.spc)

" Variables, property names, tags (var) grey
"

" Workbench background (bg0)
"
" Editor background (bg1)
"
" Highlight, widgets, panels (bg2)
call GuiFor('Visual', c.bg2, 'NONE')
call GuiFor('VertSplit', 'NONE', c.bg1)

" Dividers, subtle UI elements (bgs) dark grey
call GuiFor('LineNr', 'NONE', c.bgs)

" Status bar text, buttons, etc (fg2) grey
call GuiFor('Comment', 'NONE', c.fg2, "italic")
call GuiFor('SpecialComment', 'NONE', c.fg2)
call GuiFor('NonText', 'NONE', c.fg2)

" Active text, anything that should be white (fg1) light grey

" Accent, list tree titles, badges, etc (acc) orange

" Addition highlights (add) green
"
" Deletion highlights, errors, warnings (del) red

call GuiFor('DiffText', 'NONE', c.del)
call GuiFor('ErrorMsg', 'NONE', c.del)
call GuiFor('WarningMsg', 'NONE', c.del)
call GuiFor('Error', 'NONE', c.del)
call GuiFor('DiffDelete', 'NONE', c.del)
call GuiFor('GitGutterDelete', 'NONE', c.del)
call GuiFor('GitGutterChangeDelete', 'NONE', c.del)

" Modified highlights (mod) cyan

"hi Pmenu guifg=#d7dce2 guibg=#454545
"hi SignColumn guibg=#1d2433
"hi Title guifg=#d7dce2
"hi CursorLine guibg=#FFFFFF
"hi TabLineFill gui=NONE guibg=#454545
"hi TabLine guifg=#647589 guibg=#454545 gui=NONE
"hi StatusLine gui=bold guibg=#454545 guifg=#d7dce2
"hi StatusLineNC gui=NONE guibg=#1d2433 guifg=#d7dce2

" Complex
call GuiFor('IncSearch', 'NONE', c.fg1)
call GuiFor('Search', c.bgs, 'NONE')

