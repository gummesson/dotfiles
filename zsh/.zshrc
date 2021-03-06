# -- .zshrc -------------------------------------------------------- {{{
#
# -- Sources
# -- History
# -- Keys
# -- Options
# -- Completions
# -- Miscellaneous
#
# }}}

# -- Sources ------------------------------------------------------- {{{

source ~/.theme.sh
source ~/.aliases
source ~/.exports
source ~/.prompt
source ~/.config/z/z.sh
source ~/.config/k/k.sh

# }}}

# -- Options ------------------------------------------------------- {{{

unsetopt menu_complete
unsetopt flowcontrol

setopt auto_menu
setopt complete_aliases
setopt complete_in_word
setopt always_to_end
setopt extended_glob
setopt multios
setopt cdablevarS
setopt correct
setopt no_correctall
setopt prompt_subst

# }}}

# -- History ------------------------------------------------------- {{{

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history

# }}}

# -- Keys ---------------------------------------------------------- {{{

bindkey -v
bindkey '^?' backward-delete-char  # Del
bindkey '^[[3~' delete-char        # Backspace
bindkey '^[3;5~' delete-char
bindkey '\e[3~' delete-char

# }}}

# -- Completions --------------------------------------------------- {{{

zmodload -i zsh/complist

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' insert-tab pending
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories
cdpath=(.)
fpath=(~/.config/zsh-completions/src $fpath)

autoload -Uz compinit && compinit

# }}}

# -- Miscellaneous ------------------------------------------------- {{{

autoload -U url-quote-magic
zle -N self-insert url-quote-magic

# }}}

# vim:foldmethod=marker
