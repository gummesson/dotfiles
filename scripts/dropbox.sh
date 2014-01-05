#!/bin/sh

# Setup

cd $HOME
wget -O - "https://www.dropbox.com/download?plat=lnx.x86" | tar xzf -

mkdir -p $HOME/.tools/dropbox-cli
cd $HOME/.tools/dropbox-cli

wget -O dropbox.py "https://www.dropbox.com/download?dl=packages/dropbox.py"
chmod +x dropbox.py
sudo ln -s $HOME/.tools/dropbox-cli/dropbox.py /usr/bin/dropbox
