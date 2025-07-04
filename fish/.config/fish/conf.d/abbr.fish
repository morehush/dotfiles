# ╋╋╋╋╋╋╋╋╋┏┓╋╋┏━┳┓
# ┏━━┳━┳┳┳━┫┗┳┳┫━┫┗┓
# ┃┃┃┃╋┃┏┫┻┫┃┃┃┣━┃┃┃
# ┗┻┻┻━┻┛┗━┻┻┻━┻━┻┻┛

alias ff fastfetch
alias v nvim
alias wf 'nmcli device wifi'
alias wificonnect 'sudo nmcli dev wifi connect' #use with SSID password 'mypassword'
alias myip 'curl http://ifconfig.co/json; echo'
alias imv 'imv -r'
alias walls 'mpv ~/Pictures/wallpaper/'
alias mimempv 'cat $HOME/.config/mimeapps.list | grep ^video/ | cut -d\t -f1 | xargs xdg-mime default mpv.desktop'
alias batstat 'upower -i /org/freedesktop/UPower/devices/battery_BAT0'
alias grubfix 'sudo grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=EndeavourOS-grub'
alias grubmk 'sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias hmmm 'yay -Sy &> /dev/null && yay -Qu'
alias error 'journalctl -b -p err'
alias unm 'fusermount3 -u ~/remote1 && fusermount3 -u ~/remote2'
alias fuck 'sudo !!'
alias catt 'tail -n +1'
alias checkdns 'curl -v https://dns.nextdns.io/info'
alias archbox 'distrobox enter archbox -- /usr/bin/zsh'
alias updock '~/dockcheck/dockcheck.sh -apu -x 12 -e archbox'

# wireguard
abbr wgup 'wg-quick up wg0'
abbr wgd 'wg-quick down wg0'

# tailscale
abbr tsvpn 'sudo tailscale up --exit-node=omv --exit-node-allow-lan-access=true --accept-routes'
abbr tsup 'sudo tailscale up --accept-routes'
abbr tssrv 'sudo tailscale up --ssh --advertise-routes=192.168.2.0/24 --advertise-exit-node'
abbr tsd 'sudo tailscale down'

# systemctl
abbr sc 'sudo systemctl'
abbr uc 'systemctl --user'
abbr sj 'journalctl --all --follow --unit'
abbr uj 'journalctl --all --follow --user-unit'

# Changing 'ls' to 'eza'
alias l 'eza -l --group-directories-first'
alias la 'eza --all --group-directories-first'
alias ll 'eza -al --group-directories-first'
alias lt 'eza -T --level=2 --group-directories-first'
alias llt 'eza -lT --level=2 --group-directories-first'
alias lT 'eza -T --level=4 --group-directories-first'
alias l. 'eza -a | grep -E "^\."'

alias hw 'hwinfo --short' # Hardware Info
alias big 'expac -H M "%m\t%n" | sort -h | nl' # Sort installed packages according to size in MB (expac must be installed)
alias gitpkg 'pacman -Q | grep -i "\-git" | wc -l' # List amount of -git packages

# pacman and yay
alias fy fzfyay
alias yeet 'yay -Rcs'
alias pacsyu 'sudo pacman -Syyu' # update only standard pkgs
alias unlock 'sudo rm /var/lib/pacman/db.lck' # remove pacman lock
abbr cleanup 'sudo pacman -Rns $(pacman -Qtdq)' # remove orphaned packages

# Get fastest mirrors
abbr ratem "rate-mirrors arch | sudo tee /etc/pacman.d/mirrorlist"
abbr mirror "sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
abbr mirrord "sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
abbr mirrors "sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
abbr mirrora "sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

# Get the error messages from journalctl
abbr jctl "journalctl -p 3 -xb"

# Recent installed packages
alias rip 'expac --timefmt="%Y-%m-%d %T" "%l\t%n %v" | sort | tail -200 | nl'

alias df 'df -h'
alias top htop
alias tarnow 'tar -acf '
alias untar 'tar -zxvf '
alias wget 'wget -c '
# alias bat=batcat

# cd shorteners
alias up 'cd ..'
alias .. 'cd ..'
alias ... 'cd ../..'
alias .3 'cd ../../..'
alias .4 'cd ../../../..'

# confirm before overwriting something
alias cp 'cp -i'
alias mv 'mv -i'
alias rm 'rm -i'
alias ip 'ip -c'

alias diff colordiff
alias mount 'mount |column -t'
alias jobs 'jobs -l'
alias path 'echo -e $PATH//:/\\n'
alias now 'date +"%I:%M %d-%m-%Y"'
alias ports 'netstat -tulanp'
alias gh 'history|grep'
alias adl 'aria2c -x 16 -s 16 -k 1M'
alias genkey 'ssh-keygen -t rsa -b 4096'

# yt-dlp
abbr ytd yt-dlp
abbr ytf 'yt-dlp --ignore-config --downloader aria2c -N 4 -a files'
abbr yta-aac 'yt-dlp --extract-audio --audio-format aac '
abbr yta-best 'yt-dlp --extract-audio --audio-format best '
abbr yta-flac 'yt-dlp --extract-audio --audio-format flac '
abbr yta-m4a 'yt-dlp --extract-audio --audio-format m4a '
abbr yta-mp3 'yt-dlp --extract-audio --audio-format mp3 '
abbr yta-opus 'yt-dlp --extract-audio --audio-format opus '
abbr yta-vorbis 'yt-dlp --extract-audio --audio-format vorbis '
abbr yta-wav 'yt-dlp --extract-audio --audio-format wav '
abbr ytv-best 'yt-dlp -f bestvideo+bestaudio '

# docker compose
alias dcp 'docker compose pull'
alias dcu 'docker compose up -d'
alias dcd 'docker compose down'
