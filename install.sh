#!/bin/env sh

#install zsh and plugins
sudo apt-get install zsh -y
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

#change default login shell to zsh
sudo usermod -s $(which zsh) $(whoami)

#install tmux
sudo apt-get install tmux -y

#install plugin manager 'vim-plug' for Vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#install compiler for C/C++, Python
sudo apt-get install g++ -y
sudo apt-get install python3 -y

#install xclip, vim-gtk for copy&paste to/from system clipboard
sudo apt-get install xclip -y
sudo apt-get install vim-gtk -y

#install nvm and install node.js for coc.nvim
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.36.0/install.sh | bash
nvm install node

#copy dotfiles to home directory
cp \.[^\.]* ~/
source ~/.zshrc
source ~/.vimrc
#copy tmux config files to bin directory
sudo cp tmux-* /usr/local/bin

#delete current folder after finishing installation
rm -rf $PWD
