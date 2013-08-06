
" ------------------------------------------------------------
"  Setup
" ------------------------------------------------------------

set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'Townk/vim-autoclose'
Bundle 'austintaylor/vim-commaobject'
Bundle 'austintaylor/vim-indentobject'
Bundle 'austintaylor/vim-objectcompletion'
Bundle 'b4winckler/vim-objc'
Bundle 'digitaltoad/vim-jade'
Bundle 'kana/vim-fakeclip'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
Bundle 'msanders/snipmate.vim'
Bundle 'nacitar/a.vim'
Bundle 'qqshfox/objc_matchbracket'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'zhaocai/cocoa.vim'
Bundle 'epeli/slimux'
Bundle 'oscarh/vimerl'
Bundle 'rizzatti/funcoo.vim'
Bundle 'rizzatti/dash.vim'

filetype plugin indent on

" ------------------------------------------------------------
"  Settings
" ------------------------------------------------------------

let mapleader = ","
let g:project_dir = "~/Workspace"
let g:objc#man#dash_keyword = "ios:"
let g:ctrlp_cmd = 'CtrlPMRUFiles'
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_enable_signs=1
let g:dash_map = {
    \ 'ruby'       : '_rails',
    \ 'javascript' : '_js',
    \ 'scss'       : '_css',
    \ 'eruby'      : '_html'
    \ }

syntax on
colorscheme jellybeans
hi markdownCode guifg=#a0a9bf
hi markdownCodeBlock guifg=#a0a9bf

set encoding=utf-8
set nowrap
" set cursorline
set nocursorline " this is too laggy in terminal mode
set wildmenu
set wildmode=list:longest
set number
set history=1000
set scrolloff=3
set ttyfast
set autoread
set ttimeout
set ttimeoutlen=100
set backspace=2

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

set sessionoptions=blank,curdir,folds,help,tabpages,winsize

" Search behavior
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap / /\V
vnoremap / /\V
map <leader><space> :let @/=''<cr>

" Persistent undo
if v:version >= 703
  set undofile
  set undodir=~/.vim/tmp
endif

" .vim-tmp
set backupdir=~/.vim/tmp
set directory=~/.vim/tmp

" matchparen is slow in the terminal
let loaded_matchparen = 1


" ------------------------------------------------------------
"  Autocmd
" ------------------------------------------------------------

augroup vimrc
  autocmd!

  au BufRead,BufNewFile Capfile      set filetype=ruby
  au BufRead,BufNewFile Gemfile      set filetype=ruby
  au BufRead,BufNewFile Guardfile    set filetype=ruby
  au BufRead,BufNewFile *.prawn      set filetype=ruby
  au BufRead,BufNewFile config.ru    set filetype=ruby
  au BufRead,BufNewFile *.handlebars set filetype=html
  au BufRead,BufNewFile *.json       set filetype=javascript
  au BufRead,BufNewFile *.js.erb     set filetype=javascript

  " Auto-reload
  au BufWritePost .vimrc source %

  " Strip trailing whitespace
  " (disabled because it was interfering with tab behavior)
  "au BufWritePre * :%s/\s\+$//e
augroup END

" Reload things
set autoread updatetime=2000
augroup checktime
    autocmd!
    if !has("gui_running")
        autocmd BufEnter        * silent! checktime
        autocmd CursorHold      * silent! checktime
        autocmd CursorHoldI     * silent! checktime
    endif
augroup END

" ------------------------------------------------------------
"  Mappings
" ------------------------------------------------------------

" Fundamentals
nnoremap j gj
nnoremap k gk
nnoremap Y y$
nnoremap Q gqip
imap <C-D> <DEL>
imap <C-F> <RIGHT>
imap <C-B> <LEFT>
vnoremap p "0p
noremap H ^
noremap L g_
nnoremap \ ,

" Open my private todo file
nmap <leader>t :sp .todo<CR>
nmap <leader><leader>t :sp ~/Dropbox/todos/global.todo<CR>

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
map <leader>e :e =system("pbpaste \| awk -F: '{print $1 \"\|\" $2}'")<CR><CR>

