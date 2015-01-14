#!/usr/bin/env sh

set -e

gitpath=$HOME/Git/dotfiles
binpath=$HOME/.local/bin
buildpath=$HOME/.local/builds/dwm

ln -vsf $gitpath/dwm/config.h $buildpath/config.h
ln -vsf $gitpath/dwm/dwm-start $binpath/dwm-start

cd $buildpath
git apply $gitpath/dwm/dwm-6.1-xft.diff
git apply $gitpath/dwm/dwm-6.1-better-borders.diff

sudo make clean install
