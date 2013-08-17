#!/usr/bin/env bash

# == Colors ==

bold="\033[1m"
red="\033[0;31m"
reset="\033[0m"

# == Setup ==

mkdir -p $HOME/.tools
cd $HOME/.tools

# == Repos ==

repos=(
  "dwm"
  "dmenu"
  "slock"
)

echo -e "${bold}Cloning:${reset} ${red}${repos[@]}${reset}"

for repo in "${repos[@]}"; do
  git clone http://git.suckless.org/"${repo}"
done
