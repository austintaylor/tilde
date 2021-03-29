" =============================================================================
" File:        tao.vim
" Description: Minimalist grayscale color scheme for Vim
" Maintainer:  11111000000 (Petr)
" =============================================================================
highlight clear
if exists("syntax_on")
  syntax reset
endif
let colors_name = "tao"

if &background == "light"
  hi Normal       guifg=#595959      guibg=#fefefe   gui=NONE
  hi IncSearch    guifg=#fefefe      guibg=#505050   gui=NONE
  hi Search       guifg=#fefefe      guibg=#9a9a9a   gui=NONE
  hi MatchParen   guifg=#000000      guibg=#9a9a9a   gui=bold
  hi Cursor       guifg=bg           guibg=#424242   gui=NONE
  hi CursorIM     guifg=bg           guibg=fg        gui=NONE
  hi lCursor      guifg=bg           guibg=#313131   gui=NONE
  hi CursorLine   guifg=NONE         guibg=#f7f7f7   gui=NONE
  hi CursorColumn guifg=#818181         guibg=#f9f9f9      gui=NONE
  hi LineNr       guifg=#e0e0e0      guibg=bg        gui=NONE
  hi CursorLineNr guifg=#c5c5c5      guibg=#f7f7f7   gui=NONE

  hi Function     guifg=#333333      guibg=NONE      gui=bold
  hi String       guifg=#818181      guibg=NONE      gui=italic
  hi Special      guifg=#333333      guibg=NONE      gui=bold
  hi Identifier   guifg=#505050      guibg=NONE      gui=NONE
  hi Label        guifg=#717171      guibg=NONE      gui=underline,bold

  hi Keyword      guifg=#333333      guibg=NONE      gui=bold
  hi Statement    guifg=#333333      guibg=NONE      gui=bold
  hi Conditional  guifg=#333333      guibg=NONE      gui=bold

  hi Boolean      guifg=#757575      guibg=NONE      gui=bold,italic
  hi PreProc      guifg=#6b6b6b      guibg=NONE      gui=bold
  hi Include      guifg=#565656      guibg=NONE      gui=bold
  hi Delimiter    guifg=#333333      guibg=NONE      gui=NONE
  hi Type         guifg=#333333      guibg=NONE      gui=bold
  hi Todo         guifg=#eeeeee      guibg=#999999   gui=bold
  hi Comment      guifg=#bbbbbb      guibg=NONE      gui=italic
  hi Constant     guifg=#616161      guibg=NONE      gui=bold

  hi Directory    guifg=#424242      guibg=bg        gui=NONE
  hi ErrorMsg     guifg=#6f6f6f      guibg=NONE      gui=NONE
  hi FoldColumn   guifg=#555555      guibg=#aaaaaa   gui=bold
  hi Folded       guifg=#cccccc      guibg=bg        gui=italic
  hi ModeMsg      guifg=#000000      guibg=#767676   gui=bold
  hi MoreMsg      guifg=#7c7c7c      guibg=bg        gui=bold
  hi NonText      guifg=#f1f1f1      guibg=bg        gui=bold
  hi Question     guifg=#454545      guibg=bg        gui=bold
  hi SignColumn   guifg=#777777      guibg=bg        gui=NONE
  hi SpecialKey   guifg=#000000      guibg=#696969   gui=NONE

  hi Visual       guifg=#222222      guibg=#c5c5c5   gui=NONE
  hi VisualNOS    guifg=#222222      guibg=#a7a7a7   gui=none

  hi Title        guifg=#777777      guibg=NONE        gui=bold
  hi VertSplit    guifg=bg           guibg=bg

  hi Pmenu        guifg=#333333      guibg=#aaaaaa   gui=NONE
  hi PmenuSel     guifg=#cccccc      guibg=#6b6b6b   gui=bold
  hi PmenuSbar    guifg=fg           guibg=#5d5d5d   gui=NONE
  hi PmenuThumb   guifg=fg           guibg=#777777   gui=NONE
  hi WildMenu     guifg=#000000      guibg=#eeeeee   gui=NONE

  hi DiffAdd      guifg=NONE         guibg=#000000   gui=NONE
  hi DiffChange   guifg=fg           guibg=#252525   gui=NONE
  hi DiffDelete   guifg=NONE         guibg=#000      gui=NONE
  hi DiffText     guifg=NONE         guibg=#444444   gui=NONE

  hi StatusLine   guifg=#000000      guibg=#727272   gui=bold
  hi StatusLineNC guifg=#5a5959      guibg=#222222   gui=italic

  hi TabLine      guifg=#777777      guibg=#eeeeee   gui=NONE
  hi TabLineFill  guifg=#010101      guibg=#eeeeee   gui=NONE
  hi TabLineSel   guifg=#222222      guibg=bg        gui=bold

  hi SpellBad     guisp=#000000      guibg=#ffffff   gui=undercurl    guisp=#000000
  hi SpellCap     guisp=#5d5d5d                      gui=undercurl
  hi SpellLocal   guisp=#434343                      gui=undercurl
  hi SpellRare    guisp=#7d7d7d                      gui=undercurl

  hi WarningMsg   guifg=#cfcfcf      guibg=#5b5b5b   gui=NONE
  hi Ignore       guifg=bg           guibg=NONE      gui=NONE
  hi Error        guifg=#000000      guibg=NONE      gui=undercurl guisp=#000000
  hi VimError     guifg=#b6b6b6      guibg=#313131   gui=bold
  hi VimCommentTitle  guifg=#5c5c5c  guibg=bg        gui=bold,italic

  "hi cssBraces        guifg=fg            guibg=bg              gui=NONE
  "hi javaScript       guifg=fg            guibg=NONE
  "hi lsRegex          guifg=#888   guibg=NONE   gui=underline
  hi CtrlPMatch   guifg=#333333          guibg=#dadada   gui=NONE
  "hi CtrlPPrtText   guifg=NONE          guibg=#aaaaaa   gui=NONE
  "hi CtrlPPrtBase  guifg=NONE          guibg=#000   gui=NONE
  "au BufEnter ControlP  hi CursorLine   guifg=NONE             guibg=#090909   gui=NONE
  "
  hi lsNumberComment     guifg=#525252          guibg=NONE      gui=italic
  hi lsFloat             guifg=#525252          guibg=NONE      gui=italic
  hi lsAngular           guifg=#333333          guibg=NONE      gui=bold,italic,underline
  hi lsAngularMethods    guifg=#333333          guibg=NONE      gui=bold
  hi lsAServices         guifg=#484848          guibg=NONE      gui=bold
  hi jadeJavascriptBlock guifg=#505050          guibg=NONE      gui=NONE
  hi jadeClass           guifg=#474747          guibg=NONE      gui=bold
  hi jadeClassChar       guifg=#474747          guibg=NONE      gui=bold
  hi jadeAttributes      guifg=#515151          guibg=NONE      gui=NONE
  hi htmlArg             guifg=#656565          guibg=NONE      gui=bold
  hi htmlTagName         guifg=#898989          guibg=NONE      gui=bold
  hi jadeTag             guifg=#898989          guibg=NONE      gui=bold
  hi javaScriptHtmlElemProperties guifg=#505050 guibg=NONE      gui=NONE
  hi javaScriptFuncArg   guifg=#505050          guibg=NONE      gui=NONE
  hi helpExample         guifg=#303030          guibg=NONE      gui=italic,bold
  hi vimIsCommand        guifg=#424242          guibg=NONE      gui=NONE
  hi vimHiGroup          guifg=#505050          guibg=NONE      gui=bold,italic
  hi vimFgBgAttrib       guifg=#919191          guibg=NONE      gui=NONE
  hi vimHiGuiRgb         guifg=#919191          guibg=NONE      gui=NONE

