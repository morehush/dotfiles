#!/bin/sh
export XDG_CURRENT_DESKTOP="Wayland"
export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="kitty"
export TERM="xterm-256color"
export BROWSER="brave"

### PATH
if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

### "bat" as manpager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
