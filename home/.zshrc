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
test -d ~/bin/  && export PATH="$(realpath ~/bin):$PATH"
test -d ~/share/man && export MANPATH="$MANPATH:~/share/man"
test -d ~/share/man && export MANPATH="$MANPATH:~/share/man"
test -d ~/.gem/ruby/2.3.0/bin && export PATH="~/.gem/ruby/2.3.0/bin:$PATH"


fpath=(~/.zsh/completions $fpath)
autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit

# Ansible Related
export ANSIBLE_NOCOWS=1

# Move external sourcin' logic outside
source ~/.zsh/sourcin
