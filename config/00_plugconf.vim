if has('win32')
  call plug#begin('~/vimfiles/plugged')
else
  call plug#begin('~/.vim/plugged')
endif

" Plugins
Plug 'tpope/vim-fugitive'
Plug 'embear/vim-localvimrc'
Plug 'nvie/vim-flake8'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'majutsushi/tagbar'
Plug 'airblade/vim-gitgutter'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete-omni.vim'
Plug 'prabirshrestha/asyncomplete-tags.vim'
Plug 'prabirshrestha/asyncomplete-buffer.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-dispatch'
Plug 'easymotion/vim-easymotion'
Plug 'roman/golden-ratio'
Plug 'Shougo/denite.nvim'
Plug 'OmniSharp/omnisharp-vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'KabbAmine/zeavim.vim'
Plug 'tpope/vim-sleuth'
Plug 'vim-syntastic/syntastic'

" Color themes
Plug 'owickstrom/vim-colors-paramount'

call plug#end()