" Ack
nnoremap <leader>a :Ack<space>
vnoremap <leader>a "ry:Ack<space>"r"

" Reselect pasted text
nnoremap <leader>p `[v`]

" TM inspired keys
imap <C-L> <space>=><space>

" uppercase
imap <c-u> <esc>viwUgv<esc>a

" Symbols and strings
nmap <leader>: ds'ds"i:<Esc>e
nmap <leader>" ebhxcsw"
nmap <leader>' ebhxcsw'

" Extract local variable
nmap <leader>xl O. = "<ESC>

" Extract method (only works with character-wise selections, at the moment)
nmap <leader>xm ?def<CR>jvii<ESC>jo<CR>def .<CR>"<ESC>

" object && object.method
" Note: Cursor should be on the dot between object and method
map <leader>& mayB`ai<space>&&<space><esc>pl

" Add semicolon
nmap <leader>; ma:s/;\?$/;/\|let @/=''<CR>`a

nnoremap zp :put *<cr>`[v`]=

" I do this all the time.
command! Q :q
command! W :w
" command! X :x

" Dash
nmap <silent> K <Plug>DashSearch

" Find & Replace
nnoremap <leader>r :%s//
vnoremap <leader>r "ry:%s/r/
vnoremap <leader>f "fy:/f

" Sections
nmap <leader>- o<esc>60i-<esc>\\\yyppkwC<space>

" Format XML
vmap <leader>x :!sed -e 's/ *//' \| xmllint --format -<CR>

" Open
nmap <leader>o "oyiW:!open o<cr><cr>

" ------------------------------------------------------------
"  obj-c stuff
" ------------------------------------------------------------

" Upgrade a local var to a property
nmap <leader><leader>p vf*e"aymacf*self.:w,A/\@inter$%Oa;/\@prop}O@property (nonatomic, retain) a;h"byiw:w,Agg/\@syn}O@synthesize b;/super deallocOself.b = nil;:w`a

" Declare a method in the header
nmap <leader><leader>m 0vt{ge"ayma,A/prop}oa;:w,A`a

function! OpenLine()
  let l:repo = substitute(system("cat .git/config | awk 'BEGIN { FS = /\s+/ }; /url =/ {print $3; exit}'"), '.git\n$', '', '')
  let l:branch = substitute(system("git branch | awk '{print $2}'"), '\n$', '', '')
  let l:file = expand('%')
  let l:line = line('.')
  let l:url = l:repo."/blob/".l:branch."/".l:file."#L".l:line
  call system('open "'.l:url.'"')
endfunction

function! s:Creators(args)
  redraw
  echo "Searching..."
  let g:creatorsformat="%f"
  let g:creatorsprg="./find_creators.sh ".a:args
  let grepprg_bak=&grepprg
  let grepformat_bak=&grepformat
  try
    let &grepprg=g:creatorsprg
    let &grepformat=g:creatorsformat
    silent execute 'grep'
  finally
    let &grepprg=grepprg_bak
    let &grepformat=grepformat_bak
  endtry
  botright copen
  redraw!
endfunction

command! -nargs=1 Creators call s:Creators(<q-args>)


" ------------------------------------------------------------
"  Snippet Support
" ------------------------------------------------------------

function! Camelize(name)
  return substitute(a:name, '\v%(^(.)|_(.))', '\u\1\u\2', 'g')
endfunctio

function! ModelName()
  return substitute(Filename('', 'model'), 's_controller', '', '')
endfunction

function! CamelModelName()
  return Camelize(ModelName())
endfunction


" ------------------------------------------------------------
"  Tab Label
" ------------------------------------------------------------

function! TabLabel()
  if exists("t:directory")
    return t:directory
  else
    return ""
  endif
endfunction

" ------------------------------------------------------------
"  Rails Customization
" ------------------------------------------------------------

autocmd User Rails Rnavcommand factory        spec/factories            -glob=* -suffix=_factories.rb
autocmd User Rails Rnavcommand feature        features                  -glob=* -suffix=.feature
autocmd User Rails Rnavcommand stepdefinition features/step_definitions -glob=* -suffix=_steps.rb

