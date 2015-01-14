#!/usr/bin/env sh

set -e

gitpath=$HOME/Git/dotfiles
binpath=$HOME/.local/bin
srcpath=$HOME/.local/builds/dwm

ln -vsf $gitpath/dwm/config.h $srcpath/config.h
ln -vsf $gitpath/dwm/dwm-start $binpath/dwm-start

cd $srcpath
git apply $gitpath/dwm/dwm-6.1-xft.diff
git apply $gitpath/dwm/dwm-6.1-better-borders.diff

sudo make clean install
