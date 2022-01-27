" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8
set fileencoding=utf-8
if has('termguicolors')
  set termguicolors
endif

set background=dark
colorscheme onedark
set number relativenumber
set hlsearch
set cursorline
set autochdir
set ignorecase
set mouse=a
set pumheight=10
set lazyredraw
set splitright
set smartindent
set noswapfile
set scrolloff=8
set sidescrolloff=8
set expandtab
set nocursorbind
set noscrollbind
set nowrap
set numberwidth=4
set tabstop=2
set shiftwidth=2
set undofile
set undodir=$HOME/.vim/undo
set smartcase
set nolinebreak
set noshowmode
set incsearch

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
set signcolumn=yes

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Looks like ale fixers fixes this if I include goimports
" autocmd! BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
autocmd! BufEnter *.hbs :set ft=html

" CocDiagnostics filetype is qf and I want to close it
autocmd! FileType qf nnoremap <silent> <buffer> <Esc> :q<CR>
