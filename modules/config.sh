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

        mkdir -p "$ROOT_DIR/configs/$conf/.config/$conf"
        #     stow --adopt --verbose --target ~ "$program"
        stow --adopt --verbose --target ~/.config "$conf" --dir "$ROOT_DIR/configs"
    done
}
