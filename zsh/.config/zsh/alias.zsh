#!/bin/sh

alias arch='distrobox enter arch'
alias hx='helix'
alias vim='nvim'
alias wf='nmcli device wifi'
alias wificonnect='sudo nmcli dev wifi connect'     #use with SSID password 'mypassword'
alias myip='curl http://ipecho.net/plain; echo'
alias sxiv='sxiv -a'
alias imv='imv -r'
alias walls='sxiv -r ~/Pictures/wallpaper/'
alias mimempv='cat $HOME/.config/mimeapps.list | grep ^video/ | cut -d\t -f1 | xargs xdg-mime default mpv.desktop'
alias batstat='upower -i /org/freedesktop/UPower/devices/battery_BAT0'
alias omv='ssh morehush@h.morehush.com -t "tmux attach || tmux new"'
alias grubfix='sudo grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=EndeavourOS-grub'
alias grubmk='sudo grub-mkconfig -o /boot/grub/grub.cfg'

# wireguard
alias wgup='wg-quick up wg0'
alias wgd='wg-quick down wg0'

# tailscale
# alias tsvpn='sudo tailscale up --exit-node=100.112.40.23 --exit-node-allow-lan-access=true --accept-routes'
# alias tsup='sudo tailscale up --accept-routes'
# alias tssrv='sudo tailscale up --ssh --advertise-routes=192.168.2.0/24 --advertise-exit-node'
# alias tsd='sudo tailscale down'

# systemctl
alias sc='sudo systemctl'
alias uc='systemctl --user'
alias sj='journalctl --all --follow --unit'
alias uj='journalctl --all --follow --user-unit'

# Changing 'ls' to 'eza'
alias l='eza -l --group-directories-first'
alias la='eza --all --group-directories-first'
alias ll='eza -al --group-directories-first'
alias lt='eza -T --level=2 --group-directories-first'
alias llt='eza -lT --level=2 --group-directories-first'
alias lT='eza -T --level=4 --group-directories-first'
alias l.='eza -a | grep -E "^\."'


alias hw='hwinfo --short'                                   # Hardware Info
alias big='expac -H M "%m\t%n" | sort -h | nl'              # Sort installed packages according to size in MB (expac must be installed)
alias gitpkg='pacman -Q | grep -i "\-git" | wc -l'			# List amount of -git packages


# pacman and paru
alias yeet='paru -Rcs'
alias pacsyu='sudo pacman -Syyu'                 # update only standard pkgs
alias yaysua='yay -Sua --noconfirm'              # update only AUR pkgs (yay)
alias yaysyu='yay -Syu --noconfirm'              # update standard pkgs and AUR pkgs (yay)
alias parsua='paru -Sua --noconfirm'             # update only AUR pkgs (paru)
alias parsyu='paru -Syu --noconfirm'             # update standard pkgs and AUR pkgs (paru)
alias unlock='sudo rm /var/lib/pacman/db.lck'    # remove pacman lock
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'  # remove orphaned packages
alias fixpacman='sudo rm /var/lib/pacman/db.lck'

# Get fastest mirrors
alias ratem="rate-mirrors arch | sudo tee /etc/pacman.d/mirrorlist"
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

# Get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# Recent installed packages
alias rip='expac --timefmt="%Y-%m-%d %T" "%l\t%n %v" | sort | tail -200 | nl'

alias update='sudo apt update && sudo apt upgrade'
alias df='df -h'
alias top=htop
alias reload='source ~/.zshrc'
alias editalias='hx ~/.aliases'
alias tarnow='tar -acf '
alias untar='tar -zxvf '
alias wget='wget -c '
alias tb='nc termbin.com 9999'
# alias bat=batcat

# cd shorteners
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'

# confirm before overwriting something
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias ip='ip -c'

## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'

## get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'

# Merge Xresources
alias merge='xrdb -merge ~/.Xresources'

alias diff='colordiff'
alias mount='mount |column -t'
alias jobs='jobs -l'
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%I:%M %d-%m-%Y"'
alias ports='netstat -tulanp'
alias gh='history|grep'
alias hst='history | fzf'
alias adl='aria2c -x 16 -s 16 -k 1M'
alias genkey='ssh-keygen -t rsa -b 4096 -C t@morehush.com'

# yt-dlp
alias ytd='yt-dlp'
alias yta-aac='yt-dlp --extract-audio --audio-format aac '
alias yta-best='yt-dlp --extract-audio --audio-format best '
alias yta-flac='yt-dlp --extract-audio --audio-format flac '
alias yta-m4a='yt-dlp --extract-audio --audio-format m4a '
alias yta-mp3='yt-dlp --extract-audio --audio-format mp3 '
alias yta-opus='yt-dlp --extract-audio --audio-format opus '
alias yta-vorbis='yt-dlp --extract-audio --audio-format vorbis '
alias yta-wav='yt-dlp --extract-audio --audio-format wav '
alias ytv-best='yt-dlp -f bestvideo+bestaudio '

# docker compose
alias dcp='docker compose pull'
alias dcu='docker compose up -d'
alias dcd='docker compose down'
