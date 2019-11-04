" % to bounce from do to end etc.
runtime! macros/matchit.vim

" Set the elixir linter to be the elixir-ls language server
let g:ale_linters.elixir = ['elixir-ls']

" Point to the release folder for elixir-ls
" Must be absolute path, hence the if
if has('osxdarwin')
    let g:ale_elixir_elixir_ls_release = '/Users/andy/Workspace/elixir-ls/release'
elseif has('unix')
    let g:ale_elixir_elixir_ls_release = '/home/andy/Workspace/elixir-ls/release'
endif

" Set the elixir fixer to mix format, and fix on save
let g:ale_fixers.elixir = ['mix_format']
let g:ale_fix_on_save = 1
