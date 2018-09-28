# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="bira"

# TMUX auostart
export ZSH_TMUX_AUTOSTART=true
export ZSH_TMUX_AUTOQUIT=false
ZSH_TMUX_AUTOCONNECT=false

# Virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs

# Pull in ohmyzsh and plugin settings
plugins=(git gem last-working-directory pip pyenv pylint python sudo tmux vagrant virtualenvwrapper dnf ssh-agent docker tmux)

source $ZSH/oh-my-zsh.sh

# General Preferences
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games"
export EDITOR=vim

# NTFY settings
export AUTO_NTFY_DONE_LONGER_THAN=-L60
export AUTO_NTFY_DONE_IGNORE="vim vi screen tmux gc htop tail find"

# Add local home to path
export PATH="/sbin:/usr/sbin:$PATH"
test -d ~/.local/bin/  && export PATH="$(realpath ~/.local/bin):$PATH"
test -d ~/share/man && export MANPATH="$MANPATH:~/share/man"
test -d ~/share/man && export MANPATH="$MANPATH:~/share/man"
test -d ~/.gem/ruby/2.3.0/bin && export PATH="~/.gem/ruby/2.3.0/bin:$PATH"


fpath=(~/.zsh/completions $fpath)
autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit

# Ansible Related
export ANSIBLE_NOCOWS=1

# Direnv hook
which direnv > /dev/null 2>&1 && eval "$(direnv hook zsh)"

# GO
if [ -f /usr/lib/go-1.10/bin/go ]; then
    mkdir ~/.go 2> /dev/null || true
    export PATH="/usr/lib/go-1.10/bin:$PATH:/home/mike/.go/bin"
    export GOPATH="/home/mike/.go"
elif [ -f /usr/lib/go-1.8/bin/go ]; then
    mkdir ~/.go 2> /dev/null || true
    export PATH="/usr/lib/go-1.8/bin:$PATH:/home/mike/.go/bin"
    export GOPATH="/home/mike/.go"
fi

# Lets wire up tab completion scripts
function src_file {
    test -f "$1" && source "$1"
}

src_file "$HOME/.homesick/repos/homeshick/homeshick.sh"
src_file "$HOME/.alias"
src_file "$HOME/.localalias"
#src_file /etc/bash_completion.d/docker-machine

BASH_COMPLETE_DIR=$HOME/.bash_completions

if [ -d "$BASH_COMPLETE_DIR" ]; then
    for file in `ls "$BASH_COMPLETE_DIR"`; do
        source "$BASH_COMPLETE_DIR/$file"
    done
fi
hash terraform 2> /dev/null && complete -o nospace -C /usr/bin/terraform terraform

# gcloud-sdk completion didnt work until I added it to the end :shrug:
src_file "/usr/share/google-cloud-sdk/completion.zsh.inc"

# kubectl
if [ $commands[kubectl] ]; then
  source <(kubectl completion zsh)
fi

# AWS Vault
export AWS_VAULT_BACKEND=secret-service

# Debian packaging
export DEBEMAIL="mike@freedom.press"
export DEBFULLNAME="Michael Sheinberg"
