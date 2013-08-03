# custom.zsh (~.oh-my-zsh/custom/custom.zsh)

# Editor
export EDITOR="gvim"

# Z
source ~/.tools/z/z.sh

# Ranger
alias rng="ranger"

# Reload .zshrc
alias zreload="source ~/.zshrc"

# Find all symlinks in the current directory
alias symlinks="find . -type l"

# Set backlight (for dwm)
backlight() {
  xrandr --output LVDS1 --set BACKLIGHT $1
}
