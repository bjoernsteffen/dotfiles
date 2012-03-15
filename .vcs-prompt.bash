#
# Display version control information from svn or git in prompt
#

# Parses Git or SVN info for prompt
function _set_vcs_envar_info {
    VCS_LEADER=""
    VCS_END=""
    VCS_BRANCH=""
    VCS_HEAD=""
    GIT_PS1_SHOWDIRTYSTATE="*"
    GIT_PS1_SHOWSTASHSTATE="*"
    GIT_PS1_SHOWUPSTREAM="auto"
    local STATUS
    STATUS=$(svn info 2>/dev/null)
    if [[ -z $STATUS ]]
    then
        STATUS=$(git log 2>/dev/null)
        if [[ -z $STATUS ]]
        then
            return
        fi
        VCS_LEADER=" ["
        VCS_END="] "
        VCS_BRANCH="$(__git_ps1 '%s')"
#        VCS_HEAD="$(git show --quiet --pretty=format:%h 2> /dev/null)"
    else
        VCS_LEADER=" ["
        VCS_END="] "
        VCS_BRANCH="svn:"
        VCS_HEAD=$(svn info | awk '/^Revision/ { sub("[^0-9]*","",$0); print $0 }')
    fi
}


# Composes prompt.
function set_prompt {

    # Prompt colors.
    local CLEAR="\[\033[0m\]"
    local PROMPT_COLOR='\[\033[1;94m\]'
    local VCS_LEADER_COLOR='\[\033[1;30m\]'
    local VCS_BRANCH_COLOR=$CLEAR'\[\033[0;32m\]'
    local VCS_HEAD_COLOR=$CLEAR'\[\033[0;33m\]'

    # Start with empty prompt.
    local PROMPTSTR=""

    PROMPT_COMMAND="_set_vcs_envar_info"
    PROMPTSTR=$PROMPTSTR"$VCS_LEADER_COLOR\$VCS_LEADER$VCS_BRANCH_COLOR"
    PROMPTSTR=$PROMPTSTR"\$VCS_BRANCH$VCS_HEAD_COLOR\$VCS_HEAD$VCS_LEADER_COLOR\$VCS_END$CLEAR"

    PROMPTSTR="$CLEAR\n$PROMPT_COLOR\W$PROMPTSTR\n$PROMPT_COLOR\$$CLEAR "

    # Set.
    PS1=$PROMPTSTR
    PS2="\[\033[1;34m\]>\[\033[0m\] "
    PS4="\[\033[1;34m\]+\[\033[0m\] "
}

# Activates prompt
set_prompt