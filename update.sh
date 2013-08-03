#!/usr/bin/env bash

# == Submodules ==
git submodule foreach git pull origin master

# == Oh My Zsh ==
upgrade_oh_my_zsh
