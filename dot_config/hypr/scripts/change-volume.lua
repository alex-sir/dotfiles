#!/usr/bin/env lua
-- Change the system audio volume & send a dunst notification indicating the change
-- Dependencies:
--  WirePlumber: https://pipewire.pages.freedesktop.org/wireplumber
--  Dunst: https://dunst-project.org

local action = arg[1]

-- Set the volume level or mute status
if action == "raise" then
	os.execute("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+")
elseif action == "lower" then
	os.execute("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%-")
elseif action == "mute" then
	os.execute("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle")
end

-- Get the volume level and mute status
local f = io.popen("wpctl get-volume @DEFAULT_AUDIO_SINK@")
local output
if f ~= nil then
	output = f:read("*all")
	f:close()
end

-- Output format is usually "Volume: 0.45" or "Volume: 0.45 [MUTED]"
local volume_val = output:match("Volume:%s+([%d%.]+)")
local is_muted = output:find("MUTED") ~= nil

local volume = 0
if volume_val then
	volume = math.floor((tonumber(volume_val) * 100) + 0.5)
end

-- Set the volume level or mute status icon
local level = "high"
if volume == 0 or is_muted then
	level = "muted"
elseif volume <= 33 then
	level = "low"
elseif volume <= 66 then
	level = "medium"
end

-- Send the volume or mute status change notification
local icon = string.format("/usr/share/icons/Papirus-Dark/24x24/actions/audio-volume-%s.svg", level)
local cmd = string.format(
	'dunstify -r 1 -i "%s" "Volume" "%d%%" -h int:value:"%d" -h string:x-dunst-stack-tag:change_volume',
	icon,
	volume,
	volume
)
os.execute(cmd)
