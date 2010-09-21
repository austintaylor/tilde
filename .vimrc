
" =============
"     Setup
" =============

set nocompatible
call pathogen#runtime_append_all_bundles()
filetype plugin indent on
let mapleader = ","


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
set undofile

" No bells
set noerrorbells
set novisualbell
set t_vb=

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

" Vim Directory
set undodir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp


" ============
"   Autocmd
" ============

" Auto-save
au FocusLost * :wa

" recognize Capfile, Gemfile
autocmd BufRead,BufNewFile Capfile set filetype=ruby
autocmd BufRead,BufNewFile Gemfile set filetype=ruby

" Strip trailing whitespace
" (disabled because it was interfering with tab behavior)
"autocmd BufWritePre * :%s/\s\+$//e


" ============
"   Mappings
" ============

" Fundamentals
nnoremap j gj
nnoremap k gk
nnoremap ; :
nnoremap <tab> %
vnoremap <tab> %
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

" Reselect pasted text
nnoremap <leader>v V`]

" Sudo to write
cmap w!! w !sudo tee % >/dev/null

" TM inspired keys
imap <C-L> <space>=><space>
imap <D-Return> <ESC>o

" Symbols and strings
nmap <leader>: ds'ds"i:<Esc>e
nmap <leader>" ebhxcsw"
nmap <leader>' ebhxcsw'

" Extract local variable
" Instructions:
"   - Select the expression you want to extract.
"   - ,l
"   - Type the name you want to give it.
"   - <ESC>,v
" Example: vi(,lvariable<ESC>,v
vmap <leader>l "vc
nmap <leader>v viw"ny<ESC>On = v<ESC>

" object && object.method
" Note: Cursor should be on the dot between object and method
map <leader>& mayB`ai<space>&&<space><esc>pl

" Markdown headings
nnoremap <leader>1 yypVr=

map <D-r> :!ruby %<CR>


" =============
"    Support
" =============

function! Camelize(name)
  return substitute(a:name, '\v%(^(.)|_(.))', '\u\1\u\2', 'g')
endfunctio

function! ModelName()
  return substitute(Filename('', 'model'), 's_controller', '', '')
endfunction

function! CamelModelName()
  return Camelize(ModelName())
endfunction


" ==================
"    Text Objects
" ==================

onoremap <silent>ai :<C-u>call IndTxtObj(0)<CR>
onoremap <silent>ii :<C-u>call IndTxtObj(1)<CR>
vnoremap <silent>ai :<C-u>call IndTxtObj(0)<CR><Esc>gv
vnoremap <silent>ii :<C-u>call IndTxtObj(1)<CR><Esc>gv

function! IndTxtObj(inner)
  if &filetype == 'haml' || &filetype == 'sass' || &filetype == 'python'
    let meaningful_indentation = 1
  else
    let meaningful_indentation = 0
  endif
  let curline = line(".")
  let lastline = line("$")
  let i = indent(line(".")) - &shiftwidth * (v:count1 - 1)
  let i = i < 0 ? 0 : i
  if getline(".") =~ "^\\s*$"
    return
  endif
  let p = line(".") - 1
  let nextblank = getline(p) =~ "^\\s*$"
  while p > 0 && (nextblank || indent(p) >= i )
    -
    let p = line(".") - 1
    let nextblank = getline(p) =~ "^\\s*$"
  endwhile
  if (!a:inner)
    -
  endif
  normal! 0V
  call cursor(curline, 0)
  let p = line(".") + 1
  let nextblank = getline(p) =~ "^\\s*$"
  while p <= lastline && (nextblank || indent(p) >= i )
    +
    let p = line(".") + 1
    let nextblank = getline(p) =~ "^\\s*$"
  endwhile
  if (!a:inner && !meaningful_indentation)
    +
  endif
  normal! $
endfunction

