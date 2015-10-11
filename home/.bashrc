# Check for homeshick and source
if [[ -f "$HOME/.homesick/repos/homeshick/homeshick.sh" ]]; then
    source "$HOME/.homesick/repos/homeshick/homeshick.sh"
fi

# VIM! Editor of champions
export EDITOR=/usr/bin/vim

# Add local home to path
PATH="/sbin:/usr/sbin:$PATH:~/bin"
test -d ~/.local/bin/  && export PATH="~/.local/bin:$PATH"
export MANPATH="$MANPATH:~/share/man"

# steam home sound fix
if [[ `hostname` == 'sheiny-home-linux' ]]; then
	export SDL_AUDIODRIVER=pulseaudio
fi

# call my aliases
test -s ~/.alias && . ~/.alias || true
test -s ~/.localalias && . ~/.localalias  || true

# autoenv
if [[ -f /usr/bin/activate.sh ]]; then
    source /usr/bin/activate.sh
fi
