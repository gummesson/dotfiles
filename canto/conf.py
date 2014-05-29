# -- conf.py ------------------------------------------------------- {{{

# -- Imports --

from canto.extra import *

# -- Settings --

link_handler("w3m \"%u\"")

# -- Keybindings --

keys['+'] = set_filter(show_unread)
keys['-'] = set_filter(None)

# -- Colors --

# Defaults
colors[0] = ("default", "default")

# -- Feeds --

source_urls("/home/ellen/.canto/urls")

# }}}

# vim:foldmethod=marker
