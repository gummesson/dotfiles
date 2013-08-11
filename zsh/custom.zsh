#!/bin/sh

# custom.zsh (~.oh-my-zsh/custom/custom.zsh)

# Editor
export EDITOR="gvim"

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

# Set backlight
backlight() {
  xrandr --output LVDS1 --set BACKLIGHT "$1"
}

# Set volume
function volume() {
  if [ $1 = "up" ]; then
    amixer set PCM 10%+
  elif [ $1 = "down" ]; then
    amixer set PCM 10%-
  else
    amixer set PCM toggle && amixer get PCM
  fi
}

# Set CPU frequency scaling governor (conservative/powersave)
function set-cpu-gov() {
  echo "$1" | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
}
