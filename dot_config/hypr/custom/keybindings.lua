-- *********************************************************************
-- **************************** KEYBINDINGS ****************************
-- *********************************************************************
-- https://wiki.hypr.land/Configuring/Basics/Binds
-- https://wiki.hypr.land/Configuring/Basics/Dispatchers
-- https://wiki.hypr.land/Hypr-Ecosystem/hyprlang/#line-style

hl.config({
	-- https://wiki.hypr.land/Configuring/Basics/Binds
	binds = {
		-- Allow fullscreen to pinned windows & restore their pinned status afterwards
		allow_pin_fullscreen = true,
	},
})

-- Run applications
hl.bind(MainMod .. " + Q", hl.dsp.exec_cmd(Terminal))
hl.bind(MainMod .. " + W", hl.dsp.exec_cmd(Browser))
hl.bind(MainMod .. " + E", hl.dsp.exec_cmd(FileManager))
hl.bind(MainMod .. " + R", hl.dsp.exec_cmd(Menu))
hl.bind(MainMod .. " + Escape", hl.dsp.exec_cmd(ScreenLock))

-- Hyprland actions
hl.bind(MainMod .. " + C", hl.dsp.window.close()) -- Close (not kill) the active window
hl.bind(MainMod .. " + CTRL + N", hl.dsp.exec_cmd("hyprshutdown")) -- Exit the compositor gracefully
hl.bind(MainMod .. " + V", hl.dsp.window.float({ action = "toggle" })) -- Toggle the curent window's floating state
hl.bind(MainMod .. " + P", hl.dsp.window.pseudo({ action = "toggle" })) -- dwindle; Toggle pseudo mode of the current window
hl.bind(MainMod .. " + T", hl.dsp.layout("togglesplit")) -- dwindle: Toggle split (top/side) of the current window
-- Set the focused window to fullscreen mode
hl.bind(MainMod .. " + F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" })) -- KEEP GAPS & BARS
hl.bind(MainMod .. " + CTRL + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" })) -- TAKE ENTIRE SCREEN
hl.bind(MainMod .. " + P", hl.dsp.window.pin()) -- FLOATING ONLY: Pin a window (show on all workspaces)
-- If a window is swallowed by the focused window, unswallow it. Execute again to swallow it back.
hl.bind(MainMod .. " + S", hl.dsp.window.toggle_swallow())
-- Take a screenshot of a manually selected area. Screenshot is copied to clipboard & saved to a file.
-- Notification (-n) is displayed for a certain time (-e) in ms after a screenshot is taken.
-- Screen is frozen (-f) before area selection.
hl.bind("Print", hl.dsp.exec_cmd("grimblast -n -e 5000 -f copysave area"))
hl.bind(MainMod .. " + F8", hl.dsp.exec_cmd("grimblast -n -e 5000 -f copysave area"))
-- Pick a color from the screen using hyprpicker.
-- Output is automatically copied (-a) to the clipboard & is in hex lowercase (-l).
hl.bind("CTRL + Print", hl.dsp.exec_cmd("hyprpicker -a -l"))
hl.bind(MainMod .. " + CTRL + F8", hl.dsp.exec_cmd("hyprpicker -a -l"))
-- Toggle PiP for a Hyprland window (floating)
hl.bind(MainMod .. " + SHIFT + P", hl.dsp.exec_cmd("lua ~/.config/hypr/scripts/toggle-pip.lua"))

-- Move focus with mainMod + arrow keys
hl.bind(MainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(MainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(MainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(MainMod .. " + down", hl.dsp.focus({ direction = "down" }))
-- Move focus with mainMod + Vim keys
hl.bind(MainMod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(MainMod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(MainMod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(MainMod .. " + j", hl.dsp.focus({ direction = "down" }))

-- Swap windows w/ mainMod + SHIFT + arrow keys
hl.bind(MainMod .. " + SHIFT + left", hl.dsp.window.move({ direction = "left" }))
hl.bind(MainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(MainMod .. " + SHIFT + up", hl.dsp.window.move({ direction = "up" }))
hl.bind(MainMod .. " + SHIFT + down", hl.dsp.window.move({ direction = "down" }))
-- Swap windows w/ mainMod + SHIFT + Vim keys
hl.bind(MainMod .. " + SHIFT + h", hl.dsp.window.move({ direction = "left" }))
hl.bind(MainMod .. " + SHIFT + l", hl.dsp.window.move({ direction = "right" }))
hl.bind(MainMod .. " + SHIFT + k", hl.dsp.window.move({ direction = "up" }))
hl.bind(MainMod .. " + SHIFT + j", hl.dsp.window.move({ direction = "down" }))

for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	-- Switch workspaces with mainMod + [0-9]: https://wiki.hypr.land/Configuring/Basics/Dispatchers/#special-workspace
	hl.bind(MainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	-- Move active window to a workspace with mainMod + SHIFT + [0-9]
	hl.bind(MainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Special workspace (scratchpad): https://wiki.hypr.land/Configuring/Dispatchers/#special-workspace
hl.bind(MainMod .. " + CTRL + S", hl.dsp.workspace.toggle_special("scratch"))
hl.bind(MainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:scratch" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(MainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(MainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e+1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging: https://wiki.hypr.land/Configuring/Basics/Binds/#mouse-binds
hl.bind(MainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(MainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Move windows with mainMod + ALT + arrow keys
hl.bind(
	MainMod .. " + ALT + left",
	hl.dsp.window.move({ x = -RESIZE_STEP, y = 0, relative = true }),
	{ repeating = true }
)
hl.bind(
	MainMod .. " + ALT + right",
	hl.dsp.window.move({ x = RESIZE_STEP, y = 0, relative = true }),
	{ repeating = true }
)
hl.bind(
	MainMod .. " + ALT + up",
	hl.dsp.window.move({ x = 0, y = -RESIZE_STEP, relative = true }),
	{ repeating = true }
)
hl.bind(
	MainMod .. " + ALT + down",
	hl.dsp.window.move({ x = 0, y = RESIZE_STEP, relative = true }),
	{ repeating = true }
)
-- Move windows with mainMod + ALT + Vim keys
hl.bind(MainMod .. " + ALT + h", hl.dsp.window.move({ x = -RESIZE_STEP, y = 0, relative = true }), { repeating = true })
hl.bind(MainMod .. " + ALT + l", hl.dsp.window.move({ x = RESIZE_STEP, y = 0, relative = true }), { repeating = true })
hl.bind(MainMod .. " + ALT + k", hl.dsp.window.move({ x = 0, y = -RESIZE_STEP, relative = true }), { repeating = true })
hl.bind(MainMod .. " + ALT + j", hl.dsp.window.move({ x = 0, y = RESIZE_STEP, relative = true }), { repeating = true })
-- Resize windows with mainMod + CTRL + arrow keys
hl.bind(
	MainMod .. " + CTRL + left",
	hl.dsp.window.resize({ x = -RESIZE_STEP, y = 0, relative = true }),
	{ repeating = true }
)
hl.bind(
	MainMod .. " + CTRL + right",
	hl.dsp.window.resize({ x = RESIZE_STEP, y = 0, relative = true }),
	{ repeating = true }
)
hl.bind(
	MainMod .. " + CTRL + up",
	hl.dsp.window.resize({ x = 0, y = -RESIZE_STEP, relative = true }),
	{ repeating = true }
)
hl.bind(
	MainMod .. " + CTRL + down",
	hl.dsp.window.resize({ x = 0, y = RESIZE_STEP, relative = true }),
	{ repeating = true }
)
-- Resize windows with mainMod + CTRL + Vim keys
hl.bind(
	MainMod .. " + CTRL + h",
	hl.dsp.window.resize({ x = -RESIZE_STEP, y = 0, relative = true }),
	{ repeating = true }
)
hl.bind(
	MainMod .. " + CTRL + l",
	hl.dsp.window.resize({ x = RESIZE_STEP, y = 0, relative = true }),
	{ repeating = true }
)
hl.bind(
	MainMod .. " + CTRL + k",
	hl.dsp.window.resize({ x = 0, y = -RESIZE_STEP, relative = true }),
	{ repeating = true }
)
hl.bind(
	MainMod .. " + CTRL + j",
	hl.dsp.window.resize({ x = 0, y = RESIZE_STEP, relative = true }),
	{ repeating = true }
)

-- DWINDLE & MASTER LAYOUT ONLY
-- Change the split ratio of tiled windows
hl.bind(MainMod .. " + CTRL + u", hl.dsp.layout("splitratio -0.1"), { repeating = true })
hl.bind(MainMod .. " + CTRL + o", hl.dsp.layout("splitratio +0.1"), { repeating = true })
-- Switch to a set split ratio
hl.bind(MainMod .. " + CTRL + 1", hl.dsp.layout("splitratio 1.0 exact"))
hl.bind(MainMod .. " + CTRL + 2", hl.dsp.layout("splitratio 1.1 exact"))
hl.bind(MainMod .. " + CTRL + 3", hl.dsp.layout("splitratio 1.2 exact"))
hl.bind(MainMod .. " + CTRL + 4", hl.dsp.layout("splitratio 1.3 exact"))
hl.bind(MainMod .. " + CTRL + 5", hl.dsp.layout("splitratio 1.4 exact"))
hl.bind(MainMod .. " + CTRL + 6", hl.dsp.layout("splitratio 1.5 exact"))
hl.bind(MainMod .. " + CTRL + 7", hl.dsp.layout("splitratio 1.6 exact"))

-- Groups
-- NOTE: Use "hyprctl dispatch --instance 0 "hl.dsp.submap('reset')"" to reset a submap if you get stuck
hl.bind(MainMod .. " + G", hl.dsp.submap("group")) -- Switch to a submap called "group"
-- Start a submap called "group"
hl.define_submap("group", function()
	-- Binds for the "group" submap
	hl.bind(MainMod .. " + t", hl.dsp.group.toggle()) -- Toggle the current active window into a group
	hl.bind(MainMod .. " + n", hl.dsp.window.move({ out_of_group = true })) -- Move the active window out of a group
	-- Move active window into a group in a specified direction using mainMod + arrow keys
	hl.bind(MainMod .. " + left", hl.dsp.window.move({ into_group = "left" }))
	hl.bind(MainMod .. " + right", hl.dsp.window.move({ into_group = "right" }))
	hl.bind(MainMod .. " + up", hl.dsp.window.move({ into_group = "up" }))
	hl.bind(MainMod .. " + down", hl.dsp.window.move({ into_group = "down" }))
	-- Move active window into a group in a specified direction using mainMod + Vim keys
	hl.bind(MainMod .. " + h", hl.dsp.window.move({ into_group = "left" }))
	hl.bind(MainMod .. " + l", hl.dsp.window.move({ into_group = "right" }))
	hl.bind(MainMod .. " + k", hl.dsp.window.move({ into_group = "up" }))
	hl.bind(MainMod .. " + j", hl.dsp.window.move({ into_group = "down" }))
	-- Reset the submap "group"
	hl.bind("escape", hl.dsp.submap("reset"))
	hl.bind("CTRL + bracketleft", hl.dsp.submap("reset"))
end)
-- Switch to the next window in a group
hl.bind(MainMod .. " + u", hl.dsp.group.prev())
hl.bind(MainMod .. " + o", hl.dsp.group.next())
-- Swap the active window w/ the next or previous in a group
hl.bind(MainMod .. " + SHIFT + u", hl.dsp.group.move_window({ forward = false }))
hl.bind(MainMod .. " + SHIFT + o", hl.dsp.group.move_window({ forward = true }))

-- Switch between dwindle, master, scrolling, & monocole layouts
-- https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout
hl.bind(MainMod .. " + D", hl.dsp.exec_cmd("hyprctl eval \"hl.config({ general = { layout = 'dwindle' } })\""))
-- https://wiki.hypr.land/Configuring/Layouts/Master-Layout
hl.bind(MainMod .. " + SHIFT + D", hl.dsp.exec_cmd("hyprctl eval \"hl.config({ general = { layout = 'master' } })\""))
-- https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout
hl.bind(MainMod .. " + Z", hl.dsp.exec_cmd("hyprctl eval \"hl.config({ general = { layout = 'scrolling' } })\""))
-- https://wiki.hypr.land/Configuring/Layouts/Monocle-Layout
hl.bind(MainMod .. " + X", hl.dsp.exec_cmd("hyprctl eval \"hl.config({ general = { layout = 'monocle' } })\""))

-- SCROLLING LAYOUT ONLY
hl.bind(MainMod .. " + comma", hl.dsp.layout("move -col")) -- Move the layout horizontally to the previous column
hl.bind(MainMod .. " + period", hl.dsp.layout("move +col")) -- Move the layout horizontally to the next column
hl.bind(MainMod .. " + SHIFT + comma", hl.dsp.layout("swapcol l")) -- Swap the current column with its left neighbor
hl.bind(MainMod .. " + SHIFT + period", hl.dsp.layout("swapcol r")) -- Swap the current column with its right neighbor

-- MONOCLE LAYOUT SUBMAP
hl.bind(MainMod .. " + SHIFT + X", hl.dsp.submap("monocle")) -- Switch to a submap called "monocle"
-- Start a submap called "monocle"
hl.define_submap("monocle", function()
	-- Binds for the "monocle" submap
	hl.bind("u", hl.dsp.layout("cycleprev")) -- Cycle to the previous window
	hl.bind("o", hl.dsp.layout("cyclenext")) -- Cycle to the next window
	-- Reset the submap "monocle"
	hl.bind("escape", hl.dsp.submap("reset"))
	hl.bind("CTRL + bracketleft", hl.dsp.submap("reset"))
end)

-- Multimedia keys for volume and LCD brightness: https://wiki.hypr.land/Configuring/Basics/Binds/#media
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("lua ~/.config/hypr/scripts/change-volume.lua 'raise'"),
	{ repeating = true, locked = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("lua ~/.config/hypr/scripts/change-volume.lua 'lower'"),
	{ repeating = true, locked = true }
)
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("lua ~/.config/hypr/scripts/change-volume.lua 'mute'"), { locked = true })
hl.bind(MainMod .. " + F9", hl.dsp.exec_cmd("lua ~/.config/hypr/scripts/change-volume.lua 'mute'"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("lua ~/.config/hypr/scripts/toggle-mic-mute.lua"), { locked = true })
hl.bind(MainMod .. " + F10", hl.dsp.exec_cmd("lua ~/.config/hypr/scripts/toggle-mic-mute.lua"), { locked = true })
-- Requires brightnessctl
hl.bind(
	"XF86MonBrightnessUp",
	hl.dsp.exec_cmd("lua ~/.config/hypr/scripts/change-brightness.lua 'raise'"),
	{ repeating = true, locked = true }
)
hl.bind(
	"XF86MonBrightnessDown",
	hl.dsp.exec_cmd("lua ~/.config/hypr/scripts/change-brightness.lua 'lower'"),
	{ repeating = true, locked = true }
)
hl.bind(
	MainMod .. " + F2",
	hl.dsp.exec_cmd("lua ~/.config/hypr/scripts/change-brightness.lua 'raise'"),
	{ repeating = true, locked = true }
)
hl.bind(
	MainMod .. " + F1",
	hl.dsp.exec_cmd("lua ~/.config/hypr/scripts/change-brightness.lua 'lower'"),
	{ repeating = true, locked = true }
)
-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
-- Mute/unmute the currently active window
hl.bind(
	MainMod .. " + M",
	hl.dsp.exec_cmd("lua ~/.config/hypr/scripts/change-window-mute.lua 'mute'"),
	{ locked = true }
)
hl.bind(
	MainMod .. " + SHIFT + M",
	hl.dsp.exec_cmd("lua ~/.config/hypr/scripts/change-window-mute.lua 'unmute'"),
	{ locked = true }
)

-- Restore laptop to native 3:2 (3000x2000) for standalone use
hl.bind(
	MainMod .. " + SHIFT + F9",
	hl.dsp.exec_cmd(
		'hyprctl eval \'hl.monitor({ output = "eDP-1", mode = "3000x2000@60", position = "0x0", scale = 2, })\''
	)
)
-- Switch laptop to 16:9 (1080p) for external mirroring
hl.bind(
	MainMod .. " + SHIFT + F10",
	hl.dsp.exec_cmd(
		'hyprctl eval \'hl.monitor({ output = "eDP-1", mode = "1920x1080@60", position = "0x0", scale = 1, })\''
	)
)
