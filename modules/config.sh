#! /bin/env bash

_list() {
    find "$ROOT_DIR/configs" -mindepth 1 -maxdepth 1 -type d -printf '%f\n' | sort
}

_install() {
    configs=$*

    for conf in $configs; do
        echo "Installing config [$conf]..." | echo-header

        stow -vt ~ "$conf" -d "$ROOT_DIR/configs"
    done
}

_install-all() {
    _install \
        alacritty \
        bat \
        i3 \
        kitty \
        mpv \
        neofetch \
        nvim \
        qtile \
        ranger \
        rofi \
        starship \
        sxhkd \
        tmux \
        zsh
}

_adopt-list() {
    find ~/.config -mindepth 1 -maxdepth 1 -type d -printf '%f\n' | sort
}

_adopt() {
    configs=$*

    for conf in $configs; do
        echo "Adopting config [$conf]..." | echo-header

        mkdir -p "$ROOT_DIR/configs/$conf"
        stow --adopt --verbose --target ~ "$conf" --dir "$ROOT_DIR/configs/"
    done
}

_edit-list() {
    config_dir="$ROOT_DIR/configs/$1"

    find "$config_dir" -type f
}

_edit() {
    _edit-list "$1" | fzf --preview "bat --color=always {}" | xargs $EDITOR
}
