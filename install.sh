#!/usr/bin/env bash

# == Colors ==

bold="\033[1m"
red="\033[0;31m"
reset="\033[0m"

# == Setup ==

setups=(
  "$HOME/.tools"
)

for setup in "${setups[@]}"; do
  mkdir -p ${setup}
done

# == Files ==

files=(
  "$HOME/Git/dotfiles/ack/.ackrc $HOME/.ackrc"
  "$HOME/Git/dotfiles/dav/.davrc $HOME/.davrc"
  "$HOME/Git/dotfiles/feh/.fehbg $HOME/.fehbg"
  "$HOME/Git/dotfiles/git/.gitconfig $HOME/.gitconfig"
  "$HOME/Git/dotfiles/git/.gitignore $HOME/.gitignore"
  "$HOME/Git/dotfiles/hnb/.hnbrc $HOME/.hnbrc"
  "$HOME/Git/dotfiles/ruby/.gemrc $HOME/.gemrc"
  "$HOME/Git/dotfiles/zsh/.zshrc $HOME/.zshrc"
  "$HOME/Git/dotfiles/x/.xinitrc $HOME/.xinitrc"
  "$HOME/Git/dotfiles/x/.Xresources $HOME/.Xresources"
  "$HOME/Git/dotfiles/zsh/custom.zsh $HOME/.oh-my-zsh/custom/custom.zsh"
  "$HOME/Git/dotfiles/tools/note.sh $HOME/.tools/note.sh"
)

echo -e "${bold}Symlinking files:${reset} ${red}${files[@]}${reset}"

for file in "${files[@]}"; do
  ln -s ${file}
done

# dwm setup
sudo ln -s $HOME/Git/dotfiles/dwm/dwm-startup /usr/bin/dwm-startup

# == Folders ==

git submodule init && git submodule update

folders=(
  "$HOME/Git/dotfiles/x/.colors $HOME/.colors"
  "$HOME/Git/dotfiles/uzbl $HOME/.config/uzbl"
  "$HOME/Git/dotfiles/tools/z $HOME/.tools/z"
  "$HOME/Git/dotfiles/tools/ranger $HOME/.tools/ranger"
)

echo -e "${bold}Symlinking folders:${reset} ${red}${folders[@]}${reset}"

for folder in "${folders[@]}"; do
  ln -s ${folder}
done
