export PS1="\[\033[1;34m\]\W$\[\033[0m\] "
export PS2="\[\033[1;34m\]>\[\033[0m\] "

export GNUTERM="aqua"
export LC_ALL="en_US.UTF-8"
export EDITOR="emacs"
# export LC_ALL="en_US.ISO8859-1"
# export LC_CTYPE="ISO8859-1"

export PATH=/usr/local/bin:$PATH

export LSCOLORS="Gxfxcxdxbxegedabagacdx"
alias ls="ls -FG"
alias ll="ls -lh"

# export BIBTOOLRCS="/Users/Bjoern/.bibtoolrcs"

# Bash programs and functions
function cs() {
    cd "$*"
    ls
}

# Subversion and Git completions
source /usr/local/etc/bash_completion.d/svn-completion.bash
source /usr/local/etc/bash_completion.d/git-completion.bash
source /usr/local/etc/bash_completion.d/git-prompt.sh

# Subversion and Git status in prompt
source .vcs-prompt.bash

function svndiff () { svn diff $@ | colordiff | less -R; }