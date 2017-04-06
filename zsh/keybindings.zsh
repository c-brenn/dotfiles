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
    eval "bindkey '^g^$key' fzf-git-$command-widget"
  done
}

bind-git-helper

bindkey "^a" beginning-of-line
bindkey "^e" end-of-line
bindkey "^f" forward-char
bindkey "^b" backward-char
bindkey "^k" kill-line
bindkey "^d" delete-char
bindkey "^p" history-search-backward
bindkey "^n" history-search-forward
bindkey "^y" accept-and-hold
bindkey "^w" backward-kill-word
bindkey "^u" backward-kill-line
