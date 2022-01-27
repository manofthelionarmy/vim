Plug 'joshdick/onedark.vim'
autocmd ColorScheme * hi Comment gui=bold,italic cterm=bold,italic
augroup MyColors
  autocmd!
  autocmd ColorScheme * hi Normal ctermbg=NONE guibg=NONE
        \ | hi goParamType ctermfg=12
        \ | hi goField ctermfg=3
augroup END
