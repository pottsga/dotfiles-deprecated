export ORACLE_HOME=/opt/oracle;
export DYLD_LIBRARY_PATH=/opt/oracle/instantclient_12_1;

# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi;

alias ls="ls -GFh"
alias la="ls -al"
alias mkdir="mkdir -pv"

export EDITOR="vim"

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

export PS1="$C_GREEN\u@\h$C_RESET \w \$ "
