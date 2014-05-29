# -- Makefile ------------------------------------------------------ {{{
#
# -- Setup
# -- Install
# -- Link
# -- Misc.
#
# }}}

# -- Setup --------------------------------------------------------- {{{

.PHONY: env wm fonts tools apps extras install folders files link editor shell upgrade clean reboot all

USER = /home/ellen
CONF = $(USER)/.config
GIT  = $(USER)/Git
DOT  = $(GIT)/dotfiles

# }}}

# -- Install ------------------------------------------------------- {{{

env:
	@yaourt -Sa rxvt-unicode
	@yaourt -Sa zsh
	@yaourt -Sa zsh-completions
	@yaourt -Sa ruby
	@yaourt -Sa nodejs
	@yaourt -Sa phantomjs

wm:
	@yaourt -Sa ruby-archive-tar-minitar
	@yaourt -Sa subtle
	@sur install wifi
	@sur install battery
	@sur install clock
	@yaourt -Sa dmenu
	@yaourt -Sa dunst
	@yaourt -Sa feh
	@yaourt -Sa unclutter

fonts:
	@yaourt -Sa ttf-droid
	@yaourt -Sa ttf-liberation
	@yaourt -Sa ttf-dejavu
	@yaourt -Sa adobe-source-code-pro-fonts
	@yaourt -Sa ttf-ubuntu-font-family
	@yaourt -Sa ttf-ms-fonts

tools:
	@yaourt -Sa htop
	@yaourt -Sa acpi
	@yaourt -Sa xorg-xbacklight
	@yaourt -Sa xbindkeys
	@yaourt -Sa xclip
	@yaourt -Sa autocutsel
	@yaourt -Sa scrot
	@yaourt -Sa curl
	@yaourt -Sa tree
	@yaourt -Sa usbmount
	@yaourt -Sa autojump
	@yaourt -Sa ack
	@yaourt -Sa youtube-dl
	@yaourt -Sa slock
	@yaourt -Sa msmtp
	@yaourt -Sa msmtp-mta

apps:
	@yaourt -Sa gvim
	@yaourt -Sa tmux
	@yaourt -Sa uzbl-browser
	@yaourt -Sa w3m
	@yaourt -Sa surfraw
	@yaourt -Sa dropbox
	@yaourt -Sa dropbox-cli
	@yaourt -Sa irssi
	@yaourt -Sa mplayer2
	@yaourt -Sa cmus
	@yaourt -Sa zathura
	@yaourt -Sa zathura-pdf-mupdf
	@yaourt -Sa ranger
	@yaourt -Sa canto
	@yaourt -Sa mutt

extras:
	@yaourt -Sa termite
	@yaourt -Sa dvtm
	@yaourt -Sa pcmanfm
	@yaourt -Sa numix-themes
	@yaourt -Sa numix-icon-theme-git
	@yaourt -Sa numix-circle-icon-theme-git

install: env wm fonts tools apps extras

# }}}

# -- Link ---------------------------------------------------------- {{{

folders:
	@mkdir -vp $(USER)/Downloads
	@mkdir -vp $(USER)/Documents
	@mkdir -vp $(USER)/Pictures/Screenshots
	@mkdir -vp $(USER)/.bin
	@mkdir -vp $(USER)/.canto
	@mkdir -vp $(USER)/.irssi/scripts/autorun
	@mkdir -vp $(USER)/.nano
	@mkdir -vp $(CONF)/dunst
	@mkdir -vp $(CONF)/subtle
	@mkdir -vp $(CONF)/termite
	@mkdir -vp $(CONF)/uzbl
	@mkdir -vp $(USER)/.w3m
	@mkdir -vp $(CONF)/zathura

files:
	@ln -vsf $(DOT)/ack/.ackrc $(USER)/.ackrc
	@ln -vsf $(DOT)/bin/* $(USER)/.bin
	@ln -vsf $(DOT)/canto/conf.py $(USER)/.canto/conf.py
	@ln -vsf $(DOT)/dunst/dunstrc $(CONF)/dunst/dunstrc
	@ln -vsf $(DOT)/feh/.fehbg $(USER)/.fehbg
	@ln -vsf $(DOT)/git/.gitconfig $(USER)/.gitconfig
	@ln -vsf $(DOT)/git/.gitignore $(USER)/.gitignore
	@ln -vsf $(DOT)/gtk/.gtkrc-2.0 $(USER)/.gtkrc-2.0
	@ln -vsf $(DOT)/irssi/scripts/* $(USER)/.irssi/scripts/autorun
	@ln -vsf $(DOT)/nano/.nanorc $(USER)/.nanorc
	@ln -vsf $(DOT)/nano/syntax/* $(USER)/.nano
	@ln -vsf $(DOT)/node/.jshintrc $(USER)/.jshintrc
	@ln -vsf $(DOT)/ruby/.gemrc $(USER)/.gemrc
	@ln -vsf $(DOT)/subtle/subtle.rb $(CONF)/subtle/subtle.rb
	@ln -vsf $(DOT)/surfraw/.surfraw.conf $(USER)/.surfraw.conf
	@ln -vsf $(DOT)/termite/config $(CONF)/termite/config
	@ln -vsf $(DOT)/tmux/.tmux.conf $(USER)/.tmux.conf
	@ln -vsf $(DOT)/uzbl/config $(CONF)/uzbl/config
	@ln -vsf $(DOT)/uzbl/style.css $(CONF)/uzbl/style.css
	@ln -vsf $(DOT)/w3m/config $(USER)/.w3m/config
	@ln -vsf $(DOT)/w3m/keymap $(USER)/.w3m/keymap
	@ln -vsf $(DOT)/x/.xinitrc $(USER)/.xinitrc
	@ln -vsf $(DOT)/x/.Xresources $(USER)/.Xresources
	@ln -vsf $(DOT)/x/.xcolors $(USER)/.xcolors
	@ln -vsf $(DOT)/x/.xbindkeysrc $(USER)/.xbindkeysrc
	@ln -vsf $(DOT)/zathura/zathurarc $(CONF)/zathura/zathurarc
	@ln -vsf $(DOT)/zsh/.zshrc $(USER)/.zshrc
	@ln -vsf $(DOT)/zsh/.zprofile $(USER)/.zprofile
	@ln -vsf $(DOT)/zsh/.zprompt $(USER)/.zprompt
	@ln -vsf $(DOT)/sh/.aliases $(USER)/.aliases
	@ln -vsf $(DOT)/sh/.env $(USER)/.zshenv
	@ln -vsf $(DOT)/sh/.functions $(USER)/.functions
	@ln -vsf $(DOT)/sh/.dir_colors $(USER)/.dir_colors

link: folders files

# }}}

# -- Misc. --------------------------------------------------------- {{{

editor:
	@git clone https://github.com/gummesson/vimfiles.git $(GIT)/vimfiles
	@git clone https://github.com/gmarik/vundle.git $(USER)/.vim/bundle/vundle
	@ln -vsf $(GIT)/vimfiles/.vimrc $(USER)/.vimrc
	@ln -vsf $(GIT)/vimfiles/.gvimrc $(USER)/.gvimrc
	@vim +PluginInstall +qall

shell:
	@chsh -s /usr/bin/zsh

upgrade:
	@yaourt -Syua

clean:
	@yaourt -Qdt

reboot:
	@sudo reboot

all: install link editor shell upgrade clean reboot

# }}}

# vim:foldmethod=marker
