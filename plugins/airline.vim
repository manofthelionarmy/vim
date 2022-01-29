Plug 'vim-airline/vim-airline'

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#formatter = 'default'
" let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_sep = '▎'
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '▎'
" let g:airline_left_sep=''
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#hunks#hunk_symbols = [' ', '柳', ' ']
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#obsession#enabled = 1
let g:airline#extensions#branch#format = 2
let g:airline#extensions#ale#enabled = 0
let g:airline#extensions#tabline#fnamemod = '%t'
let g:airline_exclude_filetypes = ['vimfiler', 'nerdtree', 'coctree']
" Why? we get an error when we re-source/AirlineAfterInit, looks like we can only set this once
" This conditional checks if airline is loaded. If it's not, set it
if !exists('g:loaded_airline')
  let g:airline_symbols = {'branch': ' ', 'dirty': '', 'notexists': ''}
endif

function! AirlineInit()
  let g:airline_section_a = airline#section#create(['mode'])
  let g:airline_section_b = airline#section#create(['branch','   %t'])
  let g:airline_section_c = airline#section#create(['hunks'])
  " TODO: change these?
  " let g:airline_section_x = airline#section#create(['filetype'])
  " let g:airline_section_y = airline#section#create(['fileencoding', 'fileformat'])
  " let g:airline_section_z = airline#section#create(['percentage', 'linenr', 'columnnr'])
endfunction

augroup mycustom_ariline
  autocmd!
  autocmd User AirlineAfterInit call AirlineInit()
augroup END
