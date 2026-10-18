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
    _install_dependency apt-dependencies
    _install_dependency mpv-shaders
    _install_dependency oh-my-tmux
    _install_dependency nnn-plugins
    _install_dependency zsh
    _install_dependency zsh-plugins
    _install_dependency fzf
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

_install_zsh_plugin() { # url [ref]
    local url="$1" ref="${2:-}" name dir branch
    name="$(basename "$url" .git)"
    dir="$ZSH_PLUGINS_PATH/$name"
    if [ -d "$dir/.git" ]; then
        echo "  [update] $name${ref:+ -> $ref}"
        git -C "$dir" fetch --tags --prune --quiet
        if [ -n "$ref" ]; then
            git -C "$dir" checkout --quiet "$ref"
        else
            branch="$(git -C "$dir" symbolic-ref --quiet --short refs/remotes/origin/HEAD 2>/dev/null | sed 's#^origin/##')"
            git -C "$dir" checkout --quiet "${branch:-master}"
            git -C "$dir" pull --ff-only --quiet
        fi
    else
        echo "  [clone]  $name${ref:+ -> $ref}"
        git clone --quiet "$url" "$dir"
        [ -n "$ref" ] && git -C "$dir" checkout --quiet "$ref"
    fi
}

__install-zsh-plugins() {
    mkdir -p "$ZSH_PLUGINS_PATH"
    _install_zsh_plugin https://github.com/Aloxaf/fzf-tab v1.3.0
    _install_zsh_plugin https://github.com/zsh-users/zsh-autosuggestions
    _install_zsh_plugin https://github.com/zsh-users/zsh-completions.git
    _install_zsh_plugin https://github.com/zdharma-continuum/fast-syntax-highlighting
    _install_zsh_plugin https://github.com/zsh-users/zsh-history-substring-search
    _install_zsh_plugin https://github.com/agkozak/zsh-z.git
    _install_zsh_plugin https://github.com/marzocchi/zsh-notify.git
    if [ -d "$HOME/.fzf/.git" ]; then
        echo "  [update] fzf"
        git -C "$HOME/.fzf" pull --ff-only --quiet
    else
        echo "  [clone]  fzf"
        git clone --depth 1 https://github.com/junegunn/fzf.git "$HOME/.fzf"
    fi
}
