#!/bin/zsh

# .zlogin (~/.zlogin)

if [[ -z "$DISPLAY" ]] && [[ $(tty) == /dev/tty1 ]]; then
  exec startx
fi
