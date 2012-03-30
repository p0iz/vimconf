set nocompatible

call pathogen#infect()
call pathogen#helptags()

" set the X11 font to use
set guifont=Inconsolata\ 10
set mousehide		" Hide the mouse when typing text
set autoindent
set autochdir
set tabstop=4
set smartindent
set shiftwidth=4
set guioptions-=T
set guioptions-=m
set number

set hlsearch
set incsearch

colorscheme molokai

filetype plugin on
syntax on

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" Tab management
nmap <S-t> :tabnew<Enter>
nmap <S-Left> :tabprevious<Enter>
nmap <S-h> :tabprevious<Enter>
nmap <S-Right> :tabnext<Enter>
nmap <S-l> :tabnext<Enter>
nmap <S-w> :quit<Enter>

" Close folds (right arrorw to open
nmap <C-S-f> :foldclose<Enter>

" Bindings for unimpaired text movement
nmap <C-Up> [e
nmap <C-k> [e
nmap <C-Down> ]e
nmap <C-j> ]e
vmap <C-Up> [egv
vmap <C-k> [egv
vmap <C-Down> ]egv
vmap <C-j> ]egv

" Python stuff
nmap <F2> byw:Pydoc <C-r>0<Enter>
nmap <F5> :!python %<Enter>

" Taglist
nmap <F3> :TlistToggle<Enter>
let Tlist_Exit_OnlyWindow = 1
let Tlist_GainFocus_On_ToggleOpen = 1

