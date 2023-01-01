# Readme

## Clone the repo

```sh
cd ~ && git clone git@github.com:matiascaniete/dotfiles.git && cd dotfiles
```

## Install configs

```sh
./dotfiles install-configs
```

## Include shell configs

Include this line in ~/.zshrc

```sh
source ~/.custom_zshrc
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
