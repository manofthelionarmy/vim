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
let NERDTreeDirArrowCollapsible=''
let NERDTreeDirArrowExpandable=''
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
let NERDTreeMinimalUI=1
