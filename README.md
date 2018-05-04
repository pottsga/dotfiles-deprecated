# dotfiles

## Installation

### vim

#### 1.) Remove any old configuration files that might exist in the setup. We need to start fresh.

```sh
if [-e ~/.vimrc ]; then mv ~/.vimrc ~/.vimrc_bak; fi
if [-e ~/.vim ]; then mv ~/.vim ~/.vim_bak; fi
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle;
```

#### 2.) Start up vim. 

```sh
vim
```

#### 3.) Run :PluginInstall 

```sh
:PluginInstall
```

#### 4.) Done. You should now have a functioning copy of vim with the configuration on ~/.vimrc
