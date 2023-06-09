﻿# ╋╋╋╋╋╋╋╋╋┏┓╋╋┏━┳┓
# ┏━━┳━┳┳┳━┫┗┳┳┫━┫┗┓
# ┃┃┃┃╋┃┏┫┻┫┃┃┃┣━┃┃┃
# ┗┻┻┻━┻┛┗━┻┻┻━┻━┻┻┛


### ADDING TO THE PATH
# First line removes the path; second line sets it.  Without the first line,
# your path gets massive and fish becomes very slow.
set -e fish_user_paths
set -U fish_user_paths $HOME/.bin $HOME/go/bin $HOME/.local/bin $HOME/Applications /home/linuxbrew/.linuxbrew/bin $fish_user_paths
#set PATH $HOME/.bin $HOME/go/bin $HOME/.local/bin $HOME/Applications /home/linuxbrew/.linuxbrew/bin $PATH

## Set values
# Hide welcome message
set fish_greeting
set TERM "xterm-256color"
set EDITOR "nvim"
set VISUAL "nvim"
set VIRTUAL_ENV_DISABLE_PROMPT "1"


### SET MANPAGER
### Uncomment only one of these!

### "bat" as manpager
set -x MANPAGER "sh -c 'col -bx | batcat -l man -p'"

### "vim" as manpager
# set -x MANPAGER '/bin/bash -c "vim -MRn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"'

### "nvim" as manpager
# set -x MANPAGER "nvim -c 'set ft=man' -"

### SET EITHER DEFAULT EMACS MODE OR VI MODE ###
function fish_user_key_bindings
  # fish_default_key_bindings
  fish_vi_key_bindings
end
### END OF VI MODE ###

### AUTOCOMPLETE AND HIGHLIGHT COLORS ###
set fish_color_normal '#56b6c2'
set fish_color_autosuggestion '#abb2bf'
set fish_color_command '#56b6c2'
set fish_color_error '#e06c75'
set fish_color_param '#56b6c2'


## Functions ##
# Functions needed for !! and !$ https://github.com/oh-my-fish/plugin-bang-bang
function forget
    set -l cmd (commandline | string collect)
    history delete --exact --case-sensitive -- $cmd
end
bind \cg forget


function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end

if [ "$fish_key_bindings" = fish_vi_key_bindings ];
  bind -Minsert ! __history_previous_command
  bind -Minsert '$' __history_previous_command_arguments
else
  bind ! __history_previous_command
  bind '$' __history_previous_command_arguments
end

# Fish command history
function history
    builtin history --show-time='%F %T '
end

function makebak --argument filename
    cp $filename $filename.bak
end

# Copy DIR1 DIR2
function copy
    set count (count $argv | tr -d \n)
    if test "$count" = 2; and test -d "$argv[1]"
	set from (echo $argv[1] | trim-right /)
	set to (echo $argv[2])
        command cp -r $from $to
    else
        command cp $argv
    end
end

## END OF FUNCTIONS ##

# morehush fish abbreviations

abbr bat 'batcat'
abbr wf 'nmcli device wifi'
abbr wificonnect 'sudo nmcli dev wifi connect'
abbr myip 'curl http://ipecho.net/plain; echo'
abbr vim 'nvim'
abbr imv 'imv -r'
abbr sxiv 'sxiv -a'
abbr walls 'sxiv -r ~/Pictures/wallpaper/'
abbr mimempv 'cat $HOME/.config/mimeapps.list | grep ^video/ | cut -d\t -f1 | xargs xdg-mime default mpv.desktop'
abbr batstat 'upower -i /org/freedesktop/UPower/devices/battery_BAT0'
abbr omv 'ssh morehush@omv'

#chezmoi
abbr che 'chezmoi'

# Changing 'ls' to 'exa'
abbr l 'exa -l --group-directories-first'
abbr la 'exa --all --group-directories-first'
abbr ll 'exa -al --group-directories-first'
abbr lt 'exa -T-ignore --level=2 --group-directories-first'
abbr llt 'exa -lT-ignore --level=2 --group-directories-first'
abbr lT 'exa -T-ignore --level=4 --group-directories-first'
abbr l. 'exa -a | egrep "^\."'


