#!/bin/bash

# Toggle system audio between the laptop speakers and the LG TV connected over HDMI.
# The built-in Realtek card can only run one output profile at a time, so "using
# the TV's speakers" means switching the card's ACP profile to the HDMI port the
# TV is plugged into (found by matching device.product.name), then moving any
# already-running audio streams (e.g. a live screen share) onto the new sink.

LOG="$HOME/.cache/tv-audio.log"
exec &>> "$LOG"
echo "--- Running at $(date) ---"

export DISPLAY=:0
export XDG_SESSION_TYPE=wayland
export WAYLAND_DISPLAY=wayland-0

CARD=$(pactl -f json list cards | python3 -c "
import json, sys
cards = json.load(sys.stdin)
for c in cards:
    if 'pci-0000_00_1f.3' in c.get('name', ''):
        print(c['name'])
        break
")

if [[ -z "$CARD" ]]; then
    kdialog --error "Could not find the built-in audio card."
    exit 1
fi

find_tv_profile() {
    pactl -f json list cards | python3 -c "
import json, sys
cards = json.load(sys.stdin)
for c in cards:
    if c['name'] != '$CARD':
        continue
    for port in c.get('ports', {}).values():
        name = (port.get('properties', {}).get('device.product.name') or '')
        if 'tv' in name.lower():
            for profile in port.get('profiles', []):
                if profile.startswith('output:hdmi-stereo') and profile.endswith('+input:analog-stereo') and 'surround' not in profile:
                    print(profile)
                    sys.exit(0)
"
}

sink_for_card() {
    pactl -f json list sinks | python3 -c "
import json, sys
sinks = json.load(sys.stdin)
for s in sinks:
    if s.get('properties', {}).get('device.name') == '$CARD':
        print(s['name'])
        sys.exit(0)
"
}

move_streams_to() {
    local sink="$1"
    pactl list short sink-inputs | awk '{print $1}' | while read -r id; do
        pactl move-sink-input "$id" "$sink"
    done
}

switch_to_tv() {
    local profile
    profile=$(find_tv_profile)
    if [[ -z "$profile" ]]; then
        kdialog --error "TV not detected. Make sure it's connected and on over HDMI."
        exit 1
    fi

    pactl set-card-profile "$CARD" "$profile" || { kdialog --error "Failed to switch audio profile."; exit 1; }

    local sink
    sink=$(sink_for_card)
    if [[ -z "$sink" ]]; then
        kdialog --error "Switched profile but couldn't find the TV sink."
        exit 1
    fi

    pactl set-default-sink "$sink"
    move_streams_to "$sink"
    kdialog --passivepopup "Audio switched to TV" 4
}

switch_to_laptop() {
    local profile="output:analog-stereo+input:analog-stereo"
    pactl set-card-profile "$CARD" "$profile" || { kdialog --error "Failed to switch audio profile."; exit 1; }

    local sink
    sink=$(sink_for_card)
    if [[ -z "$sink" ]]; then
        kdialog --error "Switched profile but couldn't find the laptop sink."
        exit 1
    fi

    pactl set-default-sink "$sink"
    move_streams_to "$sink"
    kdialog --passivepopup "Audio switched to laptop speakers" 4
}

CHOICE=$(kdialog --menu "TV Audio" \
    "1" "Switch to TV Audio (HDMI)" \
    "2" "Revert to Laptop Audio")

case "$CHOICE" in
    1) switch_to_tv ;;
    2) switch_to_laptop ;;
    *) exit 1 ;;
esac
