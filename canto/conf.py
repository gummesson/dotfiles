# -- conf.py ------------------------------------------------------- {{{

# -- Imports --

from canto.extra import *

# -- Settings --

default_rate(60)
default_keep(10)
never_discard("unread")
link_handler("uzbl-browser \"%u\"")

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
