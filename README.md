# Dotfiles

Welcome to my `~/`.

## Flavor

[Manjaro Minimal Net Edition](http://manjaro.org/)

## Prerequisites

~~~ sh
sudo pacman -S base-devel yaourt git
git clone https://github.com/gummesson/dotfiles.git Git/dotfiles
~~~

### Keyboard

If the `Fn` keys act up, run:

~~~ sh
sudo keyboardctl --set-layout se
~~~

## Installation

`cd` into `Git/dotfiles`, take a look in the `Makefile` and execute at will.

### Minimal

~~~ sh
make --file Minifile zsh
make --file Minifile bash
~~~

The minimal installation will create symlinks for the `bash` or the `zsh` configuration files.

## Setup

### Wifi

Disable `NetworkManager` (and `ModemManager`):

~~~ sh
sudo systemctl stop NetworkManager
sudo systemctl disable NetworkManager
sudo systemctl stop ModemManager
sudo systemctl disable ModemManager
~~~

Enable `netctl`:

~~~ sh
sudo systemctl start netctl.service
sudo systemctl enable netctl.service
~~~

Start `wifi-menu`, generate a profile and start the service with `netctl`:

~~~ sh
sudo netctl start <profile>
sudo netctl enable <profile>
~~~
