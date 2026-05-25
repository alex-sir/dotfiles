#!/usr/bin/env lua
-- Change the active window mute status & send a dunst notification indicating the change
-- Dependencies:
--  WirePlumber: https://pipewire.pages.freedesktop.org/wireplumber
--  Dunst: https://dunst-project.org

local action = arg[1]

-- Get the active window details via hyprctl
local f_win = io.popen("hyprctl activewindow -j")
local out_win
if f_win ~= nil then
	out_win = f_win:read("*all")
	f_win:close()
end

local pid = out_win:match('"pid":%s*(%d+)')
local initial_title = out_win:match('"initialTitle":%s*"([^"]+)"') or "Active Window"

local level = "muted"
local mute_status = "Muted"

if action == "mute" then
	if pid then
		os.execute(string.format("wpctl set-mute -p %s 1", pid))
	end
	level = "muted"
	mute_status = "Muted"
elseif action == "unmute" then
	if pid then
		os.execute(string.format("wpctl set-mute -p %s 0", pid))
	end
	level = "high"
	mute_status = "Unmuted"
end

-- Send the active window mute status change notification
local icon = string.format("/usr/share/icons/Papirus-Dark/24x24/actions/audio-volume-%s.svg", level)
local cmd = string.format(
	'dunstify -r 1 -i "%s" "%s" "%s" -h string:x-dunst-stack-tag:change_window_mute',
	icon,
	initial_title,
	mute_status
)
os.execute(cmd)
