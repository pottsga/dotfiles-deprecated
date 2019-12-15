if ! [[ -d ~/.oh-my-zsh ]] then
  echo "oh-my-zsh is required. Install it at https://ohmyz.sh"
fi

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git,
  osx,
  vim
)

source $ZSH/oh-my-zsh.sh

# User configuration
#
export EDITOR='vim'

alias cp="cp -a" # when copying, copy directories too
alias mkdir="mkdir -pv" # create intermediate directories as needed verbosely
alias ssh="ssh -Y" # enable X-window forwarding by default
