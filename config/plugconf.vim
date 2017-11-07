if has('win32')
  call plug#begin('~/vimfiles/plugged')
else
  call plug#begin('~/.vim/plugged')
endif

Plug 'vim-scripts/a.vim'
Plug 'atelierbram/base2tone-vim'
Plug 'tpope/vim-fugitive'
Plug 'embear/vim-localvimrc'
Plug 'nvie/vim-flake8'

call plug#end()
