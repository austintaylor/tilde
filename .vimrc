" No Vi Compatibility
set nocompatible

" Load bundles
call pathogen#runtime_append_all_bundles()

" Load plugins for filetypes
filetype plugin indent on

" For custom mappings
let mapleader = ","

" Wrapping
set nowrap

" Highlight the line the cursor is on
set cursorline

" Show possible command line completions
set wildmenu

" Line numbers
set number

" Turn off the toolbar, scrollbars
if has("gui_running")
  set guioptions+=TlRLrb
  set guioptions-=TlRLrb
endif

" Longer history (default is 20)
set history=1000

" Basic tab behavior
set autoindent
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2

" Split toward the bottom right
set splitbelow
set splitright

" Strip trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" recognize Capfile, Gemfile
autocmd BufRead,BufNewFile Capfile set filetype=ruby
autocmd BufRead,BufNewFile Gemfile set filetype=ruby

" Reveal current file in tree
map <leader>R :NERDTreeFind<CR>

" Open tree on current directory
map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>

" Because I love this from TM, even though it hardly works
imap <C-L> <space>=><space>

" Because it works everywhere else, and I don't know of a better way to do
" forward delete, and I don't really need un-tab in insert mode.
imap <C-D> <DEL>

imap <D-Return> <ESC>o

" Store temporary files in a central spot
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

colorscheme jellybeans

map <D-r> :call RunRubyFile()<CR>

function! RunRubyFile()
  let old_make = &makeprg
  try
    let &l:makeprg = 'ruby '.expand("%")
    exe 'make'
    cwindow
  finally
    let &l:makeprg = old_make
  endtry
endfunction

function! Camelize(name)
  return substitute(a:name, '\v%(^(.)|_(.))', '\u\1\u\2', 'g')
endfunction

function! ModelName()
  return substitute(Filename('', 'model'), 's_controller', '', '')
endfunction

function! CamelModelName()
  return Camelize(ModelName())
endfunction
