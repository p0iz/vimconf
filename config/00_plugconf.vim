if has('win32')
  call plug#begin('~/vimfiles/plugged')
else
  call plug#begin('~/.vim/plugged')
endif

" Plugins
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'embear/vim-localvimrc'
Plug 'KabbAmine/zeavim.vim'
Plug 'leafgarland/typescript-vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
Plug 'nvie/vim-flake8'
Plug 'OmniSharp/omnisharp-vim'
Plug 'roman/golden-ratio'
Plug 'Shougo/denite.nvim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-syntastic/syntastic'

" Color themes
Plug 'altercation/vim-colors-solarized'
Plug 'owickstrom/vim-colors-paramount'

call plug#end()
