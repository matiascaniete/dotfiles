## Install

```sh
cd ~ && git clone git@github.com:matiascaniete/dotfiles.git && cd dotfiles
```

## Activate configs

```sh
cd ~/dotfiles
stow <module>
```

Available modules:

- alacritty
- neofetch
- nvim
- ranger
- shell
- tmux

## Bootstrap shell configs

Include this line in ~/.zshrc

```sh
source ~/.zsh_custom
```
