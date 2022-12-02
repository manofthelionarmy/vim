"Toggle folding with spacebar
" Get use to using folds
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf
"open up file with folds unfolded by default
:let &foldlevel = max(map(range(1, line('$')), 'foldlevel(v:val)'))
:autocmd BufWinEnter * let &foldlevel = max(map(range(1, line('$')), 'foldlevel(v:val)'))

set foldmethod=syntax
nmap <Leader>f zM
nmap <Leader>u zR
let mapleader=","
"Nerdtree tab remappings
map <C-l> :tabn<CR>
map <C-h> :tabp<CR>
map <C-n> :tabnew<CR>
