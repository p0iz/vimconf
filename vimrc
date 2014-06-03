" My superb vim configuration
set nocompatible

call pathogen#infect()
call pathogen#helptags()

" set the X11 font to use
set cmdheight=2
set guifont=Inconsolata\ 10
set mousehide		" Hide the mouse when typing text
set autoindent
set autoread
set tabstop=2
set expandtab
set smartindent
set smarttab
set shiftwidth=2
set guioptions-=T
set guioptions-=m
set number
set mouse=a
set expandtab

set incsearch

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

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" Open quickfix window
map <leader>q :copen 20<CR>

" Save 
map <leader>s :w<CR>

" Start a shell and return immediately after it
map <leader>c :silent !$SHELL<CR><CR>:silent redraw!<CR>

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

" Buffer switching
nmap <C-b> :bp<Enter>
nmap <C-n> :bn<Enter>

" Replace all occurrences
nmap <F8> :execute ':%s/' . expand('<cword>') . '/' . input('Replace with: ') . '/g'<CR>

" Add the current file's directory to the path if not already present.
autocmd BufRead *
      \ let s:tempPath=escape(escape(expand("%:p:h"), ' '), '\ ') |
      \ exec "set path+=".s:tempPath

autocmd BufRead,BufNewFile *.vs,*.fs set filetype=glsl

nmap <C-b> :bp<Enter>
nmap <C-n> :bn<Enter>

" Close folds (right arrorw to open
nmap <C-S-f> :foldclose<Enter>

" Cursor movement test
function! DeleteNextWord()
    let save_cursor = getpos(".")
    normal wdw
    call setpos(".", save_cursor)
endfunction

" Python stuff
autocmd FileType python nmap <F2> byw:Pydoc <C-r>0<Enter>
autocmd FileType python nmap <F5> :!python %<Enter>

" Tagbar 
let g:Tlist_Exit_OnlyWindow = 1
nmap <F3> :TlistToggle<Enter>

" Clang_complete global config
let g:clang_auto_select=1 "Select top-most
let g:clang_complete_auto=0 "Do not open menu automatically
let g:clang_library_path='/usr/lib/llvm-3.4/lib/'

" Set supertab default to omni complete
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

" Enable auto-save
let g:auto_save=0

" Popup menu colors
highlight Pmenu ctermfg=0 ctermbg=3 guibg=grey30
highlight PmenuSel ctermfg=3 ctermbg=0 guibg=white
highlight PmenuSbar ctermfg=3 ctermbg=0 guibg=black
highlight PmenuThumb ctermfg=0 ctermbg=3 guibg=white
