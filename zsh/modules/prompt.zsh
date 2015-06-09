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

vcs_info_wrapper() {
    vcs_info
    if [ -n "$vcs_info_msg_0_" ]; then
        echo "%{$fg[white]%}${vcs_info_msg_0_}%{$reset_color%}"
    fi
}
