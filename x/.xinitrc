#!/usr/bin/env bash

# .xinitrc (~/.xinitrc)

# Load .Xresources
xrdb -merge $HOME/.Xresources

# Set `feh` to change the wallpaper
source $HOME/.fehbg

# Set `unclutter` to hide the cursor after a second of inactivity
unclutter -root -idle 1 &

# Set `autocutsel` to sync the clipboards
autocutsel &
autocutsel -s PRIMARY &

# Execute the dwm-startup script
dwm-startup
