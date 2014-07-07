# -- .bashrc ------------------------------------------------------- {{{
#
# -- Sources
#
# }}}

# -- Sources ------------------------------------------------------- {{{

for file in ~/.{aliases,env,functions,prompt}; do
  if [[ -r "$file" ]]; then
    source "$file"
  fi
done; unset file

if [[ -r ~/.dir_colors ]]; then
  eval "$(dircolors ~/.dir_colors)"
fi

# }}}

# vim:foldmethod=marker