abbr hw 'hwinfo --short'                                   # Hardware Info
abbr big 'expac -H M "%m\t%n" | sort -h | nl'              # Sort installed packages according to size in MB (expac must be installed)
abbr gitpkg 'pacman -Q | egrep -i "\-git" | wc -l'			# List amount of -git packages


# pacman and paru
abbr yeet 'paru -Rcs'
abbr pacsyu 'sudo pacman -Syyu'                 # update only standard pkgs
abbr yaysua 'yay -Sua --noconfirm'              # update only AUR pkgs (yay)
abbr yaysyu 'yay -Syu --noconfirm'              # update standard pkgs and AUR pkgs (yay)
abbr parsua 'paru -Sua --noconfirm'             # update only AUR pkgs (paru)
abbr parsyu 'paru -Syu --noconfirm'             # update standard pkgs and AUR pkgs (paru)
abbr unlock 'sudo rm /var/lib/pacman/db.lck'    # remove pacman lock
abbr cleanup 'sudo pacman -Rns (pacman -Qtdq)'  # remove orphaned packages
abbr fixpacman 'sudo rm /var/lib/pacman/db.lck'

# Get fastest mirrors
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

# Get the error messages from journalctl
abbr jctl "journalctl -p 3 -xb"

# Recent installed packages
abbr rip 'expac --timefmt="%Y-%m-%d %T" "%l\t%n %v" | sort | tail -200 | nl'

abbr update 'sudo apt update && sudo apt upgrade -y'
abbr df 'pydf'
abbr top 'htop'
abbr du 'ncdu'
abbr reload 'source ~/.config/fish/config.fish'
abbr editalias 'nvim ~/.config/fish/config.fish'
abbr tarnow 'tar -acf '
abbr untar 'tar -zxvf '
abbr wget 'wget -c '
abbr tb 'nc termbin.com 9999'

# cd shorteners
alias up='cd ..'
alias up2='cd ../..'
alias up3='cd ../../..'
alias up4='cd ../../../..'

# confirm before overwriting something
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias ip='ip -c'

## get top process eating memory
abbr psmem 'ps auxf | sort -nr -k 4'
abbr psmem10 'ps auxf | sort -nr -k 4 | head -10'

## get top process eating cpu ##
abbr pscpu 'ps auxf | sort -nr -k 3'
abbr pscpu10 'ps auxf | sort -nr -k 3 | head -10'

# Merge Xresources
abbr merge 'xrdb -merge ~/.Xresources'

abbr diff 'colordiff'
abbr mount 'mount |column -t'
abbr jobs 'jobs -l'
abbr path 'echo -e {$PATH\n}'
abbr now 'date +"%I:%M %d-%m-%Y"'
abbr ports 'netstat -tulanp'
alias gh='history|grep'
abbr adl 'aria2c -x 16 -s 16 -k 1M'
abbr genkey 'ssh-keygen -t rsa -b 4096 -C t@morehush.com'
abbr jctl 'journalctl -p 3 -xb'

# yt-dlp
alias ytd='yt-dlp '
alias ytu='yt-dlp -U'
alias yta-aac='yt-dlp --extract-audio --audio-format aac '
alias yta-best='yt-dlp --extract-audio --audio-format best '
alias yta-flac='yt-dlp --extract-audio --audio-format flac '
alias yta-m4a='yt-dlp --extract-audio --audio-format m4a '
alias yta-mp3='yt-dlp --extract-audio --audio-format mp3 '
alias yta-opus='yt-dlp --extract-audio --audio-format opus '
alias yta-vorbis='yt-dlp --extract-audio --audio-format vorbis '
alias yta-wav='yt-dlp --extract-audio --audio-format wav '
alias ytv-best='yt-dlp -f bestvideo+bestaudio '


## Docker Compose
abbr dcd 'docker compose down'
abbr dcp 'docker compose pull'
abbr dcu 'docker compose up -d'


## Starship prompt
starship init fish | source
