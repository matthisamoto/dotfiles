ZSH=$HOME/.zsh
EDITOR=vim

PATH=/usr/local/bin:/usr/local/sbin:$PATH                # Machine
PATH=/usr/local/share/python:$PATH                       # Python
PATH="$(brew --prefix ruby)/bin:$PATH"                   # Ruby Gems
PATH=/opt/vagrant/bin:$PATH                              # Vagrant
PATH=/usr/local/heroku/bin:$PATH                         # Heroku
PATH=/opt/tools/android/sdk/tools:$PATH                  # Android
PATH=/opt/tools/android/sdk/platform-tools:$PATH         # Android
PATH=/usr/local/go/bin:$PATH                             # Go
PATH=$HOME/Projects/bin:$PATH                            # My Go
PATH=$HOME/Projects/Work/virb/bin:$PATH                  # Virb tools
PATH=$HOME/.ansible/bin:$PATH                            # Ansible
PATH=$HOME/.bin:$PATH                                    # My tools

if [ -f $HOME/.zshrc.local ]; then
    source $HOME/.zshrc.local
fi

for file ($ZSH/modules/**/*.zsh) source $file

TERM=screen-256color
