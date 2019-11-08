# dotfiles

Greg Potts `pottsga`'s dotfiles.

## Summary

These dotfiles are intended to be cloned into a directory on your machine and then symlinked to the file's intended spots. The directory structure inside of this repository is supposed to mimic the directory structure with respect to `~`. Ex:

```
$ cd ~
$ git clone https://github.com/pottsga/dotfiles
$ ln -s ~/dotfiles/.bashrc ~/.bashrc
```

You also can use the `Makefile` by running `make install` and it will symlink all of the files in this directory to `~`.

In this way, as long as the file structure remains as expected in `~/dotfiles`, then when you `git pull`, every time the files are updated here your dotfiles via symlink are updated too.

## Applications

### vim

These are the configurations for vim

- `.vim/`
- `.vimrc`

### nvim

Nvim is set up to use vim's configuration via sourcing `~/.vimrc` and adding `.vim` to the runtime path.

These are the configurations for nvim

- `.config/nvim/init.vim`

### tmux

Tmux's configurations are:

- `.tmux.conf`

### git

Git's configuration is:

- `.gitconfig`

### bash

Bash's configuration files are:

- `.bash_profile`
- `.bashrc`
