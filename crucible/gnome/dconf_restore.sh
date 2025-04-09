#!/bin/bash

cat dump_1 | dconf load /org/gnome/settings-daemon/plugins/media-keys/
cat dump_2 | dconf load /org/gnome/desktop/wm/keybindings/
cat dump_3 | dconf load /org/gnome/shell/keybindings/
cat dump_4 | dconf load /org/gnome/mutter/keybindings/
cat dump_5 | dconf load /org/gnome/mutter/wayland/keybindings/
