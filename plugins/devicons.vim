Plug 'ryanoasis/vim-devicons', {'commit': '71f239af28b7214eebb60d4ea5bd040291fb7e33'} "also used by NerdTree
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['jet'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['gohtml'] = ''
let g:DevIconsAppendArtifactFix=1
" if !exists('g:syntax_on')
" 	syntax enable
" endif
if exists("g:loaded_webdevicons")
	call webdevicons#refresh()
endif
