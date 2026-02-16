#!/bin/bash
# Toggle the currently active window mute status & send a dunst notification indicating the change
# Dependencies:
# - WirePlumber: https://pipewire.pages.freedesktop.org/wireplumber
# - jq: https://jqlang.org
# - Dunst: https://dunst-project.org

# Toggle the mute status of the currently active window
wpctl set-mute -p "$(hyprctl activewindow -j | jq ".pid")" toggle

# Get the name of the currently active window
ACTIVE_WINDOW=$(hyprctl activewindow -j | jq ".initialTitle")
ACTIVE_WINDOW=${ACTIVE_WINDOW:1:-1}

# Send the window mute status change notification
dunstify -r 1 \
  -i "/usr/share/icons/Papirus-Dark/24x24/actions/audio-volume-muted.svg" \
  "$ACTIVE_WINDOW" "Mute Toggled" \
  -h string:x-dunst-stack-tag:toggle_window_mute
