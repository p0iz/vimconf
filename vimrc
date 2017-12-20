" My superb vim configuration

" Source configuration scripts
runtime! config/*.vim

" Interface
set encoding=utf8
filetype plugin on
syntax on
set nocompatible
set backspace=indent,eol,start
set autoread
set cmdheight=1
set mousehide		" Hide the mouse when typing text
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
set hidden
set wildmenu
set wildmode=list:longest
set scrolloff=10
set confirm
set nrformats+=alpha " Allow C-A and C-X to increment chars
set novisualbell
set belloff=all
set fillchars=
" Indentation
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set smarttab
" Search
set smartcase
set incsearch
set cscopequickfix=s-,c-,d-,i-,t-,e-,g-
" Enable syntax folding and initially unfold everything
set foldmethod=syntax
set foldlevel=100
" GUI/Terminal settings
if has('gui_running')
  set lines=40
  set columns=180
  colorscheme Base2Tone_SpaceDark
  " set the GUI font to use
  if has("gui_gtk2")
    set guifont=FiraCode\ 9
  elseif has("gui_win32")
    set guifont=Fira_Code:h9:cANSI:qDRAFT
  endif
  set lines=40
  set columns=120
  " GUI Airline
  let g:airline_theme='Base2Tone_SpaceDark'
else
  set t_vb=
  set t_Co=256
  colorscheme default
endif

" Set a better title
autocmd BufEnter * let &titlestring = $USERNAME . "@" . hostname() . ' [' . expand("%:t") . "]"
set title

" Backup, swap and undo
set nobackup
set noswapfile
set undodir=~/.vim/undo//

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

" Use ripgrep for grepping
set grepprg=rg\ --vimgrep

" Flake8
let g:flake8_show_in_gutter = 1
autocmd BufWritePost ft=python call Flake8()

" Always persist local vimrc config
let g:localvimrc_persistent = 2

" Airline config
let g:airline_powerline_fonts = 1

" *** Key mappings ***

" Make space leader
let mapleader = " "

" Ex commands without shift
nnoremap ö :

" Make shift-insert work like in Xterm
noremap <S-Insert> <MiddleMouse>
noremap! <S-Insert> <MiddleMouse>

" Open quickfix window
nnoremap <leader>q :copen 20<CR>

" Open location list
nnoremap <leader>l :lopen 20<CR>

" Save
nnoremap <leader>s :w<CR>
nnoremap <leader>S :wa<CR>

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
nnoremap <M-h> :-1tabmove<Enter>
nnoremap <M-l> :+1tabmove<Enter>

" Jump to the tag matching the text under the cursor
nnoremap gt :execute ':tj ' . expand('<cword>')<CR>

" Add the current file's directory to the path if not already present.
autocmd BufRead *
      \ let s:tempPath=escape(escape(expand("%:p:h"), ' '), '\ ') |
      \ exec "set path+=".s:tempPath

" Reselect visual selection after reindent
vnoremap < <gv
vnoremap > >gv

" Use j/k for navigating popup menu
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

autocmd BufRead,BufNewFile *.vs,*.fs set filetype=glsl

" Tagbar
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1
let g:tagbar_autoclose = 1
nnoremap <F3> :TagbarToggle<Enter>

" Semantic highlighting
nnoremap <leader>S :SemanticHighlightToggle<CR>

" Alternate
nnoremap <silent> <leader>h <ESC>:A<CR>
nnoremap <silent> <F4> <ESC>:A<CR>
let g:alternateSearchPath = 'sfr:../source,sfr:../src,sfr:../include,sfr:../inc,sfr:../Public,sfr:../Private'

" FZF
nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>

" Asyncomplete
let g:asyncomplete_remove_duplicates = 1

