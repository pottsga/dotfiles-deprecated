if ! [[ -d ~/.oh-my-zsh ]] then
  echo "oh-my-zsh is required. Install it at https://ohmyz.sh"
fi

# Environment variables
export PATH="$PATH:$HOME/drivers:$HOME/bin" # User configuration
export ZSH=$HOME/.oh-my-zsh # Path to your oh-my-zsh installation.
export EDITOR='nvim'

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
)

source $ZSH/oh-my-zsh.sh

# Aliases
alias ssh="ssh -Y" # enable X-window forwarding by default
alias mkdir="mkdir -pv" # create intermediate directories as needed verbosely
alias ll="ls -GFhal"
alias vim="nvim"
alias mv="mv -v" # tell me what you mean
alias cp="cp -v"
alias rm="rm -v"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Fix a python virtual environment issue per https://vi.stackexchange.com/questions/7644/use-vim-with-virtualenv/7654#7654
if [[ -n $VIRTUAL_ENV && -e "${VIRTUAL_ENV}/bin/activate" ]]; then
  source "${VIRTUAL_ENV}/bin/activate"
fi

# # Allow the root user access to the currently running xwindows server.
# #
# # https://pottsga.com/posts/02-03-2021/cheatsheet.html
# xhost +local:
