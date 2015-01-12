#!/usr/bin/env bash

dotfiles_dir="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )"/.. && pwd )"
excluded=("scripts" "templates" "README.markdown")

function isExcluded() {
    if [ -z "$1" ]
    then
        return
    fi

    for i in ${excluded[@]}
    do
        if [ $i == $1 ]
        then
            return 1
        fi
    done

    return 0
}

for path in $dotfiles_dir/*
do
    name=`basename $path`
    target="$HOME/.$name"

    if [ -e $target ]
    then
        if [ -L $target ]
        then
            echo "Updating $target"
            ln -f -n -s "$dotfiles_dir/$name" "$target"
        else
            echo "$target is not a symlink"
        fi
    else
        if isExcluded $name
        then
            echo "Creating $target"
            ln -s "$dotfiles_dir/$name" "$target"
        fi
    fi
done

if [ ! -e $HOME/.vim/bundle/Vundle.vim ]; then
  git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
fi

vim -u $HOME/.vimrc.bundles +PluginInstall +PluginClean! +qa
cd $HOME/.vim/bundle/vimproc.vim && make
