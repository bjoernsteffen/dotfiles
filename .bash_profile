export PS1="\[\033[1;34m\]\W$\[\033[0m\] "
export PS2="\[\033[1;34m\]>\[\033[0m\] "

export GNUTERM="aqua"
export LC_ALL="en_US.UTF-8"
export EDITOR="emacs"
# export LC_ALL="en_US.ISO8859-1"
# export LC_CTYPE="ISO8859-1"

export PATH=/opt/subversion/bin:/usr/local/texlive/texmf-local/bin:~/.subversion/bin:~/.bin:$PATH

export LSCOLORS="Gxfxcxdxbxegedabagacdx"
alias ls="ls -FG"
alias ll="ls -lh"

export BIBTOOLRCS="/Users/Bjoern/.bibtoolrcs"

# Bash programs and functions
function cs() {
    cd "$*"
    ls
}

# Subversion and Git completions
source .subversion/svn_bash_completion
source .git-completion.bash

# Subversion and Git status in prompt
source .vcs-prompt.bash
source /usr/local/Cellar/cdargs/1.35/contrib/cdargs-bash.sh
