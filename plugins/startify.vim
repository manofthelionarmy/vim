Plug 'mhinz/vim-startify'

function! StartifyEntryFormat()
    return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction

let g:startify_custom_header_quotes = [
      \ ["Suckin' at something is the first step towards bein' sorta good at something", 
        \ "",  
        \ "- Jake the Dog, Adventure Time"
        \],
      \ ]

function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_commands = [
    \ ['🔎 Find File',':Files'],
    \ ['🔭 Search',':Rg'],
    \ ['📜 Recently Used Files',':History'],
    \ ['🔩 Configs',':FZF ~/.vim'],
    \ ]

let g:startify_lists = [
        \ { 'type': 'commands',  'header': ['    Commands']},
        \ { 'type': 'dir',       'header': ['    CurrDir '. getcwd()] },
        \ { 'type': 'files',     'header': ['    Recently Used Files']},
        \ { 'type': 'sessions',  'header': ['    Sessions']            },
        \ { 'type': function('s:gitModified'),  'header': ['    Git Modified']},
        \ { 'type': function('s:gitUntracked'), 'header': ['    Git Untracked']},
        \]

" You can use &setting to access the value of a vim setting. See :help expr-option.

" Here you can thus do:

" if &guioptions =~# 'a'
"    ....
" endif

" =~# in vimscript does case-sensitive regex matching.

" Similarly, if you wanted to check if an option is not set,

" if &guioptions !~# 'a'
"    ....
" endif

" Don't want to keep setting it every time we leave a buffer
function ToggleScrolloff()
  if &scrolloff =~# '0' 
    " documentation says this resets it to global value, which is 8 in my
    " settings
    setlocal scrolloff<
  endif 
endfunction

autocmd FileType startify setlocal scrolloff=0 | autocmd BufLeave <buffer> call ToggleScrolloff()
