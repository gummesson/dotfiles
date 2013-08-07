#!/usr/bin/env bash

# .xinitrc (~/.xinitrc)

# Load .Xresources
xrdb -merge $HOME/.Xresources

# Set default window manager session
DEFAULT=openbox-session

# Start openbox/dwm
case $1 in
  openbox-session)
    exec openbox-session
  ;;
  dwm)
    exec dwm-startup
  ;;
  *)
    exec $DEFAULT
  ;;
esac
