#!/bin/sh

# -- .xinitrc ------------------------------------------------------ {{{

# Load `.Xresources`
xrdb -merge $HOME/.Xresources

# Set the brightness of the screen
xbacklight -set 40 &

# Hide the cursor after a second of inactivity
unclutter -root -idle 1 &

# Sync clipboards
autocutsel -fork &
autocutsel -selection PRIMARY -fork &

# Start the `urxvt` daemon
urxvtd --quiet --fork --opendisplay &

# Bind special keys
xbindkeys

# Start `subtle`
exec subtle

# }}}

# vim:foldmethod=marker
