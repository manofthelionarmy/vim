Plug 'joshdick/onedark.vim'
autocmd ColorScheme * augroup MyColors
  autocmd!
  autocmd ColorScheme * hi Normal ctermbg=NONE guibg=NONE
        \ | hi goParamType ctermfg=12
        \ | hi goField ctermfg=180
        \ | hi Comment gui=bold,italic cterm=bold,italic
augroup END
