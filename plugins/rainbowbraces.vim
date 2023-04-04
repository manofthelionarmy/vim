" Plug 'luochen1990/rainbow'
" let g:rainbow_active=1
" augroup CustomRainbowBraces
"   autocmd!
"   autocmd FileType nerdtree 
" augroup END
" Plug 'junegunn/rainbow_parentheses.vim'
" augroup rainbow
"   function! ToggleRainbow()
"     let ignore = [ 'help', 'nerdtree', 'tagbar' ]
"     if index(ignore, &ft) == -1 
"       RainbowParentheses
"     endif
"   endfunction
"   autocmd!
"   autocmd BufWritePre * call ToggleRainbow()
" augroup END
" let g:rainbow#pairs = [
"       \ [ '(', ')' ],
"       \ [ '[', ']' ],
"       \ [ '{', '}' ],
"       \ [ '<', '>' ]
"       \ ]
" let g:rainbow#blacklist = [ '#F7768E', '#FF9E64', '#06080a', '#9ECE6A', 81, '#a9b1d6', '#3b3d57', '#444B6A', ]
