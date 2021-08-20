" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin(stdpath('data') . '/plugged')

" Make sure you use single quotes

plug 'airblade/vim-gitgutter'
plug 'ap/vim-css-color'
plug 'burntsushi/ripgrep'
plug 'ctrlpvim/ctrlp.vim'
plug 'gruvbox-community/gruvbox'
plug 'junegunn/fzf'
plug 'junegunn/fzf.vim'
plug 'neoclide/coc.nvim', {'branch': 'release'}
plug 'nvim-lua/plenary.nvim'
plug 'nvim-telescope/telescope.nvim'
plug 'scrooloose/nerdtree'
plug 'stanangeloff/php.vim'
plug 'tpope/vim-commentary'
plug 'tpope/vim-fugitive'
plug 'tpope/vim-sensible'
plug 'vim-airline/vim-airline'

" Initialize plugin system
call plug#end()

let mapleader=" "

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
set clipboard+=unnamedplus

" Edit vimr configuration file
nnoremap <Leader>ve :e $MYVIMRC<CR>
" Reload vimr configuration file
nnoremap <Leader>vr :source $MYVIMRC<CR>

nnoremap <Leader>ff <cmd>Telescope find_files<cr>
nnoremap <Leader>fg <cmd>Telescope live_grep<cr>
nnoremap <Leader>fb <cmd>Telescope buffers<cr>
nnoremap <Leader>fh <cmd>Telescope help_tags<cr>

" Coc related
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

nnoremap <C-p> :Files<Cr>
