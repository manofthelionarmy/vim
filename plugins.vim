" Documentation says set this before we upload plugins
let g:ale_disable_lsp = 1
set nocompatible
call plug#begin()
" Plugin Manager
Plug 'junegunn/vim-plug'
source ~/.vim/plugins/sensible.vim
source ~/.vim/plugins/coc.vim
source ~/.vim/plugins/vim-go.vim
source ~/.vim/plugins/ale.vim
source ~/.vim/plugins/nerdtree.vim
source ~/.vim/plugins/airline.vim
source ~/.vim/plugins/closetag.vim
source ~/.vim/plugins/autopairs.vim
source ~/.vim/plugins/commentary.vim
source ~/.vim/plugins/polyglot.vim
source ~/.vim/plugins/onedark.vim
source ~/.vim/plugins/catppucin.vim
" source ~/.vim/plugins/dracula.vim
source ~/.vim/plugins/gruvbox.vim
source ~/.vim/plugins/gitgutter.vim
source ~/.vim/plugins/fugitive.vim
source ~/.vim/plugins/rainbowbraces.vim
source ~/.vim/plugins/tmux.vim
source ~/.vim/plugins/js.vim
source ~/.vim/plugins/fzf.vim
source ~/.vim/plugins/startify.vim
source ~/.vim/plugins/vimspector.vim
source ~/.vim/plugins/devicons.vim
source ~/.vim/plugins/fixcursorhold.vim
" source ~/.vim/plugins/leetcode.vim
call plug#end()
