" No Vi Compatibility
set nocompatible

" Load bundles
call pathogen#runtime_append_all_bundles()

" Load plugins for filetypes
filetype plugin on

" For custom mappings
let mapleader = ","

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


