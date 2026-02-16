#!/bin/bash
# Change the active window mute status & send a dunst notification indicating the change
# Dependencies:
# - WirePlumber: https://pipewire.pages.freedesktop.org/wireplumber
# - jq: https://jqlang.org
# - Dunst: https://dunst-project.org

if [[ "$1" == "mute" ]]; then
  # Mute the active window
  wpctl set-mute -p "$(hyprctl activewindow -j | jq ".pid")" 1
  LEVEL="muted"
  MUTE_STATUS="Muted"
elif [[ "$1" == "unmute" ]]; then
  # Unmute the active window
  wpctl set-mute -p "$(hyprctl activewindow -j | jq ".pid")" 0
  LEVEL="high"
  MUTE_STATUS="Unmuted"
fi

# Get the name of the active window
ACTIVE_WINDOW_TITLE=$(hyprctl activewindow -j | jq ".initialTitle")
ACTIVE_WINDOW_TITLE=${ACTIVE_WINDOW_TITLE:1:-1}

# Send the active window mute status change notification
dunstify -r 1 \
  -i "/usr/share/icons/Papirus-Dark/24x24/actions/audio-volume-$LEVEL.svg" \
  "$ACTIVE_WINDOW_TITLE" "$MUTE_STATUS" \
  -h string:x-dunst-stack-tag:change_window_mute
