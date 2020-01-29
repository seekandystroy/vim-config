execute pathogen#infect()
execute pathogen#helptags()

" On Mac, use the older regexpengine, due to performance issues
if has("macunix")
    set re=1
end

" Map leader to ,
let mapleader=","

" Map escape to jk, faster than using esc
noremap! jk <Esc>

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

" Folding per-language settings
set foldmethod=syntax
" Folds open when a file is opened
set foldlevelstart=99
function! MyFoldText() " {{{
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}
set foldtext=MyFoldText()

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

" FZF (replaces Ctrl-P, FuzzyFinder and Command-T)
set rtp+=/usr/local/opt/fzf
set rtp+=~/.fzf
nnoremap ; :Buffers<CR>
nnoremap <Leader>r :Tags<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>a :Ag<CR>

" Tell ack.vim to use ag (the Silver Searcher) instead
let g:ackprg = 'ag --vimgrep'

" Mapping to Ack on the current word, shows in quicklist
nnoremap <Leader>k :Ack! "\b<cword>\b" <CR>

" Wrap arguments from a line to multiline
nnoremap <silent> <Leader>aw :ArgWrap<CR>

" Initialize the linters and fixers objects for ALE to use. Each language's
" file defines the corresponding linters and fixers
let g:ale_linters = {}
let g:ale_fixers = {}

" Set syntax=rspec to all spec files, instead of default ruby
autocmd BufNewFile,BufRead *_spec.rb set syntax=rspec
