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
set wildmode=list:longest

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

" Fullscreen should use the whole screen
set fuoptions=maxvert,maxhorz

" Strip trailing whitespace
"autocmd BufWritePre * :%s/\s\+$//e

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

" Symbols and strings
nmap <leader>: ds"i:<Esc>e
nmap <leader>" bhxcsw"

" Experimenting
nmap <space> i<space><ESC>
nmap <enter> _i<enter><ESC>

" Prev/Next Buffer
nmap <C-n> :bn<CR>
nmap <C-p> :bp<CR>

" Store temporary files in a central spot
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

colorscheme jellybeans

map <D-r> :!ruby %<CR>

function! Camelize(name)
  return substitute(a:name, '\v%(^(.)|_(.))', '\u\1\u\2', 'g')
endfunction

function! ModelName()
  return substitute(Filename('', 'model'), 's_controller', '', '')
endfunction

function! CamelModelName()
  return Camelize(ModelName())
endfunction

nnoremap <C-W>O :tabnew %<CR>
nnoremap <C-W>o :tabnew %<CR>
nnoremap <C-W><C-O> :tabnew %<CR>

" object && object.method
map <leader>& mayB`ai<space>&&<space><esc>pl

" Text object for indented code
onoremap <silent>ai :<C-u>cal IndTxtObj(0)<CR>
onoremap <silent>ii :<C-u>cal IndTxtObj(1)<CR>
vnoremap <silent>ai :<C-u>cal IndTxtObj(0)<CR><Esc>gv
vnoremap <silent>ii :<C-u>cal IndTxtObj(1)<CR><Esc>gv

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

