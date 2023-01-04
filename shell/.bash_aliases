#!/usr/bin/env bash

# fail2ban client
alias f2b="sudo fail2ban-client"

# select lastpass password
alias lps="lpass-select"

# selects a file and open it with default editor
alias vf='fzf | xargs "$EDITOR"'

alias v="nvim"

alias zzh="zsh-show-keybindings"
alias yta="youtube-dl --extract-audio --audio-format mp3"
alias ytv="youtube-dl"
alias mntp="mkdir ~/Phone && go-mtpfs ~/Phone &"
alias umntp="fusermount -u ~/Phone"

# open nvim after fzf search with preview
function vfp() {
    fzf --preview='([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200' | xargs -r "$EDITOR"
}
