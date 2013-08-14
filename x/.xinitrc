#!/bin/sh

# .xinitrc (~/.xinitrc)

# Load .Xresources
xrdb -merge $HOME/.Xresources

# Set `feh` to change the wallpaper
sh $HOME/.fehbg

# Disable the touchpad when typing
syndaemon -d &

# Set `unclutter` to hide the cursor after a second of inactivity
unclutter -root -idle 1 &

# Set `autocutsel` to sync the clipboards
autocutsel &
autocutsel -s PRIMARY &

# Execute the dwm-startup script
exec /usr/bin/dwm-startup
