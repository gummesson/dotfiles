#!/usr/bin/env bash

# == Colors ==

bold="\033[1m"
red="\033[0;31m"
reset="\033[0m"

# == Setup ==

sudo mkdir -p ~/.tools
sudo mkdir -p ~/.colors

# == Files ==

files=(
  "~/Git/dotfiles/ack/.ackrc ~/.ackrc"
  "~/Git/dotfiles/dav/.davrc ~/.davrc"
  "~/Git/dotfiles/dwm/dwm-startup /usr/bin/dwm-startup"
  "~/Git/dotfiles/dwm/.fehbg ~/.fehbg"
  "~/Git/dotfiles/git/.gitconfig ~/.gitconfig"
  "~/Git/dotfiles/git/.gitignore ~/.gitignore"
  "~/Git/dotfiles/hnb/.hnbrc ~/.hnbrc"
  "~/Git/dotfiles/zsh/.zshrc ~/.zshrc"
  "~/Git/dotfiles/urxvt/.Xdefaults ~/.Xdefaults"
  "~/Git/dotfiles/zsh/custom.zsh ~/.oh-my-zsh/custom/custom.zsh"
  "~/Git/dotfiles/tools/note.sh ~/.tools/note.sh"
)

echo -e "${bold}Symlinking files:${reset} ${red}${files[@]}${reset}"

for file in "${files[@]}"; do
  sudo ln -s ${file}
done

# dwm.desktop setup
sudo cp ~/Git/dotfiles/dwm/dwm.desktop /usr/share/xsessions/

# Vimprobable setup
sudo cp ~/Git/dotfiles/vimprobable/vimprobablerc ~/.config/vimprobable/vimprobablerc

# == Folders ==

git submodule init && git submodule update

folders=(
  "~/Git/dotfiles/tools/z ~/.tools/z"
  "~/Git/dotfiles/tools/ranger ~/.tools/ranger"
  "~/Git/dotfiles/urxvt/.colors ~/.colors"
)

echo -e "${bold}Symlinking folders:${reset} ${red}${folders[@]}${reset}"

for folder in "${folders[@]}"; do
  sudo ln -s ${folder}
done
