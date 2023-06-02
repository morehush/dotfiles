#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

# ~/two-monitors.sh

systemctl --user import-environment DISPLAY
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
xsetroot -cursor_name left_ptr &
setxkbmap -layout us


[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

numlockx &
nitrogen --restore &
picom -b &
nm-applet &

exec bspwm
