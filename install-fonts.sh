#!/usr/bin/env bash

cd ~/.local/share/fonts/ || exit

echo "Installing fonts..."
curl -L https://download.jetbrains.com/fonts/JetBrainsMono-2.225.zip > JetBrainsMono.zip
unzip JetBrainsMono.zip -d JetBrainsMono
fc-cache -f -v
rm JetBrainsMono.zip
