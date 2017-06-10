# Dotfiles

Welcome to my `~/`.

## System

[Solus](https://solus-project.com/)

## Setup

``` sh
sudo eopkg update-repo
sudo eopkg upgrade

sudo eopkg install -c system.devel
sudo eopkg install git

git clone https://github.com/gummesson/dotfiles.git ~/Code/dotfiles
cd ~/Code/dotfiles && make
```

### Fonts

``` sh
mkdir -p ~/.fonts/truetype
mv <directory> ~/.fonts/truetype/
fc-cache -fv
```

### gnome-terminal

``` sh
gsettings set org.gnome.desktop.interface cursor-blink false
```

### offlineimap

``` sh
make build
sudo python setup.py install
```

### goobook

``` sh
goobook authenticate
```
