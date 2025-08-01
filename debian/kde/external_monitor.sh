#!/bin/bash

CUR_DIR="$(pwd)"
# Add at very top
exec &>> "$CUR_DIR/monitor-setup.log"
echo "--- Running at $(date) ---"

# Set environment vars so kscreen-doctor works via GUI launcher
export DISPLAY=:0
export XDG_SESSION_TYPE=wayland
export WAYLAND_DISPLAY=wayland-0

# this script fixes my wayland external monitor resolution issue
CHOICE=$(kdialog --menu "Select Display Configuration" \
    "1" "External Monitor Only (Laptop screen OFF)" \
    "2" "Dual Monitor (External Left, Laptop Right)")

if [[ -z "$CHOICE" ]]; then
    exit 1
fi

# Smart display detection
INTERNAL=$(kscreen-doctor --outputs | grep -A4 "Output.*connected" | grep -E "eDP|LVDS" | awk '{print $3}')
EXTERNAL=$(kscreen-doctor --outputs | grep -A4 "Output.*connected" | grep -v -E "eDP|LVDS" | grep "Output" | awk '{print $3}')

if [[ -z "$EXTERNAL" || -z "$INTERNAL" ]]; then
    kdialog --error "Could not detect both internal and external displays"
    exit 1
fi

# Apply configuration
if [[ "$CHOICE" == "1" ]]; then
    # External only
    kscreen-doctor output.$INTERNAL.disable
    kscreen-doctor output.$EXTERNAL.enable
    kscreen-doctor output.$EXTERNAL.mode.0
    kscreen-doctor output.$EXTERNAL.position.0,0
    kscreen-doctor output.$EXTERNAL.scale.1.01
    kscreen-doctor output.$EXTERNAL.rotation.1
    kscreen-doctor output.$EXTERNAL.primary
elif [[ "$CHOICE" == "2" ]]; then
    # External on left, laptop on right
    kscreen-doctor output.$INTERNAL.enable
    kscreen-doctor output.$EXTERNAL.enable

    kscreen-doctor output.$EXTERNAL.mode.0
    kscreen-doctor output.$INTERNAL.mode.0

    kscreen-doctor output.$EXTERNAL.position.0,0
    kscreen-doctor output.$INTERNAL.position.1920,0  # Assumes external is 1920x1080

    kscreen-doctor output.$EXTERNAL.scale.1
    kscreen-doctor output.$INTERNAL.scale.1

    kscreen-doctor output.$EXTERNAL.rotation.1
    kscreen-doctor output.$INTERNAL.rotation.1

    kscreen-doctor output.$EXTERNAL.primary
else
    kdialog --error "Invalid option selected"
    exit 1
fi
