if has('mac')
  " Make Save leave edit mode
  macmenu File.Save  key=<nop>
  map <D-s> :w<CR>
  imap <D-s> <ESC>:w<CR>
endif

" GUI settings
set guioptions+=TlRLrb
set guioptions-=TlRLrb

" Fullscreen should use the whole screen
set fuoptions=maxvert,maxhorz
