#! /usr/bin/env bash

ZSH_PLUGINS_PATH=~/.local/share/zsh-plugins/
OH_MY_TMUX_PATH=~/oh-my-tmux

_list() {
    # list the functions in this file that start with "__install-" and remove the prefix "__install-"

    declare -F | awk '{print $3}' | grep "^__install-" | sed 's/^__install-//g'
}

_install() {
    for dependency in "$@"; do
        _install_dependency "$dependency"
    done
}

_install_dependency() {
    command="$1"
    echo "--- Installing [$command] ---" | echo-header
    {
        echo ""
        eval "__install-$command"
        echo ""
        echo ""
    } | tabbed
}

_install-all() {
    _install-dependency apt-dependencies
    _install-dependency mpv-shaders
    _install-dependency oh-my-tmux
    _install-dependency nnn-plugins
    _install-dependency zsh
    _install-dependency zsh-plugins
    _install-dependency fzf
}

# dependencies

__install-apt-dependencies() {
    sudo apt install -y \
        exa \
        nnn \
        ranger \
        tmux \
        stow \
        lolcat
}

__install-pacman-dependencies() {
    sudo pacman -S \
        alacritty \
        bat \
        exa \
        lolcat \
        mpv \
        nnn \
        ranger \
        starship \
        stow \
        tmux
}

__install-mpv-shaders() {
    cp -vr _data/shaders ~/.config/mpv/
}

__install-oh-my-tmux() {
    git clone https://github.com/gpakosz/.tmux.git "$OH_MY_TMUX_PATH" \
        && ln -s -f "$OH_MY_TMUX_PATH"/.tmux.conf ~/.tmux.conf
}

__install-nnn-plugins() {
    sh -c "$(curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs)"
}

__install-fzf() {
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf \
        && ~/.fzf/install --no-key-bindings --no-completion --no-update-rc
}

__install-zsh() {
    ZSH_TMP_DIR=/tmp/zsh-latest
    git clone git://git.code.sf.net/p/zsh/code $ZSH_TMP_DIR \
        && cd $ZSH_TMP_DIR \
        && ./Util/preconfig \
        && ./configure \
        && make -j4 \
        && sudo make install
}

__install-zsh-plugins() {
    mkdir -p $ZSH_PLUGINS_PATH
    cd $ZSH_PLUGINS_PATH || return 1
    git clone https://github.com/Aloxaf/fzf-tab
    git clone https://github.com/zsh-users/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-completions.git
    git clone https://github.com/zdharma-continuum/fast-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-history-substring-search
    git clone https://github.com/agkozak/zsh-z.git
    git clone https://github.com/marzocchi/zsh-notify.git
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
}
