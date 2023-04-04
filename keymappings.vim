" Commentary key bindings
nnoremap <silent> <leader>/ :Commentary<CR>
vnoremap <silent> <leader>/ :Commentary<CR>

"VsCode stuff?
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" FZF
" FZF complete path, from https://github.com/junegunn/fzf.vim#mappings
" Go to link under cursror with gx
imap <C-x><C-f> <plug>(fzf-complete-path)
nnoremap <silent> <leader>tt :ProjectFiles<CR>
nnoremap <silent> <leader>tc :FZF ~/.vim/<CR>
nnoremap <silent> <space>td :FZF .<CR>
nnoremap <silent> <space>tl :Rg<CR>
nnoremap <silent> <space>t` :Buffers<CR>
nnoremap <silent> <leader>bt :BTags<CR>

" Shift airline tabs
function! BNext() 
  if &filetype != "nerdtree"
    execute 'bnext'
  endif
endfunction

function! BPrev() 
  if &filetype != "nerdtree"
    execute 'bprev'
  endif
endfunction

nnoremap <silent> <S-l> :call BNext()<CR>
nnoremap <silent> <S-h> :call BPrev()<CR>

" Close Buffers
nnoremap <silent> <leader>c :bd!<CR>

" Keep cursorline at eye-level
nnoremap j jzz
nnoremap k kzz
nnoremap G Gzz
nnoremap g; g;zz
nnoremap g, g,zz

" Remap shift
vnoremap > >gv
vnoremap < <gv

" Escape terminal
nnoremap <silent> <C-t> :vert terminal<CR>
" Go to the left while in terminal mode
tnoremap <silent> <C-h> <C-w>h

" CocDiagnostics filetype is qf and I want to close it
autocmd! FileType qf nnoremap <silent> <buffer> <Esc> :q<CR>

" NerdTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <silent> tn :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Vimspector
nnoremap <Leader>dd :call vimspector#Launch()<CR>
nnoremap <Leader>de :call vimspector#Reset()<CR>
nnoremap <Leader>dc :call vimspector#Continue()<CR>

nnoremap <Leader>dt :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>dT :call vimspector#ClearBreakpoints()<CR>

nmap <Leader>dk <Plug>VimspectorRestart
nmap <Leader>dh <Plug>VimspectorStepOut
nmap <Leader>dl <Plug>VimspectorStepInto
nmap <Leader>dj <Plug>VimspectorStepOver


" GitGutter
nnoremap <silent> <leader>g; :GitGutterPrevHunk<CR>
nnoremap <silent> <leader>g, :GitGutterNextHunk<CR>
nnoremap <silent> <leader>gu :GitGutterUndoHunk<CR>
" Fold non-changes and show all of my current changes. Hit the keys again to unfold
nnoremap <silent> <leader>gf :GitGutterFold<CR>
nnoremap <silent> <leader>gs :GitGutterStageHunk<CR>

" Coc-Outline
" nnoremap <silent> <space>tb :CocOutline<CR>

inoremap <silent><expr> <C-j> coc#pum#visible() ? coc#pum#next(1) : "\<C-j>"
inoremap <silent><expr> <C-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-k>"
