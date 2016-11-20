# -- Makefile ------------------------------------------------------ {{{
#
# -- Setup
# -- Install
# -- Link
# -- Builds
# -- Packages
#
# }}}

# -- Setup --------------------------------------------------------- {{{

USER = /home/ellen
CONF = ${USER}/.config
GIT  = ${USER}/Git
DOT  = ${GIT}/dotfiles
BIN  = ${USER}/.local/bin
SRC  = ${USER}/.local/src

.PHONY: all base environment tools applications games graphical install \
	shell folders files permissions link \
	frankenwm colors editor chat builds \
	gems npm pip cabal packages

all: install link builds packages

# }}}

# -- Install ------------------------------------------------------- {{{

base:
	@yaourt -Sa rxvt-unicode
	@yaourt -Sa urxvt-fullscreen
	@yaourt -Sa urxvt-font-size-git
	@yaourt -Sa termite
	@yaourt -Sa zsh
	@yaourt -Sa zsh-completions
	@yaourt -Sa libxcb
	@yaourt -Sa xcb-util
	@yaourt -Sa xcb-util-wm
	@yaourt -Sa xcb-util-keysyms

environment:
	@yaourt -Sa python
	@yaourt -Sa python-pip
	@yaourt -Sa python2
	@yaourt -Sa python2-pip
	@yaourt -Sa ruby
	@yaourt -Sa nodejs
	@yaourt -Sa npm
	@yaourt -Sa nvm
	@yaourt -Sa ghc
	@yaourt -Sa cabal-install
	@yaourt -Sa haddock
	@yaourt -Sa happy
	@yaourt -Sa alex
	@yaourt -Sa texlive-core
	@yaourt -Sa texlive-latexextra
	@yaourt -Sa texlive-fontsextra

tools:
	@yaourt -Sa unclutter
	@yaourt -Sa htop
	@yaourt -Sa acpi
	@yaourt -Sa tlp
	@yaourt -Sa xorg-xbacklight
	@yaourt -Sa light
	@yaourt -Sa xbindkeys
	@yaourt -Sa xclip
	@yaourt -Sa xdotool
	@yaourt -Sa wmctrl
	@yaourt -Sa autocutsel
	@yaourt -Sa scrot
	@yaourt -Sa curl
	@yaourt -Sa tree
	@yaourt -Sa udiskie
	@yaourt -Sa autojump
	@yaourt -Sa ack
	@yaourt -Sa sift
	@yaourt -Sa youtube-dl
	@yaourt -Sa slock
	@yaourt -Sa msmtp
	@yaourt -Sa msmtp-mta
	@yaourt -Sa urlview
	@yaourt -Sa ctags
	@yaourt -Sa entr
	@yaourt -Sa wordnet
	@yaourt -Sa jq
	@yaourt -Sa trickle
	@yaourt -Sa tty-clock
	@yaourt -Sa calc

applications:
	@yaourt -Sa lemonbar-git-xft
	@yaourt -Sa dmenu-xft
	@yaourt -Sa dunst
	@yaourt -Sa libnotify
	@yaourt -Sa gvim
	@yaourt -Sa neovim
	@yaourt -Sa tmux
	@yaourt -Sa google-chrome-stable
	@yaourt -Sa w3m
	@yaourt -Sa surfraw
	@yaourt -Sa dropbox
	@yaourt -Sa dropbox-cli
	@yaourt -Sa irssi
	@yaourt -Sa mpv
	@yaourt -Sa mopidy
	@yaourt -Sa mopidy-spotify
	@yaourt -Sa mopidy-notifier-git
	@yaourt -Sa ncmpcpp
	@yaourt -Sa feh
	@yaourt -Sa zathura
	@yaourt -Sa zathura-pdf-mupdf
	@yaourt -Sa ranger
	@yaourt -Sa pcmanfm
	@yaourt -Sa mutt
	@yaourt -Sa goobook-git
	@yaourt -Sa offlineimap
	@yaourt -Sa tig
	@yaourt -Sa feednix
	@yaourt -Sa rtorrent
	@yaourt -Sa rtv
	@yaourt -Sa pinta
	@yaourt -Sa graphviz

