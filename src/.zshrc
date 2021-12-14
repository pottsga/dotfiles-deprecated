if ! [[ -d ~/.oh-my-zsh ]] then
  echo "oh-my-zsh is required. Install it at https://ohmyz.sh"
fi

# Environment variables
# export PATH="$PATH:$HOME/drivers:$HOME/bin:$HOME/lib" # User configuration
# Oracle drivers
# export PATH="$PATH:$HOME/lib/instantclient_19_8"
# export PATH="$PATH:$HOME/lib/instantclient_19_8/" # Instantclient
export ZSH=$HOME/.oh-my-zsh # Path to your oh-my-zsh installation.
# export EDITOR='nvim'
export EDITOR='nvim'

export PATH="$PATH:$HOME/bin" # local executable scripts


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
  git
  macos
)

source $ZSH/oh-my-zsh.sh

# Aliases
alias ssh="ssh -Y" # enable X-window forwarding by default
alias mkdir="mkdir -pv" # create intermediate directories as needed verbosely
alias ls="ls --color"
alias ll="ls --color-GFhal"
alias vim="nvim"
alias mv="mv -v" # tell me what you mean
alias cp="cp -v"
alias rm="rm -v"
alias emacs="emacs -nw"

# Most of the time, apps are still written for Intel in mind. Use that by default. mbrew is there to install
# Apple silicon-based apps though
# To install brew for x86_64:
#   arch -x86_64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
# To install brew for arm64:
#   arch -arm64e /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
alias brew='arch -x86_64 /usr/local/bin/brew'
alias mbrew='arch -arm64e /opt/homebrew/bin/brew'

# export PROMPT="%F{red}%n%f %~
# > "

# Fix a python virtual environment issue per https://vi.stackexchange.com/questions/7644/use-vim-with-virtualenv/7654#7654
if [[ -n $VIRTUAL_ENV && -e "${VIRTUAL_ENV}/bin/activate" ]]; then
  source "${VIRTUAL_ENV}/bin/activate"
fi

# # Allow the root user access to the currently running xwindows server.
# #
# # https://pottsga.com/posts/02-03-2021/cheatsheet.html
# xhost +local:
