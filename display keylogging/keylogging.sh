#!/bin/bash
# keydisplay.sh - KDE Plasma Wayland keystroke display toggle

SMTK_BIN="$HOME/.local/bin/showmethekey-gtk"
PIDFILE="/tmp/smtk.pid"
CONFIG_DIR="$HOME/.config/showmethekey"
CONFIG="$CONFIG_DIR/config.ini"
ICON_PATH="/usr/share/icons/breeze/apps/48/preferences-desktop-accessibility.svg"

install_showmethekey() {
    echo "Installing showmethekey..."

    sudo apt update
    sudo apt install -y meson ninja-build libgtk-4-dev libadwaita-1-dev \
        libjson-glib-dev libevdev-dev libinput-dev libxml2-utils \
        libxkbcommon-dev libxkbcommon-x11-dev libglib2.0-dev git pkg-config \
        libxkbregistry-dev

    cd "$HOME" || exit 1
    if [[ ! -d "showmethekey" ]]; then
        git clone https://github.com/AlynxZhou/showmethekey.git
    fi

    cd showmethekey || exit 1

    if [[ -d "build" ]]; then
        rm -rf build
    fi

    meson setup build --prefix="$HOME/.local"

    if ! meson compile -C build; then
        echo "Build failed. Check errors above."
        exit 1
    fi

    if [[ ! -f "build/showmethekey-gtk/showmethekey-gtk" ]]; then
        echo "ERROR: Binary not created. Build may have failed."
        exit 1
    fi

    meson install -C build

    if ! groups | grep -q input; then
        echo "Adding user to input group..."
        sudo usermod -a -G input "$USER"
        echo "IMPORTANT: You must log out and log back in for changes to take effect!"
    fi

    echo "Installation complete. Binary at: $SMTK_BIN"
    echo "Log out and back in, then run this script again."
}

setup_config() {
    mkdir -p "$CONFIG_DIR"
    cat > "$CONFIG" << 'EOF'
[ui]
position=bottom-right
font-family=Sans
font-size=36
font-style=normal
timeout=1200
show-shift-state=true
show-modifier-state=true
ignore-modifier-only=false
draggable=false

[style]
background-color=#000000
background-opacity=0.8
text-color=#FFFFFF
border-radius=8
border-width=0
EOF
}

toggle_keydisplay() {
    if [[ -f "$PIDFILE" ]] && kill -0 "$(cat "$PIDFILE")" 2>/dev/null; then
        kill "$(cat "$PIDFILE")"
        rm -f "$PIDFILE"
        notify-send "Key Display" "STOPPED" -i dialog-information -t 2000
    else
        "$SMTK_BIN" > /tmp/smtk.log 2>&1 &
        echo $! > "$PIDFILE"
        notify-send "Key Display" "STARTED" -i dialog-information -t 2000
    fi
}

if [[ ! -x "$SMTK_BIN" ]]; then
    echo "showmethekey not found. Installing..."
    install_showmethekey
    exit 0
fi

if ! groups | grep -q input; then
    echo "ERROR: You are not in the input group."
    echo "Run: sudo usermod -a -G input $USER"
    echo "Then log out and log back in."
    exit 1
fi

setup_config
toggle_keydisplay
