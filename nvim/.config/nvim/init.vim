" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin(stdpath('data') . '/plugged')

" Make sure you use single quotes

Plug 'StanAngeloff/php.vim'
Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-css-color'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'    
Plug 'nvim-telescope/telescope.nvim'

" Initialize plugin system
call plug#end()

let mapleader=","

" Some theming
colorscheme gruvbox
let g:gruvbox_contrast_dark='hard'
set background=dark 
highlight Normal guibg=none

" Show number lines
set number
set relativenumber

" Show whole line on current line
set cursorline

" Converts tabs into 4 spaces
set expandtab
set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent

" set mouse=a

" Searching case sensitivity
set smartcase
set ignorecase

" Execute local vimrc
set exrc

" No highligh after search
set nohlsearch

set hidden

set scrolloff=8

set colorcolumn=80

" Edit vimr configuration file
nnoremap <Leader>ve :e $MYVIMRC<CR>
" Reload vimr configuration file
nnoremap <Leader>vr :source $MYVIMRC<CR>

