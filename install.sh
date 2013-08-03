#!/usr/bin/env bash

# == Colors ==

bold="\033[1m"
red="\033[0;31m"
reset="\033[0m"

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
  "~/Git/dotfiles/zsh/custom.zsh ~/.oh-my-zsh/custom/custom.zsh"
  "~/Git/dotfiles/terminator/config ~/.config/terminator/config"
)

echo -e "${bold}Symlinking files:${reset} ${red}${files[@]}${reset}"

for file in "${files[@]}"; do
  sudo ln -s ${file}
done

# == Folders ==

git submodule init && git submodule update
folders=(
  "~/Git/dotfiles/tools/z/ ~/.tools/z"
  "~/Git/dotfiles/tools/ranger/ ~/.tools/ranger"
)

echo -e "${bold}Symlinking folders:${reset} ${red}${folders[@]}${reset}"

for folder in "${folders[@]}"; do
  sudo ln -s ${folder}
done
