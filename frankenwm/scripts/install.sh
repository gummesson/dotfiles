#!/usr/bin/env sh

set -e

gitpath="${HOME}/Git/dotfiles"
srcpath="${HOME}/.local/src/frankenwm"

echo "Symlinking files..."
ln -vsf "$gitpath/frankenwm/config.h" "$srcpath/config.h"

cd "$srcpath"
sudo make clean install
