autoload -U colors
colors

setopt PROMPT_SUBST
bindkey -e

if [[ $(uname) == 'Darwin' ]]; then
    stty erase ˆH
fi

REPORTTIME=10
LISTMAX=0

PS1="%n@%m:%~%# "

function stopped_jobs {
    jobs -s | wc -l | sed -e "s/ //g"
}

function git_prompt_dirty {
    local git_status=''

    git_status=$(command git status 2>/dev/null | grep -v -e '^#' | tail -n1)
    if [[ -n $git_status ]]
    then
        echo "%{$fg[yellow]%}"
    else
        echo "%{$fg[green]%}"
    fi
}

function git_prompt_info {
    local ref=''

    ref=$(command git symbolic-ref HEAD 2> /dev/null) \
    || ref=$(command git rev-parse --short HEAD 2> /dev/null) \
    || return

    echo -n " on $(git_prompt_dirty)${ref#refs/heads/}"
}

PROMPT='($(stopped_jobs))(%{$fg[cyan]%}%c%{$reset_color%}$(git_prompt_info)%{$reset_color%})\$ %{$reset_color%}'
RPROMPT=$''
SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '
