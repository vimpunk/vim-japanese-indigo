" ===============================================================
" Project: Japanese Indigo
" Repository: https://github.com/mandreyel/vim-japanese-indigo"
" License: MIT
" ===============================================================

" ---------------------------------------------------------------
" Setup
" ---------------------------------------------------------------
set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="JapaneseIndigo"

if has('nvim')
    " For Neovim 0.1.3 and 0.1.4
    if has('nvim-0.1.4') || has('nvim-0.1.4')
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif

    " Or if you have Neovim >= 0.1.5
    if has('nvim-0.1.5') && has("termguicolors")
        set termguicolors
    endif
else
    if v:version < 800
        " for vim 7
        set t_Co=256
    else
        " for vim 8
        if has("termguicolors")
            set termguicolors
        endif
    endif
endif


" ---------------------------------------------------------------
" Italics
" ---------------------------------------------------------------
let g:japanese_indigo_terminal_italic = get(g:, 'japanese_indigo_terminal_italic', 0)
let s:italic = ""
if g:japanese_indigo_terminal_italic == 1
    let s:italic = "italic"
endif


" ---------------------------------------------------------------
" Bold
" ---------------------------------------------------------------
let g:japanese_indigo_terminal_bold = get(g:, 'japanese_indigo_terminal_bold', 0)
let s:bold = ""
if g:japanese_indigo_terminal_bold == 1
    let s:bold = "bold"
endif


" ---------------------------------------------------------------
" Colors
" ---------------------------------------------------------------
" indigo / theme base
let s:indigo=['#313b49', '235']
let s:medium_indigo=['#3d4754', '237']
let s:light_indigo=['#65737e', '243']
let s:medium_grey=['#4f5b66', '240']

let s:dark_silver=['#a7adba', '145']
let s:medium_silver=['#c0c5ce', '251']
"let s:base06=['#cdd3de', '252']
let s:light_silver=['#d8dee9', '253']
let s:bone_white=['#aab1be', '203']

" nord colors
let s:nord_yellow=['#ebcb8b', '221']
"let s:nord_orange=['#d08770', '209']
let s:nord_red=['#bf616a', '176']
let s:nord_pink=['#b48ead', '176']
let s:nord_turquoise=['#88c0d0', '73']
let s:nord_blue=['#5e81ac', '68']
let s:nord_green=['#a3b38c', '114']
"let s:nord_light_blue=['#81a1c1', '68']

" pastel colors
let s:pastel_green=['#99c794', '114']
"let s:pastel_turquoise=['#62b3b2', '73']
let s:pastel_purple=['#ad7fa8', '176']

"let s:cambridge_blue=['#96bbbb', '73']
let s:brown=['#ab7967', '137']
"let s:steel_teal=['#618985', '74']
"let s:granite_purple=['#67597a', '68']
let s:white=['#ffffff', '15']
let s:none=['NONE', 'NONE']


" ---------------------------------------------------------------
" Highlight function
" ---------------------------------------------------------------
function! <sid>hi(group, fg, bg, attr, attrsp)
    " fg, bg, attr, attrsp
    if !empty(a:fg)
        exec "hi " . a:group . " guifg=" .  a:fg[0]
        exec "hi " . a:group . " ctermfg=" . a:fg[1]
    endif
    if !empty(a:bg)
        exec "hi " . a:group . " guibg=" .  a:bg[0]
        exec "hi " . a:group . " ctermbg=" . a:bg[1]
    endif
    if a:attr != ""
        exec "hi " . a:group . " gui=" .   a:attr
        exec "hi " . a:group . " cterm=" . a:attr
    endif
    if !empty(a:attrsp)
        exec "hi " . a:group . " guisp=" . a:attrsp[0]
    endif
endfunction


" ---------------------------------------------------------------
" call <sid>:hi(group, fg, bg, gui, guisp)
" ---------------------------------------------------------------
call <sid>hi('Bold', '', '', 'bold', '')
call <sid>hi('Debug', s:bone_white, '', '', '')
call <sid>hi('Directory', s:nord_blue, '', '', '')
call <sid>hi('ErrorMsg', s:nord_red, s:indigo, '', '')
call <sid>hi('Exception', s:nord_red, '', '', '')
call <sid>hi('FoldColumn', s:nord_blue, s:indigo, '', '')
call <sid>hi('Folded', s:light_indigo, s:medium_indigo, s:italic, '')
call <sid>hi('Italic', '', '', s:italic, '')

call <sid>hi('Macro', s:nord_pink, '', '', '')
call <sid>hi('MatchParen', s:nord_red, s:indigo, '', '')
"call <sid>hi('MatchParen', s:nord_orange, s:indigo, '', '')
call <sid>hi('ModeMsg', s:pastel_green, '', '', '')
call <sid>hi('MoreMsg', s:pastel_green, '', '', '')
call <sid>hi('Question', s:nord_blue, '', '', '')

call <sid>hi('Search', s:indigo, s:nord_red, '', '')
call <sid>hi('IncSearch', s:medium_indigo, s:nord_red, '', '')

call <sid>hi('SpecialKey', s:light_indigo, '', '', '')
call <sid>hi('TooLong', s:bone_white, '', '', '')
call <sid>hi('Underlined', s:bone_white, '', '', '')
call <sid>hi('Visual', '', s:medium_grey, '', '')
call <sid>hi('VisualNOS', s:bone_white, '', '', '')
call <sid>hi('WarningMsg', s:bone_white, '', '', '')
call <sid>hi('WildMenu', s:white, s:nord_blue, '', '')
call <sid>hi('Title', s:nord_blue, '', '', '')
call <sid>hi('Conceal', s:nord_blue, s:indigo, '', '')
call <sid>hi('Cursor', s:indigo, s:medium_silver, '', '')
call <sid>hi('NonText', s:light_indigo, '', '', '')
call <sid>hi('Normal', s:medium_silver, s:indigo, '', '')
call <sid>hi('EndOfBuffer', s:medium_silver, s:indigo, '', '')
call <sid>hi('LineNr', s:light_indigo, s:indigo, '', '')
call <sid>hi('SignColumn', s:indigo, s:indigo, '', '')
call <sid>hi('StatusLine', s:light_indigo, s:medium_indigo, '', '')
call <sid>hi('StatusLineNC', s:medium_indigo, s:light_indigo, '', '')
call <sid>hi('VertSplit', s:indigo, s:medium_grey, '', '')
call <sid>hi('ColorColumn', '', s:medium_indigo, '', '')
call <sid>hi('CursorColumn', '', s:medium_indigo, '', '')
call <sid>hi('CursorLine', '', s:medium_indigo, 'NONE', '')
call <sid>hi('CursorLineNR', s:indigo, s:indigo, '', '')
call <sid>hi('CursorLineNr', s:light_indigo, s:medium_indigo, '', '')
call <sid>hi('PMenu', s:dark_silver, s:medium_indigo, '', '')
call <sid>hi('PMenuSel', s:white, s:nord_blue, '', '')
call <sid>hi('PmenuSbar', '', s:medium_grey, '', '')
call <sid>hi('PmenuThumb', '', s:light_silver, '', '')
call <sid>hi('TabLine', s:light_indigo, s:medium_indigo, '', '')
call <sid>hi('TabLineFill', s:light_indigo, s:medium_indigo, '', '')
call <sid>hi('TabLineSel', s:pastel_green, s:medium_indigo, '', '')
call <sid>hi('helpExample', s:nord_yellow, '', '', '')
call <sid>hi('helpCommand', s:nord_yellow, '', '', '')

" Standard syntax highlighting
call <sid>hi('Boolean', s:nord_red, '', '', '')
call <sid>hi('Character', s:bone_white, '', '', '')
call <sid>hi('Comment', s:light_indigo, '', s:italic, '')
call <sid>hi('Conditional', s:nord_pink, '', '', '')
call <sid>hi('Constant', s:nord_red, '', '', '')
call <sid>hi('Define', s:nord_pink, '', '', '')
call <sid>hi('Delimiter', s:brown, '', '', '')
call <sid>hi('Float', s:nord_red, '', '', '')
call <sid>hi('Function', s:nord_blue, '', '', '')
call <sid>hi('Identifier', s:bone_white, '', '', '')
call <sid>hi('Include', s:nord_blue, '', '', '')
call <sid>hi('Keyword', s:nord_pink, '', '', '')
call <sid>hi('Label', s:nord_turquoise, '', '', '')
call <sid>hi('Number', s:nord_red, '', '', '')
call <sid>hi('Operator', s:medium_silver, '', '', '')
call <sid>hi('PreProc', s:nord_yellow, '', '', '')
call <sid>hi('Repeat', s:nord_pink, '', '', '')
call <sid>hi('Special', s:nord_pink, '', '', '')
call <sid>hi('SpecialChar', s:brown, '', '', '')
call <sid>hi('Statement', s:bone_white, '', '', '')
call <sid>hi('StorageClass', s:nord_turquoise, '', '', '')
call <sid>hi('String', s:nord_green, '', '', '')
call <sid>hi('Structure', s:nord_turquoise, '', '', '')
call <sid>hi('Tag', s:nord_turquoise, '', '', '')
call <sid>hi('Todo', s:nord_yellow, s:indigo, '', '')
call <sid>hi('Type', s:nord_turquoise, '', '', '')
call <sid>hi('Typedef', s:nord_turquoise, '', '', '')

call <sid>hi('SpellBad', '', '', 'undercurl', '')
call <sid>hi('SpellLocal', '', '', 'undercurl', '')
call <sid>hi('SpellCap', '', '', 'undercurl', '')
call <sid>hi('SpellRare', '', '', 'undercurl', '')

" C++
call <sid>hi('cppStatement', s:nord_red, '', '', '')
call <sid>hi('cppModifier', s:nord_turquoise, '', '', '')
call <sid>hi('cppAccess', s:nord_red, '', '', '')
call <sid>hi('cppExceptions', s:nord_red, '', '', '')
call <sid>hi('cppOperator', s:nord_turquoise, '', '', '')
call <sid>hi('cppCast', s:nord_red, '', '', '')
call <sid>hi('cppStorageClass', s:nord_turquoise, '', '', '')
call <sid>hi('cppStructure', s:nord_turquoise, '', '', '')
call <sid>hi('cppConstant', s:nord_red, '', '', '')
call <sid>hi('cppRawString', s:pastel_green, '', '', '')

call <sid>hi('csClass', s:nord_yellow, '', '', '')
call <sid>hi('csAttribute', s:nord_yellow, '', '', '')
call <sid>hi('csModifier', s:nord_pink, '', '', '')
call <sid>hi('csType', s:bone_white, '', '', '')
call <sid>hi('csUnspecifiedStatement', s:nord_blue, '', '', '')
call <sid>hi('csContextualStatement', s:nord_pink, '', '', '')
call <sid>hi('csNewDecleration', s:bone_white, '', '', '')
call <sid>hi('cOperator', s:nord_turquoise, '', '', '')
call <sid>hi('cPreCondit', s:nord_pink, '', '', '')

call <sid>hi('cssColor', s:nord_turquoise, '', '', '')
call <sid>hi('cssBraces', s:medium_silver, '', '', '')
call <sid>hi('cssClassName', s:nord_pink, '', '', '')

call <sid>hi('DiffAdd', s:pastel_green, s:medium_indigo, '', '')
call <sid>hi('DiffChange', s:light_indigo, s:medium_indigo, '', '')
call <sid>hi('DiffDelete', s:bone_white, s:medium_indigo, '', '')
call <sid>hi('DiffText', s:nord_blue, s:medium_indigo, '', '')
call <sid>hi('DiffAdded', s:white, s:pastel_green, '', '')
call <sid>hi('DiffFile', s:bone_white, s:indigo, '', '')
call <sid>hi('DiffNewFile', s:pastel_green, s:indigo, '', '')
call <sid>hi('DiffLine', s:nord_blue, s:indigo, '', '')
call <sid>hi('DiffRemoved', s:white, s:bone_white, '', '')

call <sid>hi('gitCommitOverflow', s:bone_white, '', '', '')
call <sid>hi('gitCommitSummary', s:pastel_green, '', '', '')

call <sid>hi('htmlBold', s:nord_yellow, '', '', '')
call <sid>hi('htmlItalic', s:nord_pink, '', '', '')
call <sid>hi('htmlTag', s:nord_turquoise, '', '', '')
call <sid>hi('htmlEndTag', s:nord_turquoise, '', '', '')
call <sid>hi('htmlArg', s:nord_yellow, '', '', '')
call <sid>hi('htmlTagName', s:light_silver, '', '', '')

call <sid>hi('javaScript', s:medium_silver, '', '', '')
call <sid>hi('javaScriptNumber', s:nord_red, '', '', '')
call <sid>hi('javaScriptBraces', s:medium_silver, '', '', '')

call <sid>hi('markdownCode', s:pastel_green, '', '', '')
call <sid>hi('markdownCodeBlock', s:pastel_green, '', '', '')
call <sid>hi('markdownHeadingDelimiter', s:nord_blue, '', '', '')
call <sid>hi('markdownItalic', s:nord_pink, '', s:italic, '')
call <sid>hi('markdownBold', s:nord_yellow, '', s:bold, '')
call <sid>hi('markdownCodeDelimiter', s:brown, '', s:italic, '')
call <sid>hi('markdownError', s:medium_silver, s:indigo, '', '')

call <sid>hi('NeomakeErrorSign', s:bone_white, s:indigo, '', '')
call <sid>hi('NeomakeWarningSign', s:nord_yellow, s:indigo, '', '')
call <sid>hi('NeomakeInfoSign', s:white, s:indigo, '', '')
call <sid>hi('NeomakeError', s:bone_white, '', 'undercurl', s:bone_white)
call <sid>hi('NeomakeWarning', s:bone_white, '', 'undercurl', s:bone_white)

call <sid>hi('ALEErrorSign', s:bone_white, s:indigo, s:bold, '')
call <sid>hi('ALEWarningSign', s:nord_yellow, s:indigo, s:bold, '')
call <sid>hi('ALEInfoSign', s:white, s:indigo, s:bold, '')

call <sid>hi('NERDTreeExecFile', s:medium_silver, '', '', '')
call <sid>hi('NERDTreeDirSlash', s:nord_blue, '', '', '')
call <sid>hi('NERDTreeOpenable', s:nord_blue, '', '', '')

call <sid>hi('phpComparison', s:medium_silver, '', '', '')
call <sid>hi('phpParent', s:medium_silver, '', '', '')
call <sid>hi('phpMemberSelector', s:medium_silver, '', '', '')

call <sid>hi('pythonRepeat', s:nord_pink, '', '', '')
call <sid>hi('pythonOperator', s:nord_pink, '', '', '')

call <sid>hi('rubyConstant', s:nord_yellow, '', '', '')
call <sid>hi('rubySymbol', s:pastel_green, '', '', '')
call <sid>hi('rubyAttribute', s:nord_blue, '', '', '')
call <sid>hi('rubyInterpolation', s:pastel_green, '', '', '')
call <sid>hi('rubyInterpolationDelimiter', s:brown, '', '', '')
call <sid>hi('rubyStringDelimiter', s:pastel_green, '', '', '')
call <sid>hi('rubyRegexp', s:nord_turquoise, '', '', '')

call <sid>hi('sassidChar', s:bone_white, '', '', '')
call <sid>hi('sassClassChar', s:nord_red, '', '', '')
call <sid>hi('sassInclude', s:nord_pink, '', '', '')
call <sid>hi('sassMixing', s:nord_pink, '', '', '')
call <sid>hi('sassMixinName', s:nord_blue, '', '', '')

call <sid>hi('vimfilerLeaf', s:medium_silver, '', '', '')
call <sid>hi('vimfilerNormalFile', s:medium_silver, s:indigo, '', '')
call <sid>hi('vimfilerOpenedFile', s:nord_blue, '', '', '')
call <sid>hi('vimfilerClosedFile', s:nord_blue, '', '', '')

call <sid>hi('GitGutterAdd', s:pastel_green, s:indigo, s:bold, '')
call <sid>hi('GitGutterChange', s:nord_blue, s:indigo, s:bold, '')
call <sid>hi('GitGutterDelete', s:bone_white, s:indigo, s:bold, '')
call <sid>hi('GitGutterChangeDelete', s:nord_pink, s:indigo, s:bold, '')

call <sid>hi('xmlTag', s:nord_turquoise, '', '', '')
call <sid>hi('xmlTagName', s:medium_silver, '', '', '')
call <sid>hi('xmlEndTag', s:nord_turquoise, '', '', '')

let g:terminal_color_0=s:indigo[0]
let g:terminal_color_8=s:indigo[0]

let g:terminal_color_1=s:bone_white[0]
let g:terminal_color_9=s:bone_white[0]

let g:terminal_color_2=s:pastel_green[0]
let g:terminal_color_10=s:pastel_green[0]

let g:terminal_color_3=s:nord_yellow[0]
let g:terminal_color_11=s:nord_yellow[0]

let g:terminal_color_4=s:nord_blue[0]
let g:terminal_color_12=s:nord_blue[0]

let g:terminal_color_5=s:nord_pink[0]
let g:terminal_color_13=s:nord_pink[0]

let g:terminal_color_6=s:nord_turquoise[0]
let g:terminal_color_14=s:nord_turquoise[0]

let g:terminal_color_7=s:medium_silver[0]
let g:terminal_color_15=s:medium_silver[0]

let g:terminal_color_background=s:indigo[0]
let g:terminal_color_foreground=s:white[0]

