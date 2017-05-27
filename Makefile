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
DOTS = ${BASE}/Code/dotfiles

.PHONY: system npm gem go packages sources install \
        update-system update-sources update \
        shell folders files link

all: install link

# }}}

# -- Install ------------------------------------------------------- {{{

system:
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
	@sudo eopkg install youtube-dl
	@sudo eopkg install xbacklight
	@sudo eopkg install htop
	@sudo eopkg install ranger
	@sudo eopkg install scrot
	@sudo eopkg install feh
	@sudo eopkg install w3m
	@sudo eopkg install redshift
	@sudo eopkg install nautilus-dropbox

npm:
	@npm config set prefix ~/.local
	@npm install -g npm-check-updates
	@npm install -g dependency-check
	@npm install -g internal-ip
	@npm install -g irish-pub
	@npm install -g standard
	@npm install -g elm

gem:
	@gem install bundler --user-install
	@gem install rubocop --user-install

go:
	@go get -u -v github.com/svent/sift

packages: gem npm go

sources:
	@git clone https://github.com/romainl/ctags-patterns-for-javascript.git ${CONF}/ctags-patterns-for-javascript
	@git clone https://github.com/chriskempson/base16-shell.git ${CONF}/base16-shell
	@git clone https://github.com/zsh-users/zsh-completions.git ${CONF}/zsh-completions
	@git clone https://github.com/rupa/z.git ${CONF}/z

install: system packages sources

# }}}

# -- Update -------------------------------------------------------- {{{

update-system:
	@sudo eopkg update-repo
	@sudo eopkg upgrade

update-sources:
	@cd ${CONF}/ctags-patterns-for-javascript && git pull
	@cd ${CONF}/base16-shell && git pull
	@cd ${CONF}/zsh-completions && git pull
	@cd ${CONF}/z && git pull

update: update-system update-sources

# }}}

# -- Link ---------------------------------------------------------- {{{

shell:
	@sudo usermod -s /bin/zsh ${USER}

folders:
	@mkdir -vp ${BASE}/.local/bin
	@mkdir -vp ${BASE}/.bundle
	@mkdir -vp ${BASE}/.w3m

files:
	@ln -vsf ${DOTS}/ack/.ackrc ${BASE}/.ackrc
	@ln -vsf ${DOTS}/bin/* ${BASE}/.local/bin
	@ln -vsf ${DOTS}/ctags/.ctags ${BASE}/.ctags
	@ln -vsf ${DOTS}/editorconfig/.editorconfig ${BASE}/.editorconfig
	@ln -vsf ${DOTS}/git/.gitconfig ${BASE}/.gitconfig
	@ln -vsf ${DOTS}/git/.gitexclude ${BASE}/.gitexclude
	@ln -vsf ${DOTS}/nodejs/.tern-config ${BASE}/.tern-config
	@ln -vsf ${DOTS}/ruby/.bundle/config ${BASE}/.bundle/config
	@ln -vsf ${DOTS}/ruby/.gemrc ${BASE}/.gemrc
	@ln -vsf ${DOTS}/sift/.sift.conf ${BASE}/.sift.conf
	@ln -vsf ${DOTS}/tmux/.tmux.conf ${BASE}/.tmux.conf
	@ln -vsf ${DOTS}/w3m/config ${BASE}/.w3m/config
	@ln -vsf ${DOTS}/w3m/keymap ${BASE}/.w3m/keymap
	@ln -vsf ${DOTS}/youtube-dl/youtube-dl.conf ${CONF}/youtube-dl.conf
	@ln -vsf ${DOTS}/zsh/.aliases ${BASE}/.aliases
	@ln -vsf ${DOTS}/zsh/.exports ${BASE}/.exports
	@ln -vsf ${DOTS}/zsh/.prompt ${BASE}/.prompt
	@ln -vsf ${DOTS}/zsh/.zshrc ${BASE}/.zshrc

link: shell folders files

# }}}

# vim:foldmethod=marker
