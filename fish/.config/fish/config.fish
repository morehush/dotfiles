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
set -x EDITOR nvim
set -x VISUAL nvim
set XDG_CURRENT_DESKTOP GNOME
set TERMINAL ghostty
set ELECTRON_OZONE_PLATFORM_HINT auto
set MAKEFLAGS --jobs=$(nproc)

### SET FZF DEFAULTS
set FZF_DEFAULT_OPTS "--layout=reverse --exact --border=bold --border=rounded --margin=3% --color=dark"

### "less" as manpager
set -x MANPAGER less
### "nvim" as manpager
#set -x MANPAGER "nvim +Man!"

function fzfyay
    yay -Slq | fzf -m --preview 'bat <(yay -Si {1}) <(yay -Fl {1} | awk "{print \$2}")' | xargs -ro yay -S
end

### SET EITHER DEFAULT EMACS MODE OR VI MODE ###
function fish_user_key_bindings
    # fish_default_key_bindings
    fish_vi_key_bindings
end

if status is-interactive
    atuin init fish | source
end

fzf --fish | source
zoxide init fish --cmd cd | source
