#!/bin/sh

# Colors

bold="\033[1m"
red="\033[0;31m"
reset="\033[0m"

# Submodules

echo -e "${bold}Updating submodules...${reset}"
git submodule foreach git pull origin master

# Oh My Zsh

echo -e "${bold}Updating Oh My Zsh...${reset}"
upgrade_oh_my_zsh
