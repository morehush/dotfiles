# ╋╋╋╋╋╋╋╋╋┏┓╋╋┏━┳┓
# ┏━━┳━┳┳┳━┫┗┳┳┫━┫┗┓
# ┃┃┃┃╋┃┏┫┻┫┃┃┃┣━┃┃┃
# ┗┻┻┻━┻┛┗━┻┻┻━┻━┻┻┛

# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-syntax-highlighting"
plug "zap-zsh/fzf"
# plug "Aloxaf/fzf-tab"
plug "zap-zsh/sudo"

source "$HOME/.config/zsh/alias.zsh"
source "$HOME/.config/zsh/exports.zsh"
source "$HOME/.config/zsh/functions.zsh"

HISTFILE=~/.zsh_history

### SET VI MODE ###
# Comment this line out to enable default emacs-like bindings
bindkey -v

eval "$(starship init zsh)"
