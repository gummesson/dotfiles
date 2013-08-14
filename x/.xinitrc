#!/usr/bin/env bash

# .xinitrc (~/.xinitrc)

# Load .Xresources
xrdb -merge $HOME/.Xresources

# Set `feh` to change the wallpaper
source $HOME/.fehbg

# Disable the touchpad when typing
syndaemon -d &

# Set `unclutter` to hide the cursor after a second of inactivity
unclutter -root -idle 1 &

# Set `autocutsel` to sync the clipboards
autocutsel &
autocutsel -s PRIMARY &

# Execute the dwm-startup script
dwm-startup
