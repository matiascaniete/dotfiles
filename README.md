# Dotfiles

## Install dotfiles command

```sh
git clone git@github.com:matiascaniete/dotfiles.git ~/myapps/dotfiles \
    && ln -s ~/myapps/dotfiles/bin/dotfiles ~/.local/bin
```

### Configure dotfiles command

```sh
# ~/.config/zsh/.zshrc

. $HOME/.config/zsh/zshconf

eval "$(dotfiles init)"
```

```sh
# ~/.zshenv

. $HOME/.config/zsh/exports
```

```sh
# ~/.xinitrc

source ~/.custom_xinitrc
```

## dependencies

### List dependencies

```sh
dotfiles dependencies List
```

### Install apps dependencies

```sh
dotfiles dependencies install [app1] [app2] ... [appN]
```

## Configs

### List Configs

```sh
dotfiles config list
```

### Install a config or configs

```sh
dotfiles config install [config1] [config2] ... [configN]
```

### List adoptable configs

```sh
dotfiles config adopt-list
```

### Adopting configs

```sh
dotfiles config adopt [package]
```

> Based on https://apiumhub.com/tech-blog-barcelona/managing-dotfiles-with-stow/

## Fonts

### Install JetBrains fonts

```sh
dotfiles fonts install
```

> Based on
> [https://www.jetbrains.com/lp/mono/#how-to-install](https://www.jetbrains.com/lp/mono/#how-to-install)
