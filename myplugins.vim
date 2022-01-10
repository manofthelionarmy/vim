set nocompatible
let g:ale_disable_lsp = 1
call plug#begin()
" Plugin Manager
Plug 'junegunn/vim-plug'
" AutoCompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/FixCursorHold.nvim'
" Git Plugin for Vim
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
" doesn't support lazy loading :(
" Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-gitgutter'
Plug 'dense-analysis/ale'
" Go 
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries', 'for': 'go', 'tag': 'v1.25'}

" NerdTree and Plugins
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin' "Git plugin for NerdTree
" Tmux
Plug 'christoomey/vim-tmux-navigator'
" Color schemes
Plug 'morhetz/gruvbox'
" Appearance
Plug 'vim-airline/vim-airline'
"Dev icons (needs to be loaded after vim-arline and nerd tree)
Plug 'ryanoasis/vim-devicons' "also used by NerdTree
" -- Etc
Plug 'kien/rainbow_parentheses.vim'
" Works great with one buffer, but fails if we have multiple buffers
Plug 'alvan/vim-closetag', {'for': ['javascript', 'markdown', 'javascriptreact']}
" Works great in multiple buffers, but doesn't play well with autocompletion
" Plug 'docunext/closetag.vim', {'for': ['javascript', 'markdown', 'javascriptreact']}
Plug 'mattn/emmet-vim', {'for': ['markdown']}
Plug 'jiangmiao/auto-pairs'

" Javascript, JSX
Plug 'yuezk/vim-js', {'for':['javascript', 'javascriptreact']}
" Plug 'pangloss/vim-javascript', {'for':['javascript', 'javascriptreact']}
Plug 'MaxMEllon/vim-jsx-pretty', {'for':['javascript', 'javascriptreact']}

" Fzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-startify'
Plug 'puremourning/vimspector'
" Airline already has this feature
" Plug 'Yggdroot/indentLine'
" Learn how to utilize sessions one day
" Plug 'tpope/vim-obsession'
" Debugging :)
Plug 'puremourning/vimspector', {'for': ['javascript']}
call plug#end()

