" My superb vim (and neovim) configuration
if !has('nvim')
  set nocompatible
endif

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
set shortmess=a
set guioptions-=m
set guioptions-=r
set guioptions-=l
set guioptions-=T
set guioptions-=L
set linespace=2

set number
set mouse=a
set updatetime=1000
set incsearch
set hidden
set wildmenu
set wildmode=full
set scrolloff=20
set cscopequickfix=s-,c-,d-,i-,t-,e-,g-
set confirm

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
\ %(%m\%m\%m\%)%=[ASCII:\ %02B][%{strftime(\"%H:%M:%S\")}]%{SyntasticStatuslineFlag()}%*

filetype plugin on
syntax on

if !has('nvim')
  set t_Co=256
endif

set background=dark
if has("gui_running")
  colorscheme Base2Tone-Drawbridge-dark
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

" Make space leader
let mapleader = " "

" Exit Neovim terminal mode with Esc
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
endif

" Make shift-insert work like in Xterm
noremap <S-Insert> <MiddleMouse>
noremap! <S-Insert> <MiddleMouse>

" Ctrl-P
let g:ctrlp_map = '<leader>t'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_match_window = 'order:ttb,max:20,results:50'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_max_files = 25000
nnoremap <leader>b :CtrlPBuffer<CR>

" Open quickfix window
nnoremap <leader>q :copen 20<CR>

" Open location list
nnoremap <leader>l :lopen 20<CR>

" Save 
nnoremap <leader>s :w<CR>

" Toggle Limelight
nnoremap <leader>L :Limelight!!<CR>

" GoYo (with 120 char lines)
nnoremap <leader>gy :Goyo 120<CR>

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

" Jump to the tag matching the text under the cursor
nnoremap gt :execute ':tj ' . expand('<cword>')<CR>

" Git grep the word under the cursor in the working dir
nnoremap gg :execute ':Ggrep ' . expand('<cword>') . ' **'<Cr> <silent!>

" Add the current file's directory to the path if not already present.
autocmd BufRead *
      \ let s:tempPath=escape(escape(expand("%:p:h"), ' '), '\ ') |
      \ exec "set path+=".s:tempPath

autocmd BufRead,BufNewFile *.vs,*.fs set filetype=glsl

" netrw
let g:netrw_winsize='-28'
let g:netrw_liststyle=3
nnoremap <F2> :Lexplore 20<CR>

" Tagbar 
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1
let g:tagbar_autoclose = 1
nnoremap <F3> :TagbarToggle<Enter>

" Semantic highlighting
nnoremap <leader>S :SemanticHighlightToggle<CR>

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_check_header = 1

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

" Limelight
let g:limelight_conceal_ctermfg = 240
