#!/usr/bin/env sh

set -e

gitpath=$HOME/Git/dotfiles
binpath=$HOME/.local/bin
srcpath=$HOME/.local/src/dwm

echo "Symlinking files..."
ln -vsf $gitpath/dwm/config.h $srcpath/config.h
ln -vsf $gitpath/dwm/bin/dwm-start $binpath/dwm-start

echo "Applying patches..."
cd $srcpath
git apply $gitpath/dwm/patches/dwm-6.1-xft.diff
git apply $gitpath/dwm/patches/dwm-6.1-better-borders.diff

sudo make clean install
