" My superb vim (and neovim) configuration
set nocompatible

call pathogen#infect()
call pathogen#helptags()

" set the GUI font to use
if has("gui_gtk2")
  set guifont=LiberationMono\ 11
elseif has("gui_win32")
  set guifont=Liberation_Mono:h11:cANSI
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
set shortmess=a
set guioptions-=m
set guioptions-=r
set guioptions-=l
set guioptions-=T
set guioptions-=L
set sessionoptions=curdir,help,winpos,resize
set linespace=2

set number
set mouse=a
set updatetime=1000
set incsearch
set hidden
set wildmenu
set wildmode=list:longest
set scrolloff=10
set cscopequickfix=s-,c-,d-,i-,t-,e-,g-
set confirm
set nrformats+=alpha

" Enable syntax folding and initially unfold everything
set foldmethod=syntax
set foldlevel=100

" Disable all bells
set vb t_vb=

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
\ %(%m\%m\%m\%)%=[ASCII:\ %02B][%{strftime(\"%H:%M:%S\")}]

filetype plugin on
syntax on

if !has('nvim')
  set t_Co=256
endif

set background=dark
if has("gui_running")
  colorscheme Base2Tone_EarthDark
else
  colorscheme default
endif

set fillchars=

" Highlight extra whitespace at the end of a line
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd Syntax * syn match ExtraWhitespace /\s\+$/

highlight MixedIndentation ctermbg=darkgreen guibg=lightgreen
autocmd Syntax * syn match MixedIndentation /^\t\+ \s*\|^ \+\t\s*/

" Highlight current line in active buffer
augroup BgHighlight
  autocmd!
  autocmd VimEnter * set cul
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END

" Save the current session when quitting Vim
"
" NOTE: source vimrc after changes, or risk
"       saving old stuff into session file!
"
function! LoadSession()
  if filereadable(expand("~/.vim_last_session"))
    silent! source ~/.vim_last_session
    brewind
    silent! redraw
  endif
endfunction
augroup VimStateManagement
  autocmd!
  autocmd VimLeavePre * mksession! ~/.vim_last_session
  autocmd VimEnter * call LoadSession()
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

" Resizing stuff
nnoremap <C-Left> :vertical res -1<CR>
nnoremap <C-Up> :res -1<CR>
nnoremap <C-Right> :vertical res +1<CR>
nnoremap <C-Down> :res +1<CR>

" Delete current buffer
nnoremap <silent> <C-w>d :bd<CR>
nnoremap <silent> <C-w><C-d> :bd<CR>

" Delete other buffers
function! DeleteOtherBuffers()
  let s:currentBuffer = bufnr('%')
  if bufnr('1') != s:currentBuffer
    silent! 1,.-1bdelete
  endif
  if bufnr('$') != s:currentBuffer
    silent! .1,$bdelete
  endif
  echomsg "Deleted other buffers"
endfunction
command! CloseOthers call DeleteOtherBuffers()
nnoremap <silent> <C-w>D :CloseOthers<CR>
nnoremap <silent> <C-w><C-D> :CloseOthers<CR>

" Jump to start/end of line
nnoremap H ^
nnoremap L $

" Tab management
nnoremap <C-t> :tabnew<Enter>
nnoremap <C-h> :tabprevious<Enter>
nnoremap <C-l> :tabnext<Enter>
nnoremap <M-h> :-tabmove<Enter>
nnoremap <M-l> :tabmove<Enter>

" Jump to the tag matching the text under the cursor
nnoremap gt :execute ':tj ' . expand('<cword>')<CR>

" Add the current file's directory to the path if not already present.
autocmd BufRead *
      \ let s:tempPath=escape(escape(expand("%:p:h"), ' '), '\ ') |
      \ exec "set path+=".s:tempPath

autocmd BufRead,BufNewFile *.vs,*.fs set filetype=glsl

" NERDTree
nnoremap <silent> <F2> :NERDTreeToggle<CR>

" Tagbar 
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1
let g:tagbar_autoclose = 1
nnoremap <F3> :TagbarToggle<Enter>

" Semantic highlighting
nnoremap <leader>S :SemanticHighlightToggle<CR>

" Switch declaration/header
noremap <silent> <leader>h <ESC>:A<CR>
noremap <silent> <F4> <ESC>:A<CR>

" Reselect visual selection after reindent
vnoremap < <gv
vnoremap > >gv

" Disable all vim2hs UTF-8 conceals
let g:haskell_conceal = 0

" Use j/k for navigating popup menu
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

" Flake8
let g:flake8_show_in_gutter = 1
autocmd BufWritePost ft=python call Flake8()

" Alternate
let g:alternateSearchPath = 'sfr:../source,sfr:../src,sfr:../include,sfr:../inc,sfr:../Public,sfr:../Private'

" Local vimrc config
let g:localvimrc_persistent = 2

" CtrlP
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_max_files = 0
let g:ctrlp_match_window = 'bottom,ttb,min:1,max:20,results:1000'
nnoremap <leader>t :CtrlPCurWD<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
