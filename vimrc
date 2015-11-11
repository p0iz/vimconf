" My superb vim configuration
set nocompatible

call pathogen#infect()
call pathogen#helptags()

" set the GUI font to use
if has("gui_gtk2")
  set guifont=FantasqueSansMono\ 12
elseif has("gui_win32")
  set guifont=Fantasque_Sans_Mono:h12:cANSI
endif

set backspace=indent,eol,start
set cmdheight=1
set mousehide		" Hide the mouse when typing text
set autoindent
set autoread
set tabstop=2
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
set wildmode=full
set scrolloff=20
set cscopequickfix=s-,c-,d-,i-,t-,e-,g-
set confirm

" Set a better title
autocmd BufEnter * let &titlestring = $USER . "@" . hostname() . ' [' . expand("%:t") . "]"
set title

" Backup, swap and undo
set nobackup
set noswapfile
set undodir=~/.vim/undo//

" Custom statusline
set laststatus=2
set statusline=%1*%t\ %r%h%w%y%q\ [col:%c\ line:%l/%L\ %0P]\ \ \
\ %(%m\%m\%m\%)%=[ASCII:\ %02B][%{strftime(\"%H:%M:%S\")}]%{SyntasticStatuslineFlag()}%*

filetype plugin on
syntax on

set t_Co=256
set background=dark
colorscheme gruvbox
set fillchars+=vert:\ 

" Normal mode in current buffer shows relative line numbers
set relativenumber
autocmd FocusLost * set norelativenumber
autocmd FocusGained * set relativenumber
autocmd BufEnter * set relativenumber
autocmd BufLeave * set norelativenumber
autocmd InsertEnter * set norelativenumber
autocmd InsertLeave * set relativenumber

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

" Make shift-insert work like in Xterm
noremap <S-Insert> <MiddleMouse>
noremap! <S-Insert> <MiddleMouse>

" Open quickfix window
nnoremap <leader>q :copen 20<CR>

" Open location list
nnoremap <leader>l :lopen 20<CR>

" Save 
nnoremap <leader>s :w<CR>

" Toggle Limelight
nnoremap <leader>L :Limelight!! 0.7<CR>

" GoYo (with 120 char lines)
nnoremap <leader>gy :Goyo 120<CR>

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

" Jump to the tag matching the text under the cursor
nnoremap gt :execute ':tj ' . expand('<cword>')<CR>

" Add the current file's directory to the path if not already present.
autocmd BufRead *
      \ let s:tempPath=escape(escape(expand("%:p:h"), ' '), '\ ') |
      \ exec "set path+=".s:tempPath

autocmd BufRead,BufNewFile *.vs,*.fs set filetype=glsl

" Tagbar 
let g:tagbar_left = 1
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1
let g:tagbar_autoclose = 1
nnoremap <F3> :TagbarToggle<Enter>
nnoremap <leader>gb :TagbarToggle<Enter>

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_cpp_compiler_options = '-std=c++11'
" Next add some common include dirs for Syntastic to search
let g:syntastic_cpp_include_dirs = ['/usr/include/qt5', '/usr/include/qt5/QtConcurrent', '/usr/include/qt5/QtCore', '/usr/include/qt5/QtDBus', '/usr/include/qt5/QtGui', '/usr/include/qt5/QtNetwork', '/usr/include/qt5/QtOpenGL', '/usr/include/qt5/QtOpenGLExtensions', '/usr/include/qt5/QtPlatformSupport', '/usr/include/qt5/QtPrintSupport', '/usr/include/qt5/QtQml', '/usr/include/qt5/QtQuick', '/usr/include/qt5/QtQuickParticles', '/usr/include/qt5/QtQuickTest', '/usr/include/qt5/QtSql', '/usr/include/qt5/QtTest', '/usr/include/qt5/QtWidgets', '/usr/include/qt5/QtXml', '../include', 'include']

" Switch declaration/header
noremap <silent> <leader>h <ESC>:A<CR>
noremap <silent> <F4> <ESC>:A<CR>

" Reselect visual selection after reindent
vnoremap < <gv
vnoremap > >gv

" Disable all vim2hs UTF-8 conceals
let g:haskell_conceal = 0

" Tab completion for popup menu
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Flake8
let g:flake8_show_in_gutter = 1
autocmd BufWritePost ft=python call Flake8()

" Do not traverse SCM with command-t
let g:CommandTTraverseSCM = 'pwd'

