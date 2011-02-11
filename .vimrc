
" =============
"     Setup
" =============

set nocompatible
call pathogen#runtime_append_all_bundles()
filetype plugin indent on
let mapleader = ","
let g:project_dir = "~/Workspace"


" ============
"   Settings
" ============

set encoding=utf-8
set nowrap
set cursorline
set wildmenu
set wildmode=list:longest
set number
set history=1000
set scrolloff=3
set ttyfast

" No bells
set visualbell t_vb=

" Indentation
set autoindent
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2

" Split behavior
set splitbelow
set splitright

" Search behavior
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap / /\v
vnoremap / /\v
map <leader><space> :let @/=''<cr>

" Persistent undo
if v:version >= 703
  set undofile
  set undodir=~/.vim/tmp
endif

" .vim-tmp
set backupdir=~/.vim/tmp
set directory=~/.vim/tmp


" ============
"   Autocmd
" ============

augroup vimrc
  " Clear autocmd
  autocmd!

  " Auto-save
  " Can't have this always trying to save unnamed buffers
  "au FocusLost * :wa

  " Recognize Capfile, Gemfile
  au BufRead,BufNewFile Capfile set filetype=ruby
  au BufRead,BufNewFile Gemfile set filetype=ruby

  " Auto-reload
  au BufWritePost .vimrc source %
  au BufWritePost .gvimrc source %

  " Don't want cursor line highlighting in quickfix
  au QuickFixCmdPost * set nocursorline

  " Strip trailing whitespace
  " (disabled because it was interfering with tab behavior)
  "au BufWritePre * :%s/\s\+$//e
augroup END


" ============
"   Mappings
" ============

" Fundamentals
nnoremap j gj
nnoremap k gk
nnoremap Y y$
nnoremap Q gqip
imap <C-D> <DEL>

" Scroll left/right
nmap <C-h> zH
nmap <C-l> zL

" Make C-w o (only window) reversible by opening a tab
nnoremap <C-W>O :tabnew %<CR>
nnoremap <C-W>o :tabnew %<CR>
nnoremap <C-W><C-O> :tabnew %<CR>

" Tree commands
map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>
map <leader>R :NERDTreeFind<CR>

" Ack
nnoremap <leader>a :Ack<space>
vnoremap <leader>a "ry:Ack<space>"r"

" Reselect pasted text
nnoremap <leader>p V`]

" TM inspired keys
imap <C-L> <space>=><space>
imap <D-Return> <ESC>o

" Symbols and strings
nmap <leader>: ds'ds"i:<Esc>e
nmap <leader>" ebhxcsw"
nmap <leader>' ebhxcsw'

" Color Picker
nmap <leader>c :ChooseColor<CR>

" Extract local variable
" Instructions:
"   - Select the expression you want to extract.
"   - ,l
"   - Type the name you want to give it.
"   - <ESC>,v
" Example: vi(,lvariable<ESC>,v
vmap <leader>l "vc
nmap <leader>v viw"nyOn = v<ESC>

" object && object.method
" Note: Cursor should be on the dot between object and method
map <leader>& mayB`ai<space>&&<space><esc>pl

" Poor man's runner. Need some help here.
map <D-r> :!ruby -Itest %<CR>

" I do this all the time.
command! Q :q

" Find & Replace
nnoremap <leader>r :%s//
vnoremap <leader>r "ry:%s/r/
vnoremap <leader>f "fy:/f

" =====================
"    Snippet Support
" =====================

function! Camelize(name)
  return substitute(a:name, '\v%(^(.)|_(.))', '\u\1\u\2', 'g')
endfunctio

function! ModelName()
  return substitute(Filename('', 'model'), 's_controller', '', '')
endfunction

function! CamelModelName()
  return Camelize(ModelName())
endfunction


" ======================
"     Tab Label
" ======================

function! TabLabel()
  if exists("t:directory")
    return t:directory
  else
    return ""
  endif
endfunction
