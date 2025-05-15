#!/bin/sh
export XDG_CURRENT_DESKTOP="Wayland"
export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="wezterm"
export TERM="xterm-256color"
export ELECTRON_OZONE_PLATFORM_HINT="auto"
export MAKEFLAGS="--jobs=$(nproc)"

### PATH
if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

### "bat" as manpager
export MANPAGER="less -R --use-color -Dd+r -Du+b"

