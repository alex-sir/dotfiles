#!/bin/bash
# Refresh the second monitor by changing its refresh rate
# If the monitor is not refreshed, it quickly turns on and off flashing black
# The issue occurs when the monitor is turned back on after being turned off while the system is on. Happens after "dpms off" turns off the screens on lock screen or suspend.
# Really stupid NVIDIA bug that is never fixed

hyprctl dispatch dpms on
sleep 3
hyprctl keyword monitor "DP-3, 2560x1440@60, -2560x0, 1"
hyprctl keyword monitor "DP-3, 2560x1440@144, -2560x0, 1"
