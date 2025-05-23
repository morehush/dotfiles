# ╋╋╋╋╋╋╋╋╋┏┓╋╋┏━┳┓
# ┏━━┳━┳┳┳━┫┗┳┳┫━┫┗┓
# ┃┃┃┃╋┃┏┫┻┫┃┃┃┣━┃┃┃
# ┗┻┻┻━┻┛┗━┻┻┻━┻━┻┻┛

set -e fish_user_paths
set -U fish_user_paths $HOME/.bin $HOME/.local/bin $HOME/Applications /var/lib/flatpak/exports/bin/ $fish_user_paths

source $HOME/.config/fish/conf.d/abbr.fish

### EXPORT ###
set fish_greeting # Supresses fish's intro message
set TERM xterm-256color # Sets the terminal type
set EDITOR nvim
set VISUAL nvim
set XDG_CURRENT_DESKTOP Wayland
set TERMINAL wezterm
set ELECTRON_OZONE_PLATFORM_HINT auto
set MAKEFLAGS --jobs=$(nproc)

### SET FZF DEFAULTS
set FZF_DEFAULT_OPTS "--layout=reverse --exact --border=bold --border=rounded --margin=3% --color=dark"

### "less" as manpager
set -x MANPAGER less
### "nvim" as manpager
#set -x MANPAGER "nvim +Man!"

### SET EITHER DEFAULT EMACS MODE OR VI MODE ###
function fish_user_key_bindings
    # fish_default_key_bindings
    fish_vi_key_bindings
end

## Functions needed for !! and !$
function __history_previous_command
    switch (commandline -t)
        case "!"
            commandline -t $history[1]
            commandline -f repaint
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

# The bindings for !! and !$
if [ "$fish_key_bindings" = fish_vi_key_bindings ]

    bind -Minsert ! __history_previous_command
    bind -Minsert '$' __history_previous_command_arguments
else
    bind ! __history_previous_command
    bind '$' __history_previous_command_arguments
end

fzf --fish | source
zoxide init fish --cmd cd | source
