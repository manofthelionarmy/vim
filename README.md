# MyVim

## Requirements

Make sure to install:
- Vim
- Node 12^
- universal ctags
- fzf 
- ripgrep
- nvm
- make

## Installation

Run `make install` from ~/.vim. Afterwards, enter vim and run `PlugInstall`.

### Vimspector

In vim, enter the command:
```
VimspectorInstall vscode-debug2
```

It takes a minute or two, so wait for the debugging 'gadet' to be installed.
Afterwards, run `make link` from ~/.vim.

## mysettings.vim

This contains general settings, as well as my themes or customization relating to the plugins from myplugins.vim


## myplugins.vim

This contains all of my plugins 

## mycoc.vim

This contains the mappings and settings realted to coc-nvim. Most of the settings are taken from their example settings.

## .vimrc

This is the "centralized" place were we source all of the vim files.

