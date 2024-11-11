" % to bounce from do to end etc.
runtime! macros/matchit.vim

" Trailing comma when arg-wrapping
let g:argwrap_tail_comma = 1

" Set the elixir fixer to rubocop
let g:ale_fixers.ruby = ['rubocop']

" Set syntax=rspec to all spec files, instead of default ruby
autocmd BufNewFile,BufRead *_spec.rb set syntax=rspec
