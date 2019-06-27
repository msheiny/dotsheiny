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
plugins=(git pip pyenv pylint python tmux vagrant dnf ssh-agent gpg-agent)

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
if [ -x "$(command -v go)" ]; then
    mkdir ~/.go 2> /dev/null || true
    export GOPATH="/home/mike/.go"
    export PATH="$PATH:/home/mike/.go/bin"
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
hash terraform 2> /dev/null && complete -o nospace -C `which terraform` terraform

# gcloud-sdk completion didnt work until I added it to the end :shrug:
GCLOUD_SDK="${HOME}/google-cloud-sdk"
if [ -d "${GCLOUD_SDK}" ]; then
    src_file "${GCLOUD_SDK}/path.zsh.inc"
    src_file "${GCLOUD_SDK}/completion.zsh.inc"
fi

# kubectl
if [ $commands[kubectl] ]; then
  source <(kubectl completion zsh)
fi

# AWS Vault
export AWS_VAULT_BACKEND=secret-service

# Debian packaging
export DEBEMAIL="mike@freedom.press"
export DEBFULLNAME="Michael Sheinberg"

# codefresh completion
#
_codefresh_completions()
{
    type_list=($(codefresh --impl-zsh-file-dir --get-yargs-completions "${words[@]}"))

    if [[ ${type_list[1]} == '__files_completion__' ]]; then
        compadd -- "${type_list[@]:1}"
    else
        compadd -- "${type_list[@]}"
    fi

    return 0
}
compdef _codefresh_completions codefresh
###-end-codefresh-completions-###
