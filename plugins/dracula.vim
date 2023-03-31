Plug 'dracula/vim', { 'as': 'dracula' }
augroup MyColors
  autocmd!
  " TODO
  autocmd ColorScheme * hi Comment gui=bold,italic cterm=bold,italic
        \ | hi Type ctermfg=117 guifg=#8BE9FD
        \ | hi goParamType ctermfg=12
        \ | hi goField ctermfg=180
        \ | hi Comment gui=bold,italic cterm=bold,italic
        \ | hi ErrorMsg gui=undercurl cterm=undercurl
        \ | hi WarningMsg gui=undercurl cterm=undercurl
        \ | hi AleWarningLine gui=undercurl,bold guifg=orange cterm=undercurl,bold guifg=orange
augroup END
