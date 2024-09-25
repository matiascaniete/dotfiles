#! /bin/env bash

FONTS_URL=https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/JetBrainsMono.zip
FONTS_DIR=~/.local/share/fonts/

_install() {
    echo "Installing fonts..." | echo-header

    mkdir -p "$FONTS_DIR"
    cd "$FONTS_DIR" || exit

    curl -L "$FONTS_URL" >JetBrainsMono.zip
    unzip JetBrainsMono.zip -d JetBrainsMono
    fc-cache -f -v
    rm JetBrainsMono.zip
}
