if has('win32')
  call plug#begin('~/vimfiles/plugged')
else
  call plug#begin('~/.vim/plugged')
endif

Plug 'atelierbram/base2tone-vim'
Plug 'tpope/vim-fugitive'
Plug 'embear/vim-localvimrc'
Plug 'nvie/vim-flake8'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'majutsushi/tagbar'
Plug 'spolu/dwm.vim'
Plug 'airblade/vim-gitgutter'

call plug#end()
