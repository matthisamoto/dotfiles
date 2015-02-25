ZSH=$HOME/.zsh
EDITOR=vim

PATH=/usr/local/bin:/usr/local/sbin:$PATH                       # Machine
PATH="$(brew --prefix python)/bin:$PATH"                        # Python
PATH="$(brew --prefix heroku)/bin:$PATH"                        # Heroku
PATH="$(brew --prefix go)/bin:$PATH"                            # Go
PATH=$HOME/Projects/bin:$PATH                                   # My Go
PATH=$HOME/.ansible/bin:$PATH                                   # Ansible
PATH=$HOME/.bin:$PATH                                           # My tools

PATH=$HOME/Projects/android/sdk/platform-tools:$PATH            # Android
PATH=/Applications/Postgres.app/Contents/Versions/9.3/bin:$PATH # PostgreSQL

if [ -f $HOME/.zshrc.local ]; then
    source $HOME/.zshrc.local
fi

for file ($ZSH/modules/**/*.zsh) source $file
