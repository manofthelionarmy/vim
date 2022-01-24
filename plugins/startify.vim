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
    \ ['🔍 Find File',':Files'],
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
