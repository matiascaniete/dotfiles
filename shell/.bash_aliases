#!/usr/bin/env bash

# empty trash
alias et="gio trash --empty"

# select command from history and copy it to clipboard
alias clp="history | cut -d' ' -f7- | tac | fzf --height=40% --no-sort --header='Selecciona el comando para copiar al clipboard' | tee >(xsel -b) | xargs -0 -I '{}' echo 'Comando copiado al clipboard: {}'"

# fail2ban client
alias f2b="sudo fail2ban-client"

# get my public ip
alias mip="curl ifconfig.me"

# open nvim after fzf search
function se() {
    du -a ./ 2>/dev/null | awk '{print $2}' | fzf --preview='([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200' | xargs -r nvim
}

# cheat.sh
function cht() {
    curl "cheat.sh/$1"
}