games:
	@yaourt -Sa bastet
	@yaourt -Sa myman

graphical:
	@yaourt -Sa ttf-droid
	@yaourt -Sa ttf-liberation
	@yaourt -Sa ttf-dejavu
	@yaourt -Sa ttf-inconsolata
	@yaourt -Sa ttf-fira-mono
	@yaourt -Sa ttf-fira-sans
	@yaourt -Sa ttf-fantasque-sans
	@yaourt -Sa ttf-mononoki
	@yaourt -Sa ttf-input
	@yaourt -Sa ttf-anonymous-pro
	@yaourt -Sa terminus-font
	@yaourt -Sa ttf-ms-fonts
	@yaourt -Sa gtk-theme-bsm-simple
	@yaourt -Sa faenza-icon-theme

install: base environment tools applications graphical

# }}}

# -- Link ---------------------------------------------------------- {{{

shell:
	@chsh -s /usr/bin/zsh

folders:
	@mkdir -vp ${USER}/Downloads
	@mkdir -vp ${USER}/Documents
	@mkdir -vp ${USER}/Pictures/Screenshots
	@mkdir -vp ${CONF}/dunst
	@mkdir -vp ${USER}/.bundle
	@mkdir -vp ${USER}/.irssi/scripts/autorun
	@mkdir -vp ${USER}/.local/{bin,src}
	@mkdir -vp ${USER}/.nano
	@mkdir -vp ${USER}/.ncmpcpp
	@mkdir -vp ${USER}/.mutt/{certificates,accounts,cache/{bodies,headers}}
	@mkdir -vp ${USER}/.mail/Gmail
	@mkdir -vp ${USER}/.rtorrent/{session,watch}
	@mkdir -vp ${USER}/.w3m
	@mkdir -vp ${CONF}/termite
	@mkdir -vp ${CONF}/zathura

