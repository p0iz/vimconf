" My superb vim configuration
set nocompatible

call pathogen#infect()
call pathogen#helptags()

" set the X11 font to use
set cmdheight=2
set guifont=Inconsolata\ 10
set mousehide		" Hide the mouse when typing text
set autoindent
set autochdir
set tabstop=2
set smartindent
set smarttab
set shiftwidth=2
set guioptions-=T
set guioptions-=m
set number
set expandtab

set hlsearch
set incsearch

colorscheme molokai

filetype plugin on
syntax on

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

nnoremap <C-Left> :vertical res -1<CR>
nnoremap <C-Up> :res -1<CR>
nnoremap <C-Right> :vertical res +1<CR>
nnoremap <C-Down> :res +1<CR>

" Tab management
nmap <S-t> :tabnew<Enter>
nmap <S-Left> :tabprevious<Enter>
nmap <S-h> :tabprevious<Enter>
nmap <S-Right> :tabnext<Enter>
nmap <S-l> :tabnext<Enter>
nmap <S-w> :quit<Enter>

" Bufexplorer
nmap <F4> :BufExplorer<Enter>

" Buffer switching
nmap <C-b> :bp<Enter>
nmap <C-n> :bn<Enter>

" Add the current file's directory to the path if not already present.
autocmd BufRead *
      \ let s:tempPath=escape(escape(expand("%:p:h"), ' '), '\ ') |
      \ exec "set path+=".s:tempPath

autocmd BufRead,BufNewFile *.vs,*.fs set filetype=glsl

" Close folds (right arrorw to open
nmap <C-S-f> :foldclose<Enter>

" Python stuff
autocmd FileType python nmap <F2> byw:Pydoc <C-r>0<Enter>
autocmd FileType python nmap <F5> :!python %<Enter>

" Tagbar toggle
nmap <F3> :TagbarToggle<Enter>

" Open dirlist
nmap <F2> :e .<Enter>

" Clang_complete global config
let g:clang_auto_select=1 "Select top-most
let g:clang_complete_auto=0 "Do not open menu automatically

" Enable auto-save
let g:auto_save=1

" Call make
map <F5> :make

" Popup menu colors
highlight Pmenu ctermfg=0 ctermbg=3 guibg=grey30
highlight PmenuSel ctermfg=3 ctermbg=0 guibg=white
highlight PmenuSbar ctermfg=3 ctermbg=0 guibg=black
highlight PmenuThumb ctermfg=0 ctermbg=3 guibg=white
