call plug#begin(stdpath('data') . '/plugged')

" Make sure you use single quotes
Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-css-color'
Plug 'burntsushi/ripgrep'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'scrooloose/nerdtree'
" Plug 'stanangeloff/php.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/syntastic'
Plug 'stsewd/fzf-checkout.vim'
Plug 'mbbill/undotree'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'nvim-treesitter/playground'

call plug#end()

