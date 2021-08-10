#!/usr/bin/env bash

cd ~/.local/share/fonts/ || exit

echo "Installing fonts..."

url=https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip
# url=https://download.jetbrains.com/fonts/JetBrainsMono-2.225.zip

curl -L $url > JetBrainsMono.zip
unzip JetBrainsMono.zip -d JetBrainsMono
fc-cache -f -v
rm JetBrainsMono.zip
