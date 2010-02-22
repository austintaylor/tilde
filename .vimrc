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

" Basic tab behavior
set autoindent
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2

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
