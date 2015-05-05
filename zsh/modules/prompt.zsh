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

PS1="%n@%m:%~%# "

PROMPT='%{$reset_color%}%B\$%b '
RPROMPT=$''
