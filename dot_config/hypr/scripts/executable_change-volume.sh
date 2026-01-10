#!/bin/bash
# Change the system audio volume & send a dunst notification indicating the change
# Dependencies:
# - WirePlumber: https://pipewire.pages.freedesktop.org/wireplumber
# - ripgrep: https://github.com/BurntSushi/ripgrep
# - Dunst: https://dunst-project.org

# Set the volume level or mute status
if [[ "$1" == "raise" ]]; then
  wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+
elif [[ "$1" == "lower" ]]; then
  wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%-
elif [[ "$1" == "mute" ]]; then
  wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
fi

# Get the volume level
VOLUME=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2*100)}')
# Get the mute status
MUTE_STATUS=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | rg -o "MUTED" || echo "UNMUTED")

# Set the volume level or mute status icon
if [[ "$VOLUME" -eq 0 || "$MUTE_STATUS" == "MUTED" ]]; then
  LEVEL="muted"
elif [[ "$VOLUME" -le 33 ]]; then
  LEVEL="low"
elif [[ "$VOLUME" -le 66 ]]; then
  LEVEL="medium"
else
  LEVEL="high"
fi

# Send the volume or mute status change notification
dunstify -r 1 \
  -i "/usr/share/icons/Papirus-Dark/24x24/actions/audio-volume-$LEVEL.svg" \
  "Volume" "$VOLUME%" \
  -h int:value:"$VOLUME" \
  -h string:x-dunst-stack-tag:change_volume
