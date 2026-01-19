#!/bin/bash
# CUSTOM WAYBAR MODULE (custom/vpn)
# Determine if there is a WireGuard connection to a VPN & print text for use with Waybar
# Dependencies:
# - networkmanager: https://networkmanager.dev
# - ripgrep: https://github.com/BurntSushi/ripgrep
# - waybar: https://github.com/Alexays/Waybar
# - wireguard: https://www.wireguard.com

if nmcli c show --active | rg -q wireguard; then
  NAME=$(nmcli c show --active | rg wireguard | awk '{print $1}') # Name of the VPN
  IPV4=$(ip -br -4 addr show "$NAME" | awk '{print $3}')          # IPv4 address of the VPN
  echo '{"text": "   '"$NAME"'", "tooltip": "'"$IPV4"'"}'
else
  echo '{"text": "   VPN"}'
fi
