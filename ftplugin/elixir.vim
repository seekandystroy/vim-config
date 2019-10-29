" % to bounce from do to end etc.
runtime! macros/matchit.vim

let g:ale_linters = {}
let g:ale_linters.elixir = ['elixir-ls']

let g:ale_fixers = {}
let g:ale_fixers.elixir = ['mix_format']
let g:ale_fix_on_save = 1

if has('osxdarwin')
    let g:ale_elixir_elixir_ls_release = '/Users/andy/Workspace/elixir-ls/release'
endif
