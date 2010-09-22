
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
  set undodir=~/.vim-tmp
endif

" .vim-tmp
set backupdir=~/.vim-tmp
set directory=~/.vim-tmp


" ============
"   Autocmd
" ============

augroup vimrc
  " Clear autocmd
  autocmd!

  " Auto-save
  au FocusLost * :wa

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
nnoremap ; :
nnoremap Y y$
nnoremap Q gqip
imap <C-D> <DEL>

" Scroll left/right
nmap <C-h> zH
nmap <C-l> zL

" Home/End
nmap H 0
nmap L $

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
nnoremap <leader>p V`]

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

" Poor man's runner. Need some help here.
map <D-r> :!ruby -Itest %<CR>

" I do this all the time.
command! Q :q

" ===================
"    :Open Command
" ===================

command! OpenVimrc :call OpenVimrc()
command! -nargs=1 -complete=dir OpenDir :call OpenDir(<f-args>)
command! -nargs=1 -complete=custom,ProjectComplete Open :call Open(<f-args>)

function! Open(project)
  call OpenDir(g:project_dir . '/' . a:project)
  execute 'normal l'
endfunction

function! OpenDir(path)
  execute 'lcd ' . a:path
  let l:readme = get(split(system("ls README*"), "\n"), 0)
  if filereadable(l:readme)
    execute 'edit ' . l:readme
  else
    new
  endif
  silent only
  execute 'NERDTree ' . a:path
endfunction

function! OpenVimrc()
  call OpenDir("~/.vim")
  execute 'normal I'
  execute 'normal l'
  execute 'edit .vimrc'
endfunction

function! ProjectComplete(prefix, line, position)
  return system("ls " . g:project_dir)
endfunction


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

