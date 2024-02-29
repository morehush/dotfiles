#!/bin/sh
export XDG_CURRENT_DESKTOP="Wayland"
export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="kitty"
export TERM="xterm-256color"

### PATH
if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

### "bat" as manpager
export MANPAGER="less -R --use-color -Dd+r -Du+b"

# zoxide
eval "$(zoxide init --cmd cd zsh)"
