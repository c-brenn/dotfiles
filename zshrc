if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
	source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

autoload -Uz promptinit
promptinit
prompt damoekri

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source $HOME/.zsh/aliases

# disable C-s so I can save in vim
stty start undef
stty stop undef
