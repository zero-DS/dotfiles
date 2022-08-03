# dotfiles
dotfiles for Mac OS

### instructions

1. clone this repository [repo](https://github.com/zero-DS/dotfiles)
2. execute command `sh install.sh`
3. open .vimrc with **Vim** and execute `:PlugInstall` in command mode

### descriptions

###### plugins for vim(managed by [vim-plug](https://github.com/junegunn/vim-plug))
- [delimitMate](https://github.com/raimondi/delimitmate)
- [vim-airline](https://github.com/vim-airline/vim-airline)
- [vim-airline-themes](https://github.com/vim-airline/vim-airline-themes)
- [jellybeans.vim](https://github.com/nanotech/jellybeans.vim)
- [syntastic](https://github.com/vim-syntastic/syntastic)
- [vim-indent-guides](https://github.com/valloric/vim-indent-guides)
- [ctrlpvim](https://github.com/ctrlpvim/ctrlp.vim)

* press ctrl-p in Vim to open fuzzy finder
* press \b for openig new buffer, \h for previous buffer
* press \l for next buffer, \d for closing current buffer

###### plugins for zsh
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [zsh-syntaxhighlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

* press tab to complete auto-suggestion based on history
* press shift-tab to complete available options in current directory

###### tmux
- mapped ctrl-b to ctrl-a
- mapped hjkl to move around panes (vim-like gesture)
- mapped s,v to make new panes horizontal, vertical respectively
