
" Make Save leave edit mode
macmenu File.Save  key=<nop>
map <D-s> :w<CR>
imap <D-s> <ESC>:w<CR>

" GUI settings
set guioptions+=TlRLrb
set guioptions-=TlRLrb

" Fullscreen should use the whole screen
set fuoptions=maxvert,maxhorz

" Color scheme
colorscheme jellybeans

hi markdownCode guifg=#a0a9bf
hi markdownCodeBlock guifg=#a0a9bf

