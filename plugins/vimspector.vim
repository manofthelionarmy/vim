Plug 'puremourning/vimspector', {'for': ['javascript']}

let g:vimspector_enable_mappings = 'HUMAN'
let g:vimspector_sidebar_width = 10
" let g:vimspector_bottombar_height = 0
" Will install debugging 'gadget' in this directory
" make sure to create a symbolic link with vimspector.json
" if you don't set this, installs will default to ~/.vim/plugged/vimspector
let g:vimspector_base_dir=expand( '$HOME/.config/vimspector-config' )
