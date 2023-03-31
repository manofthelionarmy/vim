Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#formatter = 'default'
" let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_sep = '▎'
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '▎'
" let g:airline_left_sep=''
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#hunks#enabled=1
let g:airline#extensions#hunks#hunk_symbols = [' ', '柳', ' ']
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#obsession#enabled = 1
let g:airline#extensions#branch#format = 2
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#fnamecollapse = 1
let g:airline_exclude_filetypes = ['vimfiler', 'nerdtree', 'coctree']
" Why? we get an error when we re-source/AirlineAfterInit, looks like we can only set this once
" This conditional checks if airline is loaded. If it's not, set it
if !exists('g:loaded_airline')
  let g:airline_symbols = {'branch': ' ', 'dirty': '', 'notexists': ''}
endif

" let g:airline#extensions#ale#enabled = 1

" let g:airline#extensions#default#layout = [
"     \ [ 'a', 'b', 'c' ],
"     \ [ 'x' ],
"     \ ]
function! Scrollbar() abort
    if winwidth(0) <= 50
      return ''
    endif
    let current_line = line(".") 
    let total_lines = line("$") / 1.0
    let chars = [ "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" ]
    let line_ratio = current_line / total_lines
    " not updating properly
    let index = float2nr(ceil(line_ratio * len(chars)))
    if index == len(chars) 
      return chars[index-1]
    endif
    return chars[index]
endfunction

function! AirlineInit()
  let g:airline_section_a = airline#section#create(['mode'])
  let g:airline_section_b = airline#section#create_left(['branch','%t'])
  let g:airline_section_c = airline#section#create(['%{airline#extensions#hunks#get_hunks()}'])
  let g:airline_section_x = airline#section#create_left(['filetype'])
  " can't change section y
  let g:airline_section_y = '%{printf(" ")}'
  " it's not always redrawing
  let g:airline_section_z = airline#section#create(['%{Scrollbar()}'])
  " let g:airline_section_a = airline#section#create(['mode', ' ', 'foo'])
  " let g:airline_section_b = airline#section#create_left(['ffenc','file'])
  " let g:airline_section_c = airline#section#create(['%{getcwd()}'])
endfunction

augroup mycustom_ariline
  autocmd!
  autocmd User AirlineAfterInit call AirlineInit()
augroup END

  let g:airline_mode_map = {
      \ '__'     : '-',
      \ 'c'      : 'C',
      \ 'i'      : 'I',
      \ 'ic'     : 'I',
      \ 'ix'     : 'I',
      \ 'n'      : 'N',
      \ 'multi'  : 'M',
      \ 'ni'     : 'N',
      \ 'no'     : 'N',
      \ 'R'      : 'R',
      \ 'Rv'     : 'R',
      \ 's'      : 'S',
      \ 'S'      : 'S',
      \ ''     : 'S',
      \ 't'      : 'T',
      \ 'v'      : 'V',
      \ 'V'      : 'V',
      \ ''     : 'V',
      \ }
