#!/usr/bin/env bash

# == Colors ==

bold="\033[1m"
red="\033[0;31m"
reset="\033[0m"

# == apt-get ==

commands=(
  "autoremove"
  "autoclean"
)

echo -e "${bold}Cleaning up packages...${reset}"

for command in "${commands[@]}"; do
  sudo apt-get ${command}
done
