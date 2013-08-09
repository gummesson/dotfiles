#!/usr/bin/env bash

# == Setup ==

sudo mkdir -p $HOME/.tools/dropbox-cli
sudo cd $HOME/.tools/dropbox-cli

sudo curl -O https://www.dropbox.com/download?dl=packages/dropbox.py
sudo chmod +x dropbox.py
sudo ln -s $HOME/.tools/dropbox-cli/dropbox.py /usr/bin/dropbox
