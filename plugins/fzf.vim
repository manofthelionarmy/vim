Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse --margin=1,4 --preview 'bat --theme=TwoDark --color=always --style=header,grid --line-range :300 {}'"

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case --glob "!node_modules/" -g "!vendors/" -g "!.git/" -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
" FZF complete path, from https://github.com/junegunn/fzf.vim#mappings
" Go to link under cursror with gx
" Keymappings?
" imap <C-x><C-f> <plug>(fzf-complete-path)

" nnoremap <silent> <leader>tt :FZF<CR>
" nnoremap <silent> <leader>tc :FZF ~/.vim/<CR>
" nnoremap <silent> <leader>tl :RG<CR>
" nnoremap <silent> <leader>tbb :Buffers<CR>
" nnoremap <silent> <leader>bt :BTags<CR>
