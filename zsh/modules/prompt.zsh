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

function num_stopped_jobs {
    jobs -s | wc -l | sed -e "s/ //g"
}

function prompt_stopped_jobs {
  let num_stopped_jobs=$(num_stopped_jobs)

  if [ $num_stopped_jobs != "0" ]
  then
    echo -n "($num_stopped_jobs)"
  fi
}

function prompt_git_prompt_dirty {
    local git_status=''

    git_status=$(command git status 2>/dev/null | grep -v -e '^#' | tail -n1)
    if [[ -n $git_status ]]
    then
        echo -n "%{$fg[yellow]%}"
    else
        echo -n "%{$fg[green]%}"
    fi
}

function prompt_git_prompt_info {
    local ref=''

    ref=$(command git symbolic-ref HEAD 2> /dev/null) \
    || ref=$(command git rev-parse --short HEAD 2> /dev/null) \
    || return

    echo -n " on $(prompt_git_prompt_dirty)${ref#refs/heads/}"
}

PROMPT='$(prompt_stopped_jobs)%{$fg[cyan]%}%c%{$reset_color%}$(prompt_git_prompt_info)%{$reset_color%}
\$ %{$reset_color%}'
RPROMPT=$''
SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '
