#!/usr/bin/env lua
-- Change the system brightness & send a dunst notification indicating the change
-- Dependencies:
--  brightnessctl: https://github.com/Hummer12007/brightnessctl
--  Dunst: https://dunst-project.org

local action = arg[1]

-- Set the brightness level
if action == "raise" then
	os.execute("brightnessctl -e4 -n2 set 5%+")
elseif action == "lower" then
	os.execute("brightnessctl -e4 -n2 set 5%-")
end

-- Get the current brightness level
local f_current = io.popen("brightnessctl g")
local current
if f_current ~= nil then
	current = tonumber(f_current:read("*all"))
	f_current:close()
end

-- Get the maximum brightness level
local f_max = io.popen("brightnessctl m")
local max
if f_max ~= nil then
	max = tonumber(f_max:read("*all"))
	f_max:close()
end

if current and max then
	local percent = math.floor((current * 100 / max) + 0.5)

	-- Send the brightness change notification
	local icon = "/usr/share/icons/Papirus-Dark/16x16/actions/brightnesssettings.svg"
	local cmd = string.format(
		'dunstify -r 1 -i "%s" "Brightness" "%d%%" -h int:value:"%d" -h string:x-dunst-stack-tag:change_brightness',
		icon,
		percent,
		percent
	)
	os.execute(cmd)
end
