set encoding=utf-8
if has('termguicolors')
  set termguicolors
endif
 
" For dark version.
set background=dark
colorscheme gruvbox
" Transparent background
hi Normal guibg=NONE ctermbg=NONE

" set number
set number relativenumber
set hlsearch
set cursorline
set autochdir
set ignorecase
set mouse=a
set pumheight=10
set lazyredraw
set splitright
set smartindent
set noswapfile
set scrolloff=8
set sidescrolloff=8
set expandtab
set nocursorbind
set noscrollbind
set nowrap
set numberwidth=4
set tabstop=2
set shiftwidth=2
set undofile
set smartcase
set signcolumn="yes:1"

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ' |'
let g:airline_left_sep=''
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#hunks#hunk_symbols = [' ', '柳', ' ']
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#obsession#enabled = 1
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
  " let g:airline_section_z = airline#section#create(['percentage%', 'linenumber', 'columnnumber'])
endfunction

augroup mycustom_ariline
  autocmd!
  autocmd User AirlineAfterInit call AirlineInit()
augroup END

let NERDTreeShowHidden=1

"Rainbow Parenthesis
augroup toggling_rainbow_highlight
  autocmd!
  au VimEnter * RainbowParenthesesToggle
  au Syntax * RainbowParenthesesLoadRound
  au Syntax * RainbowParenthesesLoadSquare
  au Syntax * RainbowParenthesesLoadBraces
augroup END
" Some stuff to have to make sure that vim-go plays nice with coc-vim
let g:go_def_mapping_enabled = 0
let g:go_code_completion_enabled=0
let g:go_gopls_enabled = 0
let g:go_echo_go_info = 0
let g:go_imports_autosave = 1
let g:go_fmt_autosave = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_types = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_fields = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1

"Ale
let g:ale_lint_on_text_changed=0
let g:ale_lint_on_insert_leave=1
let g:ale_lint_on_enter=1
let g:ale_lint_on_save=1
let g:ale_set_highlights=0
let g:ale_set_loclist=0
let g:ale_cursor_detail=0
let g:ale_set_signs=1
let g:ale_virtualtext_cursor=0
let g:ale_change_sign_column_color=0
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:airline#extensions#ale#enabled = 1
" Utils Snips is needed for our reacts snippets, and this prevents
" UltiSnippets from screwing with our tab completion in coc
" let g:UltiSnipsExpandTrigger= "<nop>"

" Play nicely with TMUX
let g:tmux_navigator_no_mappings = 1
if exists('$TMUX')
  function! TmuxOrSplitSwitch(wincmd, tmuxdir)
    let previous_winnr = winnr()
    silent! execute "wincmd " . a:wincmd
    if previous_winnr == winnr()
      call system("tmux select-pane -" . a:tmuxdir)
      redraw!
    endif
  endfunction

  let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
  let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
  let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te

  nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
  nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
  nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
  nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
else
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
endif

" NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <silent> tn :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" Commentary key bindings
nnoremap \/ :Commentary<CR>
vnoremap \/ :Commentary<CR>

" VsCode stuff?
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" FZF and RG :)
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
imap <C-x><C-f> <plug>(fzf-complete-path)

nnoremap <silent> <leader>tt :FZF<CR>
nnoremap <silent> <leader>tc :FZF ~/.vim/<CR>
nnoremap <silent> <leader>tl :RG<CR>
nnoremap <silent> <leader>tbb :Buffers<CR>
nnoremap <silent> <leader>bt :BTags<CR>

augroup lcd_to_path
  autocmd!
  autocmd BufEnter * silent! lcd %:h:p
augroup END

" Shift airline tabs
nnoremap <silent> <S-l> :bnext<CR>
nnoremap <silent> <S-h> :bprev<CR>

" Close Buffers
nnoremap <silent> <leader>c :bd<CR>

" Keep cursorline at eye-level
nnoremap j jzz
nnoremap k kzz
nnoremap G Gzz
nnoremap g; g;zz
nnoremap g, g,zz

" Remap shift
vnoremap > >gv
vnoremap < <gv

" Escape terminal
nnoremap <silent> <C-t> :vert terminal<CR>
" Go to the left while in terminal mode
tnoremap <silent> <C-h> <C-w>h

function! StartifyEntryFormat()
    return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction

" Startify
let g:startify_custom_header_quotes = [
      \ ["Suckin' at something is the first step towards bein' sorta good at something", 
        \ "",  
        \ "- Jake the Dog, Adventure Time"
        \],
      \ ]

function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_commands = [
    \ [' Find File',':Files'],
    \ [' Search',':Rg'],
    \ [' Recently Used Files',':History'],
    \ [' Configs',':FZF ~/.vim'],
    \ ]

let g:startify_lists = [
        \ { 'type': 'commands',  'header': ['    Commands']},
        \ { 'type': 'dir',       'header': ['    CurrDir '. getcwd()] },
        \ { 'type': 'files',     'header': ['    Recently Used Files']},
        \ { 'type': 'sessions',  'header': ['    Sessions']            },
        \ { 'type': function('s:gitModified'),  'header': ['    Git Modified']},
        \ { 'type': function('s:gitUntracked'), 'header': ['    Git Untracked']},
        \]

" not sure if it adds extra overhead on highlighting
" let g:indentLine_char_list = ['┆', '▏']
" " let g:indentLine_char_list = ['|', '¦', '┆', '┊']
" let g:indentLine_fileTypeExclude = ['startify']
" let g:indentLine_setColors = 0

" Vimspector
let g:vimspector_enable_mappings = 'HUMAN'
let g:vimspector_sidebar_width = 10
" let g:vimspector_bottombar_height = 0
" Will install debugging 'gadget' in this directory
" make sure to create a symbolic link with vimspector.json
" if you don't set this, installs will default to ~/.vim/plugged/vimspector
let g:vimspector_base_dir=expand( '$HOME/.config/vimspector-config' )
nnoremap <Leader>dd :call vimspector#Launch()<CR>
nnoremap <Leader>de :call vimspector#Reset()<CR>
nnoremap <Leader>dc :call vimspector#Continue()<CR>

nnoremap <Leader>dt :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>dT :call vimspector#ClearBreakpoints()<CR>

nmap <Leader>dk <Plug>VimspectorRestart
nmap <Leader>dh <Plug>VimspectorStepOut
nmap <Leader>dl <Plug>VimspectorStepInto
nmap <Leader>dj <Plug>VimspectorStepOver

augroup EditVim
  autocmd!
  autocmd BufWritePost .vimrc source $.vimrc
  autocmd FileType vim setlocal foldmethod=marker
augroup END

"GitGutter
nnoremap <silent> <leader>g; :GitGutterPrevHunk<CR>
nnoremap <silent> <leader>g, :GitGutterNextHunk<CR>
nnoremap <silent> <leader>gu :GitGutterUndoHunk<CR>
" Fold non-changes and show all of my current changes. Hit the keys again to
" unfold
nnoremap <silent> <leader>gf :GitGutterFold<CR>

" Helps solve indeterministic flakiness
" Super important, makes this work on the BufNewFile and Bufread events
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js'
" Super important, makes this work on the FileType events
let g:closetag_filetypes = 'html,xhtml,phtml,javascript'
let g:closetag_xhtml_filetypes = 'xhtml,jsx,javascript'
let g:closetag_emptyTags_caseSensitive = 1

let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

let g:closetag_shortcut = '>'
