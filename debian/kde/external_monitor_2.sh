#!/bin/bash

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

# # ----------------------
# # Set F12 to launch the script using KDE's global shortcut system
# # ----------------------

# # We'll create a global shortcut config file for kglobalshortcutsrc
# APP_ID="monitor-setup-script"
# SHORTCUT_FILE="$HOME/.config/kglobalshortcutsrc"

# # Remove any old entry
# sed -i "/^\[${APP_ID}\]/,/^\[/d" "$SHORTCUT_FILE"

# # Append new shortcut entry
# cat <<EOF >> "$SHORTCUT_FILE"

# [${APP_ID}]
# _ksn_internal_name=${APP_ID}
# launch=F12,none,Launch Monitor Setup
# EOF

# # Register the application in KDE's service menu
# mkdir -p "$HOME/.local/share/applications"
# cp "$DESKTOP_FILE" "$HOME/.local/share/applications/${APP_ID}.desktop"

# # Let KDE reload shortcuts
# qdbus org.kde.kglobalaccel /component/${APP_ID} org.kde.kglobalaccel.Component.reconfigure || true

# echo "MonitorSetup.desktop created and F12 is now bound to launch it."
