#!/usr/bin/env bash

# Remove configuration files: 
#  Synaptic Package Manager -> Status -> Not Installed (Residual config)

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

# == Folders ==

folders=(
  "Downloads"
  "Desktop"
)

echo -e "${bold}Cleaning up folders...${reset}"

for folder in "${folders[@]}"; do
  sudo rm -rf ~/${folder}/*
done
