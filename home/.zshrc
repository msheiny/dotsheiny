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

source $HOME/.alias
if [ -f $HOME/.otheralias ]; then source $HOME/.otheralias; fi

source "$HOME/.homesick/repos/homeshick/homeshick.sh"
