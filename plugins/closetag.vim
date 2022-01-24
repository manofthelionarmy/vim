Plug 'alvan/vim-closetag', {'for': ['javascript', 'markdown', 'javascriptreact']}

" Helps solve indeterministic flakiness
" Super important, makes this work on the BufNewFile and Bufread events
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js'
" Super important, makes this work on the FileType events
let g:closetag_filetypes = 'html,xhtml,phtml,javascript'
let g:closetag_xhtml_filetypes = 'xhtml,jsx,javascript'
let g:closetag_emptyTags_caseSensitive = 1

let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

let g:closetag_shortcut = '>'

