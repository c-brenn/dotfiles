if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
	source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

autoload -Uz promptinit
promptinit
prompt damoekri

export EDITOR=nvim

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

export PATH="$HOME/.rvm/bin:$PATH" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
