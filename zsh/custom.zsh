#!/bin/zsh

# custom.zsh (~.oh-my-zsh/custom/custom.zsh)

# Term
export TERM="rxvt-unicode"

# Editor
export EDITOR="vim"

# Z
source ~/.tools/z/z.sh

# note.sh
source ~/.tools/note.sh

# Ranger
alias rng="ranger"

# Reload .zshrc
alias zreload="source ~/.zshrc"

# Find all symlinks in the current directory
alias symlinks="find . -type l"

# Set volume
volume() {
  if [ $1 = "up" ]; then
    amixer set PCM 5%+
  elif [ $1 = "down" ]; then
    amixer set PCM 5%-
  elif [ $1 = "toggle" ]; then
    amixer set Master toggle
  else
    amixer set PCM "$1"
  fi
}

# Set CPU frequency scaling governor (conservative/powersave)
governor() {
  echo "$1" | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
}

# Convert Markdown to HTML (with smart quotes and HTML5 markup)
mdtohtml() {
  pandoc -f markdown -t html5 -S "$1" -o "$2"
}
