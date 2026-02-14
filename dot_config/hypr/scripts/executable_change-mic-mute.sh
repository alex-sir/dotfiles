#!/bin/bash
# Change the microphone mute status & send a dunst notification indicating the change
# Dependencies:
# - WirePlumber: https://pipewire.pages.freedesktop.org/wireplumber
# - ripgrep: https://github.com/BurntSushi/ripgrep
# - Dunst: https://dunst-project.org

# Toggle the mute status of the default microphone
wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle

# Get the mute status
MUTE_STATUS=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | rg -o "MUTED" || echo "UNMUTED")

if [[ "$MUTE_STATUS" == "MUTED" ]]; then
  # Send the microphone mute status change notification
  dunstify -r 1 \
    -i "/usr/share/icons/Papirus/16x16/panel/discord-tray-muted.svg" \
    "Microphone" "Muted" \
    -h string:x-dunst-stack-tag:change_mic_mute
elif [[ "$MUTE_STATUS" == "UNMUTED" ]]; then
  dunstify -r 1 \
    -i "/usr/share/icons/Papirus-Dark/16x16/devices/audio-input-microphone.svg" \
    "Microphone" "Unmuted" \
    -h string:x-dunst-stack-tag:change_mic_mute
fi
