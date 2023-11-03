# ╋╋╋╋╋╋╋╋╋┏┓╋╋┏━┳┓
# ┏━━┳━┳┳┳━┫┗┳┳┫━┫┗┓
# ┃┃┃┃╋┃┏┫┻┫┃┃┃┣━┃┃┃
# ┗┻┻┻━┻┛┗━┻┻┻━┻━┻┻┛


### ADDING TO THE PATH
# First line removes the path; second line sets it.  Without the first line,
# your path gets massive and fish becomes very slow.
set -e fish_user_paths
set -U fish_user_paths $HOME/.bin $HOME/.local/bin $HOME/Applications /home/linuxbrew/.linuxbrew/bin /home/linuxbrew/.linuxbrew/sbin $fish_user_paths
#set PATH $HOME/.bin $HOME/.local/bin $HOME/Applications $PATH

# Set values
set fish_greeting # Hide welcome message
set TERM "xterm-256color"
set -gx EDITOR hx
set -gx VISUAL hx
set VIRTUAL_ENV_DISABLE_PROMPT "1"

### AUTOCOMPLETE AND HIGHLIGHT COLORS ###
set fish_color_normal '#a9b1d6'
set fish_color_autosuggestion '#425878'
set fish_color_command '#7aa2f7'
set fish_color_error '#f7768e'
set fish_color_param '#449dab'

### SET MANPAGER
### Uncomment only one of these!

### "bat" as manpager
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

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

# .. expand to to go up 2 directories
function multicd; echo cd (string repeat -n (math (string length -- $argv[1]) - 1) ../); end

abbr --add dotdot --regex '^\.\.+$' --function multicd

# !! previous command
abbr --add !! --position anywhere --function replace_history
function replace_history; echo -- $history[1]; end

## END OF FUNCTIONS ##

# morehush fish abbreviations

# wireguard
alias wgup='wg-quick up wg0'
alias wgdn='wg-quick down wg0'

# tailscale
abbr tsvpn 'sudo tailscale up --exit-node=100.112.40.23 --exit-node-allow-lan-access=true --accept-routes'
abbr tsup 'sudo tailscale up --accept-routes'
abbr tssrv 'sudo tailscale up --ssh --advertise-routes=192.168.2.0/24 --advertise-exit-node'
abbr tsd 'sudo tailscale down'

# systemctl
abbr sc 'sudo systemctl'
abbr uc 'systemctl --user'
abbr sj 'journalctl --all --follow --unit'
abbr uj 'journalctl --all --follow --user-unit'

abbr wf 'nmcli device wifi'
abbr wificonnect 'sudo nmcli dev wifi connect'
abbr myip 'curl http://ipecho.net/plain; echo'
abbr imv 'imv -r'
abbr sxiv 'sxiv -a'
abbr walls 'sxiv -r ~/Pictures/wallpaper/'
abbr mimempv 'cat $HOME/.config/mimeapps.list | grep ^video/ | cut -d\t -f1 | xargs xdg-mime default mpv.desktop'
abbr batstat 'upower -i /org/freedesktop/UPower/devices/battery_BAT0'
abbr omv 'ssh morehush@omv'

# history search
abbr hst 'history | fzf'

# Changing 'ls' to 'exa'
alias l='exa -l --group-directories-first'
alias la='exa --all --group-directories-first'
alias ll='exa -al --group-directories-first'
alias lt='exa -T --level=2 --group-directories-first'
alias llt='exa -lT --level=2 --group-directories-first'
alias lT='exa -T --level=4 --group-directories-first'
alias l.='exa -a | grep -E "^\."'


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

abbr update 'sudo apt update && sudo apt upgrade'
abbr top 'htop'
abbr reload 'source ~/.config/fish/config.fish'
abbr editalias 'hx ~/.config/fish/config.fish'
abbr tarnow 'tar -acf '
abbr untar 'tar -zxvf '
abbr wget 'wget -c '
abbr tb 'nc termbin.com 9999'

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

# abbr diff 'colordiff'
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
abbr ytd 'yt-dlp'
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
