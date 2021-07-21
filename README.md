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

## Install JetBrains font

> https://www.jetbrains.com/lp/mono/#how-to-install
