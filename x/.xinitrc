#!/usr/bin/env sh

# -- .xinitrc ------------------------------------------------------ {{{

# Load `.Xresources`
xrdb -merge $HOME/.Xresources

# Setup the screen(s)
if (xrandr | grep "VGA1 connected" > /dev/null); then
  xrandr --output VGA1 --auto --right-of LVDS1 &  # Use a bigger screen if available...
  xrandr --output LVDS1 --off                     # ...and turn of the smaller screen
else
  syndaemon -k -i 1 &  # Disable touchpad when typing
  xbacklight -set 40   # Set the brightness of the screen
fi &

# Hide the cursor after a second of inactivity
unclutter -root -idle 1 &

# Sync clipboards
autocutsel -fork &
autocutsel -selection PRIMARY -fork &

# Start automatic mounting
udiskie &

# Start the `urxvt` daemon
urxvtd --quiet --fork --opendisplay &

# Start the `dropbox` daemon
dropboxd &

# Bind special keys
xbindkeys

# Start `dwm`
exec $HOME/.local/bin/dwm-start

# }}}

# vim:foldmethod=marker
