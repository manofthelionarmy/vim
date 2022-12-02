" NerdTree and Plugins
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin' "Git plugin for NerdTree

let NERDTreeShowHidden=1
let g:NERDTreeIgnore = ['^node_modules$',
      \ '^.git$',
      \ '^vendor$',
      \ '^plugged$',
      \ '^autoload$',
      \ '^undo$'
      \]
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ''
let g:WebDevIconsUnicodeDecorateFolderNodes = v:true
" let NERDTreeDirArrowCollapsible=''
" let NERDTreeDirArrowExpandable=''
let g:NERDTreeDirArrowExpandable = "\u00a0"
let g:NERDTreeDirArrowCollapsible = "\u00a0"
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'',
                \ 'Staged'    :'S',
                \ 'Untracked' :'U',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'',
                \ 'Deleted'   :'',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'◌',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'',
                \ }
let g:NERDTreeGitStatusConcealBrackets=1
let g:webdevicons_conceal_nerdtree_brackets=1
" let NERDTreeMinimalUI=1
let g:DevIconsDefaultFolderOpenSymbol=''
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol=''

