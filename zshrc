ZSH=$HOME/.zsh
EDITOR=vim
TERM=screen-256color

PATH=/usr/local/bin:/usr/local/sbin:$PATH                # Machine
PATH="$(brew --prefix python)/bin:$PATH"                 # Python
PATH="$(brew --prefix ruby)/bin:$PATH"                   # Ruby
PATH=/opt/vagrant/bin:$PATH                              # Vagrant
PATH=/usr/local/heroku/bin:$PATH                         # Heroku
PATH=/usr/local/go/bin:$PATH                             # Go
PATH=$HOME/Projects/bin:$PATH                            # My Go
PATH=$HOME/.ansible/bin:$PATH                            # Ansible
PATH=$HOME/.bin:$PATH                                    # My tools

if [ -f $HOME/.zshrc.local ]; then
    source $HOME/.zshrc.local
fi

for file ($ZSH/modules/**/*.zsh) source $file
