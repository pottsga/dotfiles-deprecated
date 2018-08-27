# dotfiles

## Installation

### vim

#### 1. Remove old configuration files, create new configuration directory

Remove all the old configuration files because we need to start from fresh.

```sh
if [ -d ~/.config/nvim ]; then rm -rf ~/.config/nvim; fi
mkdir ~/.config/nvim
```

#### 2. Move init.vim to ~/.config/nvim/

```sh
mv init.vim ~/.config/nvim/
```

#### 3. Clone Plug.vim to handle plugin management.

```sh
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

#### 4. Start up NVIM

```sh
nvim
```

#### 5. Install plugins

```sh
:PlugInstall
```

#### 6. Done
