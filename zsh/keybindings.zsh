(( $+functions[bind-git-helper] )) || function bind-git-helper() {
  local char
  typeset -A widgets; widgets=( \
    f 'files' \
    t 'tags' \
    b 'branches' \
    h 'history' \
    r 'remotes' \
  )
  for key command in ${(@kv)widgets}; do
    eval "fzf-git-$command-widget() { local result=\$(git_$command | join-lines); zle reset-prompt; LBUFFER+=\$result }"
    eval "zle -N fzf-git-$command-widget"
    eval "bindkey -e '^g^$key' fzf-git-$command-widget"
  done
}

bind-git-helper

bindkey -e "^a" beginning-of-line
bindkey -e "^e" end-of-line
bindkey -e "^f" forward-char
bindkey -e "^b" backward-char
bindkey -e "^k" kill-line
bindkey -e "^d" delete-char
bindkey -e "^p" history-search-backward
bindkey -e "^n" history-search-forward
bindkey -e "^y" accept-and-hold
bindkey -e "^w" backward-kill-word
bindkey -e "^u" backward-kill-line
bindkey -e
