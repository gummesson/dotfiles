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
  "rxvt-unicode-256color ncurses-term"
)

echo -e "${bold}Installing:${reset} ${red}${devs[@]}${reset}"

for dev in "${devs[@]}"; do
  sudo apt-get install ${dev}
done

# Zsh setup
sudo wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O -i | sh
sudo chsh -s /bin/zsh

# Ack setup
sudo dpkg-divert --local --divert /usr/bin/ack --rename --add /usr/bin/ack-grep

# == Tools ==

tools=(
  "tree"
  "hnb"
  "dav-text"
  "cmus"
)

echo -e "${bold}Installing:${reset} ${red}${tools[@]}${reset}"

for tool in "${tools[@]}"; do
  sudo apt-get install ${tool}
done

# Dropbox setup
echo -e "${bold}Setting up Dropbox...${reset}"
sudo wget https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_1.6.0_i386.deb
sudo dpkg -i dropbox*

# == GUI ==

guis=(
  "uberwriter"
  "midori"
)

echo -e "${bold}Installing:${reset} ${red}${guis[@]}${reset}"

# UberWriter PPA
sudo add-apt-repository ppa:w-vollprecht/ppa && sudo apt-get update

for gui in "${guis[@]}"; do
  sudo apt-get install ${gui}
done

# == Gems ==

gems=(
  "sass"
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
