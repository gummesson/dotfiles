# -- conf.py ------------------------------------------------------- {{{

# -- Settings --

from canto.extra import *
filters=[show_unread]
link_handler("uzbl \"%u\"")

# -- Colors --

# Defaults
colors[0] = ("default", "default")

# -- Feeds --

source_urls("/home/ellen/.canto/urls")

# }}}

# vim:foldmethod=marker
