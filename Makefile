# -- Makefile ------------------------------------------------------ {{{
#
# -- Setup
# -- Install
# -- Update
# -- Link
#
# }}}

# -- Setup --------------------------------------------------------- {{{

USER = ellen
BASE = /home/${USER}
CONF = ${BASE}/.config
BLDS = ${BASE}/.builds
DOTS = ${BASE}/Code/dotfiles

.PHONY: install-system install-extras install-npm install-gem install-pip install-go install-packages install-sources install-builds install \
        update-system update-packages update-sources update-builds update \
        link-shell link-folders link-files link

all: install link

# }}}

# -- Install ------------------------------------------------------- {{{

install-system:
	@sudo eopkg install zsh
	@sudo eopkg install nodejs
	@sudo eopkg install golang
	@sudo eopkg install ruby
	@sudo eopkg install ruby-devel
	@sudo eopkg install python
	@sudo eopkg install pip
	@sudo eopkg install vim
	@sudo eopkg install tmux
	@sudo eopkg install ctags
	@sudo eopkg install ack
	@sudo eopkg install jq
	@sudo eopkg install scrot
	@sudo eopkg install youtube-dl
	@sudo eopkg install xbacklight
	@sudo eopkg install htop
	@sudo eopkg install ranger
	@sudo eopkg install feh
	@sudo eopkg install zathura
	@sudo eopkg install w3m
	@sudo eopkg install irssi
	@sudo eopkg install msmtp
	@sudo eopkg install mutt
	@sudo eopkg install nautilus-dropbox

install-extras:
	@sudo eopkg install pandoc
	@sudo eopkg install texlive
	@sudo eopkg install texlive-fonts-extra

install-npm:
	@npm config set prefix ~/.local
	@npm install -g npm-check-updates
	@npm install -g dependency-check
	@npm install -g internal-ip
	@npm install -g irish-pub
	@npm install -g standard
	@npm install -g elm

install-gem:
	@gem install bundler --user-install
	@gem install rubocop --user-install

install-pip:
	@pip install goobook --user

install-go:
	@go get -u -v github.com/svent/sift

install-packages: install-npm install-gem install-pip install-go

install-sources:
	@git clone https://github.com/romainl/ctags-patterns-for-javascript.git ${CONF}/ctags-patterns-for-javascript
	@git clone https://github.com/chriskempson/base16-shell.git ${CONF}/base16-shell
	@git clone https://github.com/zsh-users/zsh-completions.git ${CONF}/zsh-completions
	@git clone https://github.com/rupa/z.git ${CONF}/z
	@git clone https://github.com/supercrabtree/k.git ${CONF}/k

install-builds:
	@git clone https://github.com/OfflineIMAP/offlineimap.git ${BLDS}/offlineimap-git
	@cd ${BLDS} && curl -fLO https://surfraw.alioth.debian.org/dist/surfraw-2.2.9.tar.gz
	@cd ${BLDS} && curl -fLO http://entrproject.org/code/entr-3.7.tar.gz

install: install-system install-extras install-packages install-sources install-builds

# }}}

# -- Update -------------------------------------------------------- {{{

update-system:
	@sudo eopkg update-repo
	@sudo eopkg upgrade

update-packages: install-packages

update-sources:
	@cd ${CONF}/ctags-patterns-for-javascript && git pull
	@cd ${CONF}/base16-shell && git pull
	@cd ${CONF}/zsh-completions && git pull
	@cd ${CONF}/z && git pull
	@cd ${CONF}/k && git pull

update-builds:
	@cd ${BLDS}/offlineimap-git && git pull

update: update-system update-packages update-sources update-builds

# }}}

# -- Link ---------------------------------------------------------- {{{

link-shell:
	@sudo usermod -s /bin/zsh ${USER}

link-folders:
	@mkdir -vp ${BASE}/.bundle
	@mkdir -vp ${BASE}/.local/bin
	@mkdir -vp ${BASE}/.mail/Gmail
	@mkdir -vp ${BASE}/.w3m

link-files:
	@ln -vsf ${DOTS}/ack/.ackrc ${BASE}/.ackrc
	@ln -vsf ${DOTS}/bin/* ${BASE}/.local/bin
	@ln -vsf ${DOTS}/ctags/.ctags ${BASE}/.ctags
	@ln -vsf ${DOTS}/editorconfig/.editorconfig ${BASE}/.editorconfig
	@ln -vsf ${DOTS}/git/.gitconfig ${BASE}/.gitconfig
	@ln -vsf ${DOTS}/git/.gitexclude ${BASE}/.gitexclude
	@ln -vsf ${DOTS}/irssi/default.theme ${BASE}/.irssi/default.theme
	@ln -vsf ${DOTS}/msmtp/.msmtprc ${BASE}/.msmtprc
	@ln -vsf ${DOTS}/mutt/.muttrc ${BASE}/.muttrc
	@ln -vsf ${DOTS}/mutt/colors ${BASE}/.mutt/colors
	@ln -vsf ${DOTS}/mutt/gmail ${BASE}/.mutt/gmail
	@ln -vsf ${DOTS}/mutt/mailcap ${BASE}/.mutt/mailcap
	@ln -vsf ${DOTS}/nodejs/.tern-config ${BASE}/.tern-config
	@ln -vsf ${DOTS}/offlineimap/.offlineimaprc ${BASE}/.offlineimaprc
	@ln -vsf ${DOTS}/offlineimap/offlineimap.py ${BASE}/.mutt/offlineimap.py
	@ln -vsf ${DOTS}/ruby/.bundle/config ${BASE}/.bundle/config
	@ln -vsf ${DOTS}/ruby/.gemrc ${BASE}/.gemrc
	@ln -vsf ${DOTS}/sift/.sift.conf ${BASE}/.sift.conf
	@ln -vsf ${DOTS}/surfraw/.surfraw.conf ${BASE}/.surfraw.conf
	@ln -vsf ${DOTS}/tmux/.tmux.conf ${BASE}/.tmux.conf
	@ln -vsf ${DOTS}/w3m/config ${BASE}/.w3m/config
	@ln -vsf ${DOTS}/w3m/keymap ${BASE}/.w3m/keymap
	@ln -vsf ${DOTS}/youtube-dl/youtube-dl.conf ${CONF}/youtube-dl.conf
	@ln -vsf ${DOTS}/zathura/zathurarc ${CONF}/zathura/zathurarc
	@ln -vsf ${DOTS}/zsh/.aliases ${BASE}/.aliases
	@ln -vsf ${DOTS}/zsh/.exports ${BASE}/.exports
	@ln -vsf ${DOTS}/zsh/.prompt ${BASE}/.prompt
	@ln -vsf ${DOTS}/zsh/.zshrc ${BASE}/.zshrc

link: link-shell link-folders link-files

# }}}

# vim:foldmethod=marker
