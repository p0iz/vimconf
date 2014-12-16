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
set smartcase
set shiftwidth=2
set guioptions-=m
set guioptions-=r
set guioptions-=l
set guioptions-=T
set guioptions-=L

set number
set mouse=a
set expandtab
set updatetime=1000
set incsearch
set hidden
set wildmenu
set wildmode=longest:full
set scrolloff=10
set cscopequickfix=s-,c-,d-,i-,t-,e-,g-
set confirm

" Backup, swap and undo dirs
set backup
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" Custom statusline
set laststatus=2
set statusline=%1*%t\ %r%h%w%y%q\ [col:%c\ line:%l/%L\ %0P]\ \ \
\ %(%m\%m\%m\%)%=[ASCII:\ %02B][%{strftime(\"%H:%M:%S\")}]%{SyntasticStatuslineFlag()}%*

filetype plugin on
syntax on

colorscheme strange

" Highlight extra whitespace at the end of a line
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd Syntax * syn match ExtraWhitespace /\s\+$/

highlight MixedIndentation ctermbg=darkgreen guibg=lightgreen
autocmd Syntax * syn match MixedIndentation /^\t\+ \s*\|^ \+\t\s*/

" Highlight current line in active buffer
augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END

" Make space leader
let mapleader = " "

" Add a CScope connection at the current dir
function! GetCscope()
  silent !cscope -bR&
  redraw!
  silent cscope add .
endfunction
nnoremap <F10> :call GetCscope()<CR>

" Make shift-insert work like in Xterm
noremap <S-Insert> <MiddleMouse>
noremap! <S-Insert> <MiddleMouse>

" Open quickfix window
nnoremap <leader>q :copen 20<CR>

" Open location list
nnoremap <leader>l :lopen 20<CR>

" Save 
nnoremap <leader>s :w<CR>

" Start a bash shell in ConqueTerm
nnoremap <leader>c :ConqueTerm bash<CR>

" Leader commands for cscope

" Find symbol
nnoremap <leader>fs :cscope find s <cword><CR><C-o>:copen 20<CR>
" Find definition 
nnoremap <leader>fg :cscope find g <cword><CR>

" Resizing stuff
nnoremap <C-Left> :vertical res -1<CR>
nnoremap <C-Up> :res -1<CR>
nnoremap <C-Right> :vertical res +1<CR>
nnoremap <C-Down> :res +1<CR>

" Jump to start/end of line
noremap <C-h> ^
noremap <C-l> $

" Tab management
nnoremap <S-t> :tabnew<Enter>
nnoremap <S-Left> :tabprevious<Enter>
nnoremap <S-h> :tabprevious<Enter>
nnoremap <S-Right> :tabnext<Enter>
nnoremap <S-l> :tabnext<Enter>

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
let g:tagbar_left = 1
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1
nnoremap <F3> :TagbarToggle<Enter>

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_cpp_compiler_options = '-std=c++11'
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
" Next add some common include dirs for Syntastic to search
let g:syntastic_cpp_include_dirs = ['/usr/include/qt5', '/usr/include/qt5/QtConcurrent', '/usr/include/qt5/QtCore', '/usr/include/qt5/QtDBus', '/usr/include/qt5/QtGui', '/usr/include/qt5/QtNetwork', '/usr/include/qt5/QtOpenGL', '/usr/include/qt5/QtOpenGLExtensions', '/usr/include/qt5/QtPlatformSupport', '/usr/include/qt5/QtPrintSupport', '/usr/include/qt5/QtQml', '/usr/include/qt5/QtQuick', '/usr/include/qt5/QtQuickParticles', '/usr/include/qt5/QtQuickTest', '/usr/include/qt5/QtSql', '/usr/include/qt5/QtTest', '/usr/include/qt5/QtWidgets', '/usr/include/qt5/QtXml', '../include', 'include']

" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase for neocomplete.
let g:neocomplete#enable_smart_case = 1
" Enable auto-select for neocomplete
let g:neocomplete#enable_auto_select = 1

" Switch declaration/header
noremap <silent> <leader>h <ESC>:A<CR>
noremap <silent> <F4> <ESC>:A<CR>

" Reselect visual selection after reindent
vnoremap < <gv
vnoremap > >gv

" Disable all vim2hs UTF-8 conceals
let g:haskell_conceal = 0

