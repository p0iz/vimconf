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

" Ctrl+S to save
nmap <C-s> :update<Enter>
" Tab management
nmap <S-t> :tabnew<Enter>
nmap <S-h> :tabprevious<Enter>
nmap <S-l> :tabnext<Enter>
nmap <S-w> :quit<Enter>

" Close folds (right arrorw to open
nmap <C-S-f> :foldclose<Enter>

" Bindings for unimpaired text movement
nmap <C-Up> [e
nmap <C-Down> ]e
vmap <C-Up> [egv
vmap <C-Down> ]egv


" Python stuff
nmap <F2> byw:Pydoc <C-r>0<Enter>
nmap <F3> :TlistToggle<Enter>
nmap <F5> :!python %<Enter>
