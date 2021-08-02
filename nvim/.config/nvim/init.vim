" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin(stdpath('data') . '/plugged')

" Make sure you use single quotes

Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-commentary'
Plug 'StanAngeloff/php.vim'
Plug 'ap/vim-css-color'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-sensible'


" Initialize plugin system
call plug#end()

let mapleader=","

" Some theming
colorscheme gruvbox
set background=dark    
let g:gruvbox_contrast_dark = 'hard'

" Show number lines
set number

" Show whole line on current line
set cursorline

" Converts tabs into 4 spaces
set expandtab
set tabstop=4

" set mouse=a

" Searching case sensitivity
set smartcase
set ignorecase

" Edit vimr configuration file
nnoremap <Leader>ve :e $MYVIMRC<CR>
" Reload vimr configuration file
nnoremap <Leader>vr :source $MYVIMRC<CR>

