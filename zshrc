if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
	source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

autoload -Uz promptinit
promptinit
prompt damoekri

export EDITOR=nvim

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
export PATH="$HOME/.exenv/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# fzf honours gitignores and agignores
export FZF_DEFAULT_COMMAND='ag -g ""'

source $HOME/.zsh/aliases
source $HOME/.bin/tmuxinator.zsh

# disable C-s so I can save in vim
stty start undef
stty stop undef
