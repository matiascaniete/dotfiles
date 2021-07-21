## Install

```sh
cd ~ && git clone git@github.com:matiascaniete/dotfiles.git && cd dotfiles
```

## Activate configs

```sh
cd ~/dotfiles
stow alacritty neofetch nvim ranger shell tmux

nvim -c PlugInstall
```

## Bootstrap shell configs

Include this line in ~/.zshrc

```sh
source ~/.zsh_custom
```

## Install VimPlug plugin
```sh
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```


## Install JetBrains fonts

```sh
bash ./install-fonts.sh
```

> Based on https://www.jetbrains.com/lp/mono/#how-to-install
