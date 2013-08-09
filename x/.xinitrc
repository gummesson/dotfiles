#!/usr/bin/env bash

# .xinitrc (~/.xinitrc)

# Load .Xresources
xrdb -merge $HOME/.Xresources

# Set `feh` to change the wallpaper
source $HOME/.fehbg

# Set `unclutter` to hide the cursor after a second of inactivity
unclutter -root -idle 1 &

# Execute the dwm-startup script
dwm-startup
