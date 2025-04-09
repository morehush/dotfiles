#!/bin/bash

dconf dump /org/gnome/settings-daemon/plugins/media-keys/ >dump_1
dconf dump /org/gnome/desktop/wm/keybindings/ >dump_2
dconf dump /org/gnome/shell/keybindings/ >dump_3
dconf dump /org/gnome/mutter/keybindings/ >dump_4
dconf dump /org/gnome/mutter/wayland/keybindings/ >dump_5
