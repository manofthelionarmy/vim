Plug 'joshdick/onedark.vim'
autocmd ColorScheme * augroup MyColors
  autocmd!
  autocmd ColorScheme * hi Normal ctermbg=NONE guibg=NONE
        \ | hi CursorLineNR guifg=#FFba00
        \ | hi goParamType ctermfg=12
        \ | hi goField ctermfg=180
        \ | hi Comment gui=bold,italic cterm=bold,italic
        \ | hi ErrorMsg gui=undercurl cterm=undercurl
        \ | hi WarningMsg gui=undercurl cterm=undercurl
        \ | hi AleWarningLine gui=undercurl,bold guifg=orange cterm=undercurl,bold guifg=orange
        \ | hi AleVirtualTextWarning gui=undercurl,bold guifg=orange cterm=undercurl,bold guifg=orange
        \ | hi AleVirtualTextError gui=undercurl,bold guifg=red
augroup END
