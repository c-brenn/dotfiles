ROOT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

all:
	@printf "Usage: make install\n\n"
	@printf "Description: \n"
	@printf "\tInstalls everything!\n"

install: homebrew brews zplug dotfiles vim iterm tmux

homebrew:
	@printf "Installing Homebrew..."
	/usr/bin/ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brews:
	@printf "Installing formulae from Brewfile..."
	brew tap Homebrew/bundle
	brew bundle

zplug:
	chsh -s /bin/zsh
	curl -sL --proto-redir -all,https https://zplug.sh/installer | zsh

dotfiles:
	@printf "Linking dotfiles..."
	mkdir -p $(HOME)/.config/git     $(HOME)/.config/nvim
	ln -sf $(ROOT_DIR)/vimrc         $(HOME)/.config/nvim/init.vim
	ln -sf $(ROOT_DIR)/git/config    $(HOME)/.config/git/config
	ln -sf $(ROOT_DIR)/git/ignore    $(HOME)/.config/git/ignore
	ln -sf $(ROOT_DIR)/zsh/zshrc     $(HOME)/.zshrc
	ln -sf $(ROOT_DIR)/zsh/zshenv    $(HOME)/.zshenv
	ln -sf $(ROOT_DIR)/tmux.conf     $(HOME)/.tmux.conf
	touch $(HOME)/.hushlogin

vim:
	@printf "Configuring vim"
	curl -fLo $(HOME)/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	pip3 install neovim
	nvim -c PlugInstall -c quitall

iterm:
	cp $(ROOT_DIR)/terminal/Sauce Code Pro Nerd Font Complete Mono.ttf $(HOME)/Library/Fonts/
	cp -f $(ROOT_DIR)/terminal/com.googlecode.iterm2.plist $(HOME)/Library/Preferences

tmux:
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
