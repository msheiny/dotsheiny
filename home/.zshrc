# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="bira"

# TMUX auostart
export ZSH_TMUX_AUTOSTART=true
export ZSH_TMUX_AUTOQUIT=true

# Pull in ohmyzsh and plugin settings
source $ZSH/oh-my-zsh.sh
plugins=(git gem last-working-directory pip pyenv pylint python sudo tmux vagrant virtualenvwrapper dnf ssh-agent docker tmux)

# General Preferences
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games"
export EDITOR=vim

# Add local home to path
export PATH="/sbin:/usr/sbin:$PATH"
test -d ~/bin/  && export PATH="$(realpath ~/bin):$PATH"
test -d ~/share/man && export MANPATH="$MANPATH:~/share/man"

fpath=(~/.zsh/completions $fpath)
autoload -U compinit && compinit

# call my aliases
test -s ~/.alias && source ~/.alias || true
test -s ~/.localalias && source ~/.localalias  || true

# Check for homeshick and source
if [[ -f "$HOME/.homesick/repos/homeshick/homeshick.sh" ]]; then
    source "$HOME/.homesick/repos/homeshick/homeshick.sh"
fi

