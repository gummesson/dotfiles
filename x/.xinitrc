#!/usr/bin/env bash

# .xinitrc (~/.xinitrc)

# Load .Xresources
xrdb -merge $HOME/.Xresources

# Set the brightness of the screen
xbacklight -set 20 &

# Set `unclutter` to hide the cursor after a second of inactivity
unclutter -root -idle 1 &

# Set `autocutsel` to sync the clipboards
autocutsel &
autocutsel -s PRIMARY &

# Set `feh` to change the wallpaper
sh $HOME/.fehbg

# Execute the `dwm-startup` script
exec /usr/bin/dwm-startup
