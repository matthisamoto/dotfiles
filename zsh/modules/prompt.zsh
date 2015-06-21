autoload -U colors
colors

setopt PROMPT_SUBST
bindkey -v

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^R' history-incremental-search-backward
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char

REPORTTIME=10
LISTMAX=0

PROMPT='%{$reset_color%}%B%c \$%b '
RPROMPT=$'$(vcs_info_wrapper)'

autoload -Uz vcs_info
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' actionformats "%b"
zstyle ':vcs_info:*' formats "%b"
zstyle ':vcs_info:*' enable git svn

function git_prompt_dirty {
    git_status=$(command git status 2>/dev/null | grep -v -e ^# | tail -n1)
    if [[ -n $git_status ]]
    then
        echo "%{$fg[cyan]%}"
    else
        echo "%{$fg[green]%}"
    fi
}

function git_prompt_info {
    local ref=''

    ref=$(command git symbolic-ref HEAD 2> /dev/null) \
    || ref=$(command git rev-parse --short HEAD 2> /dev/null) \
    || return

    echo -n "$(git_prompt_dirty)${ref#refs/heads/}"
}

PROMPT='[%{$fg[cyan]%}${PWD/#$HOME/~}%{$reset_color%}]\$ %{$reset_color%}'
RPROMPT=$'$(git_prompt_info)%{$reset_color%}'

vcs_info_wrapper() {
    vcs_info
    if [ -n "$vcs_info_msg_0_" ]; then
        echo "%{$fg[white]%}${vcs_info_msg_0_}%{$reset_color%}"
    fi
}