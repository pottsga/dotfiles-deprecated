# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi;

alias ssh="ssh -Y"
alias ls="ls -GFhal"
alias la="ls -al"
alias mkdir="mkdir -pv"
alias 256col="curl -s https://gist.githubusercontent.com/HaleTom/89ffe32783f89f403bba96bd7bcd1263/raw/ | bash"

export EDITOR="nvim"

# Colors
C_BLACK=$(tput setaf 0)
C_RED=$(tput setaf 1)
C_GREEN=$(tput setaf 2)
C_YELLOW=$(tput setaf 3)
C_BLUE=$(tput setaf 4)
C_MAGENTA=$(tput setaf 5)
C_CYAN=$(tput setaf 6)
C_WHITE=$(tput setaf 7)
C_RESET=$(tput sgr0)

# Export the PS1 prompt
#   NOTE: Non-printable characters (the colors above) need to be escaped by the
#   \[ and \] characters otherwise, readline cannot keep track of the cursor
#   position correctly causing the prompt to be overwritten and not act correctly.
#   https://stackoverflow.com/questions/19092488/custom-bash-prompt-is-overwriting-itself
export PS1="\[$C_GREEN\]\u@\h \[$C_RESET\]\w \$ "
