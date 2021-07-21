#!/usr/bin/env bash

echo "Installing Vim Plug plugin..."

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim +PlugInstall +qall

echo "Installing Oh-my-tmux plugin..."

cd && git clone https://github.com/gpakosz/.tmux.git && ln -s -f .tmux/.tmux.conf
