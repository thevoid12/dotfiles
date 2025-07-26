#!/bin/bash

# this file is to build a destop shortcut out of bash file
CUR_DIR="$(pwd)"
DESKTOP_DIR="$(xdg-user-dir DESKTOP)"
MONITOR_DIR="${DESKTOP_DIR}/Monitor"
SCRIPT_PATH="${CUR_DIR}/external_monitor.sh"
DESKTOP_FILE="${MONITOR_DIR}/MonitorSetup.desktop"

mkdir -p "$MONITOR_DIR"

# Overwrite old .desktop file
rm -f "$DESKTOP_FILE"

cat <<EOF > "$DESKTOP_FILE"
[Desktop Entry]
Type=Application
Name=Monitor Setup
Comment=Choose monitor configuration
Exec=bash -c '${SCRIPT_PATH}'
Icon=video-display
Terminal=false
Categories=Utility;
X-KDE-SubstituteUID=false
StartupNotify=false
EOF

chmod +x "$DESKTOP_FILE"

