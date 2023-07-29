Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries', 'for': ['go', 'go.mod', 'tmpl', 'gohtml'], 'tag': 'v1.28'}

" Some stuff to have to make sure that vim-go plays nice with coc-vim
let g:go_def_mapping_enabled = 0
let g:go_code_completion_enabled=0
let g:go_gopls_enabled = 0
let g:go_echo_go_info = 0
let g:go_imports_autosave = 1
let g:go_fmt_autosave = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_types = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_fields = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1


" Enable this when we have issues in debugging
" let g:go_debug=['shell-commands']
let g:go_debug_address='127.0.0.1:8181'

" Need this to debug 
let g:go_debug_breakpoint_sign_text = ''

let g:go_debug_windows = {
      \ 'vars':       'leftabove 40vnew',
      \ 'stack':      'leftabove 10new',
\ }
