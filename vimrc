execute pathogen#infect()
execute pathogen#helptags()

" Map leader to ,
let mapleader=","

" Map escape to jk, faster than using esc
inoremap jk <Esc>

"backspace working over linebreaks and imode start
set backspace=indent,eol,start

" Background dark/light
set background=dark
" Colorscheme
colorscheme solarized

if has("gui_running")
    " Hiding the menubar
    set guioptions-=m
    " Hiding the toolbar
    set guioptions-=T
else
    " Force terminator (and other terms) to use 16 colours
    " Avoids weird background colours when the solarized pallete is used in
    " the term
    set t_Co=16
    "solarized terminal compatibility
    "let g:solarized_termcolors=256
    " Enabling mouse in all modes
    set mouse=a
endif

" We're running Vim, not Vi!
set nocompatible
" Syntax highlighting
syntax on
" Line numbering
set number
" Highlight current line
set cursorline

" Tabs
set tabstop=4
set shiftwidth=4
set expandtab

" No word wrap
set nowrap

" Highlight found words on search
set hlsearch
" Show search matches incrementally
set incsearch
" ignore case if search pattern is all lowercase, case-sensitive otherwise
set smartcase

" Matching parenthesis
set showmatch

" Enable filetype detection
filetype on
" Enable filetype-specific indenting
filetype indent on
" Enable filetype-specific plugins
filetype plugin on
" No backup
set nobackup
set noswapfile
" Remember more commands and search history
set history=1000
" Use many muchos levels of undo
set undolevels=1000

" Open horizontal splits below the current one
set splitbelow
" Open vertical splits to the right of the current one
set splitright

" Remove all trailing whitespace on :w
autocmd BufWritePre * :%s/\s\+$//e

" NERDTree on startup
"autocmd VimEnter * NERDTree
" Focus the windows next to NERDTree
"autocmd VimEnter * wincmd p

" Airline on single buffer
set laststatus=2
" Disable bufferline on airline
let g:airline#extensions#bufferline#enabled = 0
" Truncate branch name on airline
let g:airline#extensions#branch#displayed_head_limit = 4

" Don't change CtrlP's current directory on file select
let g:ctrlp_working_path_mode = 0
