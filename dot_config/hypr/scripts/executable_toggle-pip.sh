#!/bin/bash
# Toggle picture-in-picture (PiP) for a Hyprland window
# Resizes the window to a small size, moves it to the bottom right, & pins it

hyprctl dispatch togglefloating
hyprctl dispatch resizeactive exact 550 310
hyprctl dispatch movewindowpixel exact -552 1128, activewindow
hyprctl dispatch pin
