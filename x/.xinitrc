#!/usr/bin/env bash

# .xinitrc (~/.xinitrc)

# Load .Xresources
xrdb -merge $HOME/.Xresources

# Set the default window manager
DEFAULT=openbox-session

# Start `Openbox`/`dwm`
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
