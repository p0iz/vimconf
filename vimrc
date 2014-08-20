" My superb vim configuration
set nocompatible

call pathogen#infect()
call pathogen#helptags()

" set the X11 font to use
set cmdheight=1
set guifont=Inconsolata\ 10
set mousehide		" Hide the mouse when typing text
set autoindent
set autoread
set tabstop=4
set expandtab
set smartindent
set smarttab
set shiftwidth=2
set guioptions-=T
set guioptions-=m
set number
set mouse=a
set expandtab
set updatetime=1000
set incsearch
set hidden
set wildmenu
set scrolloff=3
set cscopequickfix=s-,c-,d-,i-,t-,e-,g-

" Ensure 16 colors
if !has('gui_running')
  set t_Co=16
endif

" Custom statusline
set laststatus=2
set statusline=%1*%t\ %r%h%w%y%q\ \ [%c,%l/%L\ %0P]\ \ \
\ %(%m\%m\%m\%)\ ░▒▓%2*%=[ASCII:\ %02B]\ %{SyntasticStatuslineFlag()}%*

colorscheme molokai

filetype plugin on
syntax on

" Highlight extra whitespace at the end of a line
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd Syntax * syn match ExtraWhitespace /\s\+$/

highlight MixedIndentation ctermbg=darkgreen guibg=lightgreen
autocmd Syntax * syn match MixedIndentation /^\t\+ \s*\|^ \+\t\s*/

" Make space leader
let mapleader = " "

" Add a CScope connection at the current dir
function! GetCscope()
  silent !cscope -bR
  redraw!
  silent cscope add .
endfunction
noremap <leader>g :call GetCscope()<CR>

" Make shift-insert work like in Xterm
noremap <S-Insert> <MiddleMouse>
noremap! <S-Insert> <MiddleMouse>

" Open quickfix window
noremap <leader>q :copen 20<CR>

" Save 
noremap <leader>s :w<CR>

" Start a shell and return immediately after it
noremap <leader>c :sh<CR>

" Leader commands for cscope

" Find symbol
nnoremap <leader>fs :cscope find s <cword><CR><C-t>:copen 20<CR>

nnoremap <C-Left> :vertical res -1<CR>
nnoremap <C-Up> :res -1<CR>
nnoremap <C-Right> :vertical res +1<CR>
nnoremap <C-Down> :res +1<CR>

" Tab management
nnoremap <S-t> :tabnew<Enter>
nnoremap <S-Left> :tabprevious<Enter>
nnoremap <S-h> :tabprevious<Enter>
nnoremap <S-Right> :tabnext<Enter>
nnoremap <S-l> :tabnext<Enter>

" Buffer switching
nnoremap <C-b> :bp<Enter>
nnoremap <C-n> :bn<Enter>

" Replace all occurrences
nnoremap <F8> :execute ':%s/' . expand('<cword>') . '/' . input('Replace with: ') . '/g'<CR>

" Add the current file's directory to the path if not already present.
autocmd BufRead *
      \ let s:tempPath=escape(escape(expand("%:p:h"), ' '), '\ ') |
      \ exec "set path+=".s:tempPath

autocmd BufRead,BufNewFile *.vs,*.fs set filetype=glsl

" Cursor movement test
function! DeleteNextWord()
    let save_cursor = getpos(".")
    normal wdw
    call setpos(".", save_cursor)
endfunction

" Python stuff
autocmd FileType python nnoremap <F2> byw:Pydoc <C-r>0<Enter>
autocmd FileType python nnoremap <F5> :!python %<Enter>

" Tagbar 
let g:Tlist_Exit_OnlyWindow = 1
nnoremap <F3> :TlistToggle<Enter>

" Syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_auto_refresh_includes = 1
let g:syntastic_cpp_compiler_options = '-fPIE -std=c++11'

" Next add some common include dirs for Syntastic to search
let g:syntastic_cpp_include_dirs = ['/usr/include/qt5', '/usr/include/qt5/QtConcurrent', '/usr/include/qt5/QtCore', '/usr/include/qt5/QtDBus', '/usr/include/qt5/QtGui', '/usr/include/qt5/QtNetwork', '/usr/include/qt5/QtOpenGL', '/usr/include/qt5/QtOpenGLExtensions', '/usr/include/qt5/QtPlatformSupport', '/usr/include/qt5/QtPrintSupport', '/usr/include/qt5/QtQml', '/usr/include/qt5/QtQuick', '/usr/include/qt5/QtQuickParticles', '/usr/include/qt5/QtQuickTest', '/usr/include/qt5/QtSql', '/usr/include/qt5/QtTest', '/usr/include/qt5/QtWidgets', '/usr/include/qt5/QtXml', '../include', 'include']

" Enable auto-save
let g:auto_save=0

" Switch declaration/header
noremap <silent> <leader>h <ESC>:A<CR>
noremap <silent> <F4> <ESC>:A<CR>

" Popup menu colors
highlight Pmenu ctermfg=darkgreen ctermbg=darkgray guibg=grey30
highlight PmenuSel ctermfg=black ctermbg=green guibg=white
highlight PmenuSbar ctermfg=0 ctermbg=darkgray guibg=black
highlight PmenuThumb ctermfg=0 ctermbg=green guibg=white

highlight User1 ctermfg=white ctermbg=black
highlight User2 ctermfg=black ctermbg=white

