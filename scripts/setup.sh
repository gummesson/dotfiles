#!/usr/bin/env bash

# == Colors ==

bold="\033[1m"
red="\033[0;31m"
reset="\033[0m"

# == Development ==

devs=(
  "git"
  "vim-gtk"
  "zsh"
  "ack-grep"
  "rxvt-unicode-256color"
)

echo -e "${bold}Installing:${reset} ${red}${devs[@]}${reset}"

for dev in "${devs[@]}"; do
  sudo apt-get install ${dev}
done

# Zsh setup
sudo curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
sudo chsh -s /bin/zsh

# Ack setup
sudo dpkg-divert --local --divert /usr/bin/ack --rename --add /usr/bin/ack-grep

# == Tools ==

tools=(
  "tree"
  "xclip"
  "hnb"
  "dav-text"
  "cmus"
  "mplayer2"
)

echo -e "${bold}Installing:${reset} ${red}${tools[@]}${reset}"

for tool in "${tools[@]}"; do
  sudo apt-get install ${tool}
done

# == GUI ==

guis=(
  "midori"
  "focuswriter"
)

echo -e "${bold}Installing:${reset} ${red}${guis[@]}${reset}"

for gui in "${guis[@]}"; do
  sudo apt-get install ${gui}
done

# == Gems ==

gems=(
  "compass"
  "jekyll"
)

echo -e "${bold}Installing:${reset} ${red}${gems[@]}${reset}"

for gem in "${gems[@]}"; do
  sudo gem install ${gem}
done

# == dwm ==

dwms=(
  "dwm"
  "suckless-tools"
  "acpi"
  "unclutter"
  "feh"
)

echo -e "${bold}Installing:${reset} ${red}${dwms[@]}${reset}"

for dwm in "${dwms[@]}"; do
  sudo apt-get install ${dwm}
done
