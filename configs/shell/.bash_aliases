#!/usr/bin/env bash

# fail2ban client
alias f2b="sudo fail2ban-client"

# lastpass
alias lps="lpass-select"

# neovim
alias vf='fzf | xargs "$EDITOR"'
alias v="nvim"

# zsh
alias zzh="zsh-show-keybindings"

# youtube-dl
alias yta="youtube-dl --extract-audio --audio-format mp3"
alias ytv="youtube-dl"

# mount
alias mntp="mkdir ~/Phone && go-mtpfs ~/Phone &"
alias umntp="fusermount -u ~/Phone"

# exa ls
# general use
alias ls='exa'                                                          # ls
alias l='exa -lbF --git'                                                # list, size, type, git
alias ll='exa -lbGF --git'                                             # long list
alias llm='exa -lbGd --git --sort=modified'                            # long list, modified date sort
alias la='exa -lbhHigUmuSa --time-style=long-iso --git --color-scale'  # all list
alias lx='exa -lbhHigUmuSa@ --time-style=long-iso --git --color-scale' # all + extended list

# specialty views
alias lS='exa -1'                                                              # one column, just names
alias lt='exa --tree --level=2'                                         # tree
