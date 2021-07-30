## Install

```sh
cd ~ && git clone git@github.com:matiascaniete/dotfiles.git && cd dotfiles
```

## Activate configs

```sh
cd ~/dotfiles
stow alacritty neofetch nvim ranger shell tmux sxhkd
```

## Bootstrap shell configs

Include this line in ~/.zshrc

```sh
source ~/.custom_zshrc
```

## Bootstrap keybindings
Include this line in the ~/.xinitrc
```sh
source ~/.custom_xinitrc
```


## Install plugins

```sh
bash ./install-plugins.sh
```

## Install JetBrains fonts

```sh
bash ./install-fonts.sh
```

> Based on https://www.jetbrains.com/lp/mono/#how-to-install
