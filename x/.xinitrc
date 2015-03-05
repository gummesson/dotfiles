#!/usr/bin/env sh

# -- .xinitrc ------------------------------------------------------ {{{

# Load `.Xresources`
xrdb -merge $HOME/.Xresources

# Setup the screen(s)
if (xrandr | grep "VGA1 connected" > /dev/null); then
  # Use a bigger screen if available
  # and turn off the smaller screen
  xrandr --output VGA1 --auto --right-of LVDS1 &
  xrandr --output LVDS1 --off
else
  # Disable the touchpad (when typing)
  # and set the brightness of the screen
  syndaemon -k -i 1 &
  xbacklight -set 40
fi &

# Hide the cursor after a second of inactivity
unclutter -root -idle 1 &

# Sync clipboards
autocutsel -fork &
autocutsel -selection PRIMARY -fork &

# Start automatic mounting
udiskie --automount --notify &

# Start the `urxvt` daemon
urxvtd --quiet --fork --opendisplay &

# Start the `dropbox` daemon
dropbox &

# Bind special keys
xbindkeys

# Set cursor
xsetroot -cursor_name left_ptr

# Set background color
xsetroot -solid "#262626"

# Start `frankenwm`
exec frankenwm

# }}}

# vim:foldmethod=marker
