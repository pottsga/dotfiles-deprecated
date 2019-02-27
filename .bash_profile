# export ORACLE_HOME=/opt/oracle;
# export DYLD_LIBRARY_PATH=/opt/oracle/instantclient_12_1;

# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi;

alias ls="ls -GFh"
alias la="ls -al"

export EDITOR="vim"
