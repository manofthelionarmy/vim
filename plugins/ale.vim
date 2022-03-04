Plug 'dense-analysis/ale'

let g:ale_lint_on_text_changed=0
let g:ale_lint_on_insert_leave=1
let g:ale_lint_on_enter=1
let g:ale_lint_on_save=1
let g:ale_set_highlights=0
let g:ale_set_loclist=1
let g:ale_cursor_detail=0
let g:ale_set_signs=1
let g:ale_virtualtext_cursor=1
let g:ale_change_sign_column_color=0
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_sign_info = ''
let g:ale_set_quickfix = 1 " has all of the global errors, :copen, :cclose
let g:ale_set_loclist=1 " has all of the local errors :lopen, :lclose
let g:ale_fix_on_save=1 "Let ale do the work for autoformatting, not coc
" Make sure coc-eslint and coc-pretty are uninstalled
let g:ale_linters={
      \ 'javascript': ['eslint'],
      \ 'go': ['gofmt', 'revive'],
      \ 'java': ['javac', 'checkstyle']
      \}
let g:ale_go_golangci_lint_executable = 'golangci-lint'
let g:ale_go_golangci_lint_options = '' " don't use the default
let g:ale_java_checkstyle_config="/home/armando/.config/checkstyle/google_checks.xml"
" Must have fixers installed, globally for golang, locally for javascript
let g:ale_fixers = {
      \ 'javascript': ['prettier'],
      \ 'go': ['gofumpt', 'gofmt', 'goimports'],
      \ 'java': ['google_java_format'],
      \ 'sql': ['pgformatter']
      \}
