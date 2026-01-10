#!/bin/bash
# Refresh the second monitor by changing its refresh rate
# If the monitor is not refreshed, it quickly turns on and off flashing black
# The issue occurs when the monitor is turned back on after being turned off while the system is on. Happens after "dpms off" turns off the screens on lock screen or suspend.
# Really stupid NVIDIA bug that is never fixed

CURRENT_TIME=$(date +%H)

hyprctl dispatch dpms on
# Reapply hyprsunset, as a current BUG resets the blue light filter when hypridle activates
if [[ ${CURRENT_TIME#0} -ge 20 || ${CURRENT_TIME#0} -le 6 ]]; then
  hyprctl hyprsunset temperature 3400
else
  hyprctl hyprsunset temperature 6500 # Reset the value of temperature to normal
fi
sleep 2
hyprctl keyword monitor "DP-3, 2560x1440@60, -2560x0, 1"
hyprctl keyword monitor "DP-3, 2560x1440@144, -2560x0, 1"
