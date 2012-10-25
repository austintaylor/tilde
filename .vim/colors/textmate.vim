set background=light
hi clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name="textmate"

hi hamlDocType guifg=#888888
hi def link hamlRubyChar NONE

hi hamlClassChar gui=bold guifg=Black
hi def link hamlClass hamlClassChar
hi def link hamlIdChar hamlClassChar
hi def link hamlId hamlClassChar

hi hamlTag gui=bold guifg=Blue
hi def link htmlTagName hamlTag
hi def link htmlSpecialTagName hamlTag

hi String guifg=#036A07
hi Constant gui=bold guifg=#C5060B
hi Statement gui=bold guifg=Blue
