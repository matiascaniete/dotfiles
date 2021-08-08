#!/usr/bin/env bash

# Installs configs
stow -vt ~ \
    alacritty \
    bat \
    neofetch \
    nvim \
    ranger \
    rofi \
    shell \
    sxhkd \
    tmux

# Installs scripts
sudo stow -vt /usr/local/bin scripts
