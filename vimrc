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
nmap <C-s> :write<Enter>

" Tab management
nmap <C-S-t> :tabnew<Enter>
nmap <C-S-w> :quit<Enter>
nmap <C-S-h> :tabprevious<Enter>
nmap <C-S-l> :tabnext<Enter>

" Close folds (right arrorw to open
nmap <C-f> :foldclose<Enter>

