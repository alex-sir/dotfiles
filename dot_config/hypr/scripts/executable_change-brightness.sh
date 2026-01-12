#!/bin/bash
# Change the system brightness & send a dunst notification indicating the change
# Dependencies:
# - brightnessctl: https://github.com/Hummer12007/brightnessctl
# - ripgrep: https://github.com/BurntSushi/ripgrep
# - Dunst: https://dunst-project.org

# Set the brightness level
if [[ "$1" == "raise" ]]; then
  brightnessctl -e4 -n2 set 5%+
elif [[ "$1" == "lower" ]]; then
  brightnessctl -e4 -n2 set 5%-
fi

# Get the brightness level
BRIGHTNESS_CURRENT=$(brightnessctl g)
BRIGHTNESS_MAX=$(brightnessctl m)
BRIGHTNESS_PERCENT=$((BRIGHTNESS_CURRENT * 100 / BRIGHTNESS_MAX))

# Send the brightness change notification
dunstify -r 1 \
  -i "/usr/share/icons/Papirus-Dark/16x16/actions/brightnesssettings.svg" \
  "Brightness" "$BRIGHTNESS_PERCENT%" \
  -h int:value:"$BRIGHTNESS_PERCENT" \
  -h string:x-dunst-stack-tag:change_brightness
