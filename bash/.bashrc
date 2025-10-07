# ╋╋╋╋╋╋╋╋╋┏┓╋╋┏━┳┓
# ┏━━┳━┳┳┳━┫┗┳┳┫━┫┗┓
# ┃┃┃┃╋┃┏┫┻┫┃┃┃┣━┃┃┃
# ┗┻┻┻━┻┛┗━┻┻┻━┻━┻┻┛

export EDITOR="nvim"
export VISUAL="nvim"
export TERM="xterm-256color"
export ELECTRON_OZONE_PLATFORM_HINT="auto"

# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

### PATH
if [ -d "$HOME/.local/bin" ]; then
  PATH="$HOME/.local/bin:$PATH"
fi

### PROMPT
function parse_git_dirty {
  [[ $(git status --porcelain 2>/dev/null) ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2>/dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ (\1$(parse_git_dirty))/"
}

export PS1="\n\t \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
# PS1='[\u@\h \W]\$ '

### "bat" as manpager
export MANPAGER="less -R --use-color -Dd+r -Du+b"

### SET VI MODE ###
# Comment this line out to enable default emacs-like bindings
set -o vi
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color | *-256color) color_prompt=yes ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  #alias dir='dir --color=auto'
  #alias vdir='vdir --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

### SHOPT
shopt -s autocd  # change to named directory
shopt -s cdspell # autocorrects cd misspellings
shopt -s cmdhist # save multi-line commands in history as single line
#shopt -s dotglob
shopt -s histappend     # do not overwrite history
shopt -s expand_aliases # expand aliases
shopt -s checkwinsize   # checks term size when bash regains control

bind "set bell-style none"

#prettyfi
bind "set colored-stats on"
bind "set colored-completion-prefix on"

#ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"

### Docker exec into a container to get IP address
dip() {
  docker exec -it $1 curl http://ifconfig.co/json
  echo
}

### ARCHIVE EXTRACTION
# usage: ex <file>
ex() {
  if [ -f $1 ]; then
    case $1 in
    *.tar.bz2) tar xjf $1 ;;
    *.tar.gz) tar xzf $1 ;;
    *.bz2) bunzip2 $1 ;;
    *.rar) unrar x $1 ;;
    *.gz) gunzip $1 ;;
    *.tar) tar xf $1 ;;
    *.tbz2) tar xjf $1 ;;
    *.tgz) tar xzf $1 ;;
    *.zip) unzip $1 ;;
    *.Z) uncompress $1 ;;
    *.7z) 7z x $1 ;;
    *.deb) ar x $1 ;;
    *.tar.xz) tar xf $1 ;;
    *.tar.zst) unzstd $1 ;;
    *) echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# navigation
up() {
  local d=""
  local limit="$1"

  # Default to limit of 1
  if [ -z "$limit" ] || [ "$limit" -le 0 ]; then
    limit=1
  fi

  for ((i = 1; i <= limit; i++)); do
    d="../$d"
  done

  # perform cd. Show error if cd fails
  if ! cd "$d"; then
    echo "Couldn't go up $limit dirs."
  fi
}

#aliases
alias l='ls -l --group-directories-first'
alias la='ls --all --group-directories-first'
alias ll='ls -al --group-directories-first'
alias lt='ls -T --level=2 --group-directories-first'
alias llt='ls -lT --level=2 --group-directories-first'
alias lT='ls -T --level=4 --group-directories-first'
alias l.='ls -a | grep -E "^\."'

alias error='journalctl -b -p err'
alias fuck='sudo !!'
alias catt='tail -n +1'
alias checkdns='curl -v https://dns.nextdns.io/info'
alias updock='~/dockcheck/dockcheck.sh'
alias archbox='distrobox enter archbox -- /usr/bin/zsh'

# wireguard
alias wgup='wg-quick up wg0'
alias wgd='wg-quick down wg0'

# tailscale
alias tsvpn='sudo tailscale up --exit-node=omv --exit-node-allow-lan-access=true --accept-routes'
alias tsup='sudo tailscale up --accept-routes'
alias tssrv='sudo tailscale up --ssh --advertise-routes=192.168.2.0/24 --advertise-exit-node'
alias tsd='sudo tailscale down'

# systemctl
alias sc='sudo systemctl'
alias uc='systemctl --user'
alias sj='journalctl --all --follow --unit'
alias uj='journalctl --all --follow --user-unit'

# Get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

alias update='sudo apt update && sudo apt upgrade'
alias df='df -h'
alias top=htop
alias tarnow='tar -acf '
alias untar='tar -zxvf '
alias wget='wget -c '
alias bat=batcat

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

alias diff='colordiff'
alias mount='mount |column -t'
alias jobs='jobs -l'
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%I:%M %d-%m-%Y"'
alias ports='netstat -tulanp'
alias gh='history|grep'
alias adl='aria2c -x 16 -s 16 -k 1M'

# yt-dlp
alias ytd='yt-dlp'
alias ytf='yt-dlp --ignore-config --downloader aria2c -N 4 -a files'

# docker compose
alias dcp='docker compose pull'
alias dcu='docker compose up -d'
alias dcd='docker compose down'
