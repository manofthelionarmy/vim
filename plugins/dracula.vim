Plug 'dracula/vim', { 'as': 'dracula' }
augroup MyColors
  autocmd!
  " TODO
  autocmd ColorScheme * hi Comment gui=bold,italic cterm=bold,italic
        \ | hi Type ctermfg=117 guifg=#8BE9FD
augroup END
