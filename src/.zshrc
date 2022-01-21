if ! [[ -d ~/.oh-my-zsh ]] then
  echo "oh-my-zsh is required. Install it at https://ohmyz.sh"
fi

# Environment variables
export ZSH=$HOME/.oh-my-zsh # Path to your oh-my-zsh installation.
export EDITOR='nvim'

# Set up the PATH variable
export PATH=~/.local/bin/:$PATH # for npm's local. To config npm to use this, run `npm config set prefix ~/.local`
export PATH="$PATH:$HOME/bin" # local executable scripts

# Allow for key repeating on VSCode (allows you to repeat keys in vim-mode, even
# though you really should use movements more efficiently instead of repeating keys)
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false


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

# Enable oh-my-zsh.
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
# Apple's M1 silicon-based apps though
# To install brew for x86_64:
#   arch -x86_64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
# To install brew for arm64:
#   arch -arm64e /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
alias brew='arch -x86_64 /usr/local/bin/brew'
alias mbrew='arch -arm64e /opt/homebrew/bin/brew'

# Fix a python virtual environment issue per https://vi.stackexchange.com/questions/7644/use-vim-with-virtualenv/7654#7654
if [[ -n $VIRTUAL_ENV && -e "${VIRTUAL_ENV}/bin/activate" ]]; then
  source "${VIRTUAL_ENV}/bin/activate"
fi