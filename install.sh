#!/usr/bin/env bash

# Installs configs
stow -vt ~ \
    alacritty \
    bat \
    i3 \
    neofetch \
    nvim \
    qtile \
    ranger \
    rofi \
    shell \
    sxhkd \
    tmux

# Installs scripts
sudo stow -vt /usr/local/bin scripts
