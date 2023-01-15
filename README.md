# Readme

## Clone the repo

```sh
cd ~ && git clone git@github.com:matiascaniete/dotfiles.git && cd dotfiles
```

## Install dependencies

```sh
./dotfiles install-dependencies
```

## Install configs

```sh
./dotfiles install-configs
```

### Install concrete config

```sh
./dotfiles install-config [app]
```

## Include shell configs

> Include this line in ~/.config/zsh/.zshrc

```sh
. $HOME/.config/zsh/zshconf
```

> Include this line in ~/.zshenv

```sh
. $HOME/.config/zsh/exports
```

## Include X11 Server config

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
./dotfiles install-fonts
```

> Based on [https://www.jetbrains.com/lp/mono/#how-to-install](https://www.jetbrains.com/lp/mono/#how-to-install)

## Adopting configs

```sh
./dotfiles adopt-config [package]
```

> Based on https://apiumhub.com/tech-blog-barcelona/managing-dotfiles-with-stow/
