#!/usr/bin/env sh

# -- .zprofile ----------------------------------------------------- {{{

if [[ -z "$DISPLAY" ]] && [[ $(tty) == /dev/tty1 ]]; then
  exec startx
fi

# }}}

# vim:foldmethod=marker
