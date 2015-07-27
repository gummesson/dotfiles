# -- .bashrc ------------------------------------------------------- {{{
#
# -- Sources
#
# }}}

# -- Sources ------------------------------------------------------- {{{

for file in ~/.{aliases,exports,prompt}; do
  if [[ -r "$file" ]]; then
    source "$file"
  fi
done; unset file

if [[ -r ~/.dircolors ]]; then
  eval "$(dircolors ~/.dircolors)"
fi

# }}}

# vim:foldmethod=marker
