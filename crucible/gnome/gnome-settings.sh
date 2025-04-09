# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"
