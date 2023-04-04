Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }
" Only works if we do set the preview window
let g:fzf_preview_window = ['right:hidden', 'ctrl-/']
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
" TODO: figure out a way to set this
let s:preview = "--preview-window 'right:60%' --preview 'bat --theme=Gruvbox --color=always --style=header,grid --line-range :300 {}'"
let $FZF_DEFAULT_OPTS="--ansi --layout reverse --margin=1,4 --prompt='🔭 '"

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --smart-case --glob "!node_modules/" -g "!vendors/" -g "!.git/" -g "!build/" -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command, s:preview]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
command! -bang -nargs=? Buffers
            \ call fzf#vim#buffers(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline','--tiebreak=end']}), <bang>0)
" FZF complete path, from https://github.com/junegunn/fzf.vim#mappings
" Go to link under cursror with gx
" Keymappings?
" imap <C-x><C-f> <plug>(fzf-complete-path)

" nnoremap <silent> <leader>tt :FZF<CR>
" nnoremap <silent> <leader>tc :FZF ~/.vim/<CR>
" nnoremap <silent> <leader>tl :RG<CR>
" nnoremap <silent> <leader>tbb :Buffers<CR>
" nnoremap <silent> <leader>bt :BTags<CR>
function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! ProjectFiles execute 'Files' s:find_git_root()
