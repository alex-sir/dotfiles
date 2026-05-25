#!/usr/bin/env lua
-- Toggle the microphone mute status & send a dunst notification indicating the change
-- Dependencies:
--  WirePlumber: https://pipewire.pages.freedesktop.org/wireplumber
--  Dunst: https://dunst-project.org

-- Toggle the mute status of the default microphone
os.execute("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle")

local f = io.popen("wpctl get-volume @DEFAULT_AUDIO_SOURCE@")
local output
if f ~= nil then
	output = f:read("*all")
	f:close()
end

-- Get the mute status
local is_muted = output:find("MUTED") ~= nil

local icon, status
if is_muted then
	icon = "/usr/share/icons/Papirus/16x16/panel/discord-tray-muted.svg"
	status = "Muted"
else
	icon = "/usr/share/icons/Papirus-Dark/16x16/devices/audio-input-microphone.svg"
	status = "Unmuted"
end

-- Send the microphone mute status change notification
local cmd =
	string.format('dunstify -r 1 -i "%s" "Microphone" "%s" -h string:x-dunst-stack-tag:toggle_mic_mute', icon, status)
os.execute(cmd)