else 

  hi Normal       guifg=#eaeaea          guibg=#090909   gui=NONE

  hi Cursor       guifg=bg               guibg=#e9e9e9   gui=NONE
  hi CursorIM     guifg=bg               guibg=fg        gui=NONE
  hi lCursor      guifg=bg               guibg=fg        gui=NONE
  hi CursorLine   guifg=NONE             guibg=#0f0f0f   gui=NONE
  hi CursorColumn guifg=NONE             guibg=#0f0f0f   gui=NONE
  hi LineNr       guifg=#010101          guibg=#212121   gui=NONE
  hi CursorLineNr guifg=#777777          guibg=#1b1b1b   gui=NONE

  hi Function     guifg=#eaeaea          guibg=NONE      gui=bold
  hi String       guifg=#777777          guibg=NONE      gui=italic
  hi Type         guifg=#cccccc          guibg=NONE      gui=bold
  hi Statement    guifg=#888888          guibg=NONE      gui=bold
  hi Conditional  guifg=#eaeaea          guibg=NONE      gui=bold
  hi Todo         guifg=#e5e5e5          guibg=#323232   gui=bold
  hi Comment      guifg=#333333          guibg=NONE      gui=bold
  hi Special      guifg=#a0a0a0          guibg=NONE      gui=bold
  hi Identifier   guifg=#dddddd          guibg=NONE      gui=NONE
  hi Keyword      guifg=#eaeaea          guibg=NONE      gui=bold
  hi Label        guifg=#999999          guibg=NONE      gui=underline,bold
  hi Boolean      guifg=#616060          guibg=NONE      gui=bold
  hi PreProc      guifg=#6b6b6b          guibg=NONE      gui=bold
  hi Include      guifg=#565656          guibg=NONE      gui=bold
  hi Constant     guifg=#888888          guibg=NONE      gui=bold
  hi Delimiter    guifg=#eaeaea          guibg=NONE      gui=NONE

  hi Directory    guifg=#929292          guibg=bg        gui=NONE
  hi ErrorMsg     guifg=#6f6f6f          guibg=NONE      gui=NONE
  hi FoldColumn   guifg=#555555          guibg=#414141   gui=bold
  hi Folded       guifg=#020202          guibg=#212121   gui=italic
  hi IncSearch    guifg=#000000          guibg=#aaaaaa   gui=NONE
  hi Search       guifg=#000000          guibg=#aaaaaa   gui=NONE
  hi MatchParen   guifg=#000000          guibg=#aaaaaa   gui=bold
  hi ModeMsg      guifg=#ffffff          guibg=#767676   gui=bold
  hi MoreMsg      guifg=#7c7c7c          guibg=bg        gui=bold
  hi NonText      guifg=#7e7e7e          guibg=bg        gui=bold
  hi Question     guifg=#454545          guibg=bg        gui=bold
  hi SignColumn   guifg=#ffffff          guibg=#696969   gui=NONE
  hi SpecialKey   guifg=#ffffff          guibg=#696969   gui=NONE

  hi Visual       guifg=#ffffff          guibg=#515151   gui=NONE
  hi VisualNOS    guifg=#cccccc          guibg=#515151   gui=none

  hi Title        guifg=#777777          guibg=NONE      gui=bold
  hi VertSplit    guifg=bg               guibg=bg

  hi Pmenu        guifg=#656565          guibg=#3f3f3f   gui=NONE
  hi PmenuSel     guifg=#000000          guibg=#a9a9aa   gui=bold
  hi PmenuSbar    guifg=fg               guibg=#5d5d5d   gui=NONE
  hi PmenuThumb   guifg=fg               guibg=#777777   gui=NONE
  hi WildMenu     guifg=#000000          guibg=#828282   gui=NONE

  hi DiffAdd      guifg=NONE             guibg=#000000   gui=NONE
  hi DiffChange   guifg=fg               guibg=#252525   gui=NONE
  hi DiffDelete   guifg=NONE             guibg=#000      gui=NONE
  hi DiffText     guifg=NONE             guibg=#444444   gui=NONE

  hi StatusLine   guifg=#000000          guibg=#727272   gui=bold
  hi StatusLineNC guifg=#5a5959          guibg=#222222   gui=italic

  hi TabLine      guifg=#999999          guibg=#212121   gui=NONE
  hi TabLineFill  guifg=#010101          guibg=#212121   gui=NONE
  hi TabLineSel   guifg=#999999          guibg=bg        gui=bold

  hi SpellBad     guisp=#ffffff          guibg=#000000   gui=undercurl    guisp=#ffffff
  hi SpellCap     guisp=#5d5d5d                          gui=undercurl
  hi SpellLocal   guisp=#434343                          gui=undercurl
  hi SpellRare    guisp=#7d7d7d                          gui=undercurl

  hi WarningMsg   guifg=#cfcfcf          guibg=#5b5b5b   gui=NONE
  hi Ignore       guifg=bg               guibg=NONE      gui=NONE
  hi Error        guifg=#ffffff          guibg=NONE      gui=undercurl guisp=#ffffff
  hi VimError     guifg=#b6b6b6          guibg=#313131   gui=bold
  hi VimCommentTitle  guifg=#5c5c5c      guibg=bg        gui=bold,italic

  "hi cssBraces        guifg=fg            guibg=bg              gui=NONE
  "hi javaScript       guifg=fg            guibg=NONE
  "hi lsRegex          guifg=#888   guibg=NONE   gui=underline
endif