files:
	@ln -vsf ${DOT}/ack/.ackrc ${USER}/.ackrc
	@ln -vsf ${DOT}/bin/* ${USER}/.local/bin
	@ln -vsf ${DOT}/ctags/.ctags ${USER}/.ctags
	@ln -vsf ${DOT}/dunst/dunstrc ${CONF}/dunst/dunstrc
	@ln -vsf ${DOT}/editorconfig/.editorconfig ${USER}/.editorconfig
	@ln -vsf ${DOT}/git/.gitconfig ${USER}/.gitconfig
	@ln -vsf ${DOT}/git/.gitexclude ${USER}/.gitexclude
	@ln -vsf ${DOT}/gtk/.gtkrc-2.0 ${USER}/.gtkrc-2.0
	@ln -vsf ${DOT}/msmtp/.msmtprc ${USER}/.msmtprc
	@ln -vsf ${DOT}/mutt/.muttrc ${USER}/.muttrc
	@ln -vsf ${DOT}/mutt/accounts/* ${USER}/.mutt/accounts
	@ln -vsf ${DOT}/mutt/colors.muttrc ${USER}/.mutt/colors.muttrc
	@ln -vsf ${DOT}/mutt/mailcap ${USER}/.mutt/mailcap
	@ln -vsf ${DOT}/offlineimap/.offlineimaprc ${USER}/.offlineimaprc
	@ln -vsf ${DOT}/offlineimap/offlineimap.py ${USER}/.mutt/offlineimap.py
	@ln -vsf ${DOT}/nano/.nanorc ${USER}/.nanorc
	@ln -vsf ${DOT}/ncmpcpp/config ${USER}/.ncmpcpp/config
	@ln -vsf ${DOT}/ncmpcpp/keys ${USER}/.ncmpcpp/keys
	@ln -vsf ${DOT}/nano/syntax/* ${USER}/.nano
	@ln -vsf ${DOT}/nodejs/.jshintrc ${USER}/.jshintrc
	@ln -vsf ${DOT}/nodejs/.eslintrc.json ${USER}/.eslintrc.json
	@ln -vsf ${DOT}/nodejs/.tern-config ${USER}/.tern-config
	@ln -vsf ${DOT}/rainbowstream/.rainbow_config.json ${USER}/.rainbow_config.json
	@ln -vsf ${DOT}/rtorrent/.rtorrent.rc ${USER}/.rtorrent.rc
	@ln -vsf ${DOT}/ruby/.gemrc ${USER}/.gemrc
	@ln -vsf ${DOT}/ruby/.bundle/config ${USER}/.bundle/config
	@ln -vsf ${DOT}/sift/.sift.conf ${USER}/.sift.conf
	@ln -vsf ${DOT}/surfraw/.surfraw.conf ${USER}/.surfraw.conf
	@ln -vsf ${DOT}/tig/.tigrc ${USER}/.tigrc
	@ln -vsf ${DOT}/termite/config ${CONF}/termite/config
	@ln -vsf ${DOT}/tmux/.tmux.conf ${USER}/.tmux.conf
	@ln -vsf ${DOT}/urlview/.urlview ${USER}/.urlview
	@ln -vsf ${DOT}/w3m/config ${USER}/.w3m/config
	@ln -vsf ${DOT}/w3m/keymap ${USER}/.w3m/keymap
	@ln -vsf ${DOT}/x/.xinitrc ${USER}/.xinitrc
	@ln -vsf ${DOT}/x/.Xresources ${USER}/.Xresources
	@ln -vsf ${DOT}/x/.xbindkeysrc ${USER}/.xbindkeysrc
	@ln -vsf ${DOT}/yaourt/.yaourtrc ${USER}/.yaourtrc
	@ln -vsf ${DOT}/youtube-dl/youtube-dl.conf ${CONF}/youtube-dl.conf
	@ln -vsf ${DOT}/zathura/zathurarc ${CONF}/zathura/zathurarc
	@ln -vsf ${DOT}/zsh/.zshrc ${USER}/.zshrc
	@ln -vsf ${DOT}/zsh/.zprofile ${USER}/.zprofile
	@ln -vsf ${DOT}/zsh/.zprompt ${USER}/.zprompt
	@ln -vsf ${DOT}/sh/.aliases ${USER}/.aliases
	@ln -vsf ${DOT}/sh/.exports ${USER}/.exports
	@ln -vsf ${DOT}/sh/.dircolors ${USER}/.dircolors
	@ln -vsf ${DOT}/sh/.bashrc ${USER}/.bashrc
	@ln -vsf ${DOT}/sh/.inputrc ${USER}/.inputrc
	@ln -vsf ${DOT}/sh/.prompt ${USER}/.prompt

permissions:
	@chmod 600 ${USER}/.msmtprc
	@chmod 600 ${USER}/.muttrc

link: shell folders files permissions

# }}}

# -- Builds -------------------------------------------------------- {{{

frankenwm:
	@git clone https://github.com/sulami/FrankenWM ${SRC}/frankenwm
	@./frankenwm/scripts/install.sh

colors:
	@git clone https://github.com/chriskempson/base16-xresources ${SRC}/base16-xresources
	@ln -vsf ${DOT}/x/colors/duotone-darksea.xresources ${USER}/.xcolors

editor:
	@git clone https://github.com/gummesson/vimfiles.git ${GIT}/vimfiles
	@cd ${GIT}/vimfiles && ./scripts/install.sh
	@vim +PlugInstall +qall

chat:
	@./irssi/scripts/install.sh

builds: frankenwm colors editor chat

# }}}

# -- Packages ------------------------------------------------------ {{{

gems:
	@gem install bundler --user-install

npm:
	@npm config set prefix ~/.local
	@npm install -g npm-check-updates
	@npm install -g dependency-check
	@npm install -g eslint
	@npm install -g eslint-config-standard
	@npm install -g eslint-plugin-standard
	@npm install -g eslint-plugin-promise
	@npm install -g internal-ip
	@npm install -g irish-pub
	@npm install -g elm

pip:
	@pip install rainbowstream --user

cabal:
	@cabal update
	@cabal install pandoc

packages: gems npm pip cabal

# }}}

# vim:foldmethod=marker
