#!/bin/sh

# == Colors ==

bold="\033[1m"
red="\033[0;31m"
reset="\033[0m"

# == Development ==

devs=(
  "rxvt-unicode-256color"
  "zsh"
  "git"
  "ack-grep"
  "ruby"
  "ruby-dev"
)

echo -e "${bold}Installing:${reset} ${red}${devs[@]}${reset}"

for dev in "${devs[@]}"; do
  sudo apt-get install ${dev}
done

# Zsh setup
sudo wget --no-check-certficate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
sudo chsh -s /bin/zsh

# Ack setup
sudo dpkg-divert --local --divert /usr/bin/ack --rename --add /usr/bin/ack-grep

# == Tools ==

tools=(
  "cpufrequtils"
  "curl"
  "feh"
  "unclutter"
  "autocutsel"
  "tree"
  "xclip"
  "scrot"
  "usbmount"
  "pandoc"
)

echo -e "${bold}Installing:${reset} ${red}${tools[@]}${reset}"

for tool in "${tools[@]}"; do
  sudo apt-get install ${tool}
done

# == Apps ==

apps=(
  "vim-gtk"
  "dav-text"
  "hnb"
  "mplayer2"
  "cmus"
  "uzbl"
  "elinks"
  "surfraw surfraw-extra"
  "irssi"
  "zathura"
)

echo -e "${bold}Installing:${reset} ${red}${apps[@]}${reset}"

for app in "${apps[@]}"; do
  sudo apt-get install ${app}
done

# == Fonts ==

fonts=(
  "xfonts-terminus"
  "fonts-liberation"
)

echo -e "${bold}Installing:${reset} ${red}${fonts[@]}${reset}"

for font in "${fonts[@]}"; do
  sudo apt-get install ${font}
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
