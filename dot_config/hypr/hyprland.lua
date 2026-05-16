-- https://wiki.hypr.land/Configuring/Start

-- *********************************************************************
-- ***************************** VARIABLES *****************************
-- *********************************************************************

-- Programs that are commonly used
-- https://wiki.hypr.land/Hypr-Ecosystem/hyprlang/#line-style
Terminal = "kitty"
Browser = "firefox"
FileManager = "kitty yazi"
Menu = "hyprlauncher"
ScreenLock = "hyprlock"

-- Gap sizes
GAPS_OUT = 14

-- Color Theme: Radiant Gore
-- NOTE: In Lua, colors are generally passed as 0xAARRGGBB hex values
BLACK_TRANSLUCENT = 0xcc0a0a08 -- 0.8 opacity
WHITE = 0xffcacace
GRAY = 0xff5c5c66
MID_LIGHT_GRAY = 0xff9999a3
RED = 0xffff6685
DARK_RED = 0xffff2450
DARK_ORANGE = 0xffff6d33

-- Fonts
FONT = "Noto Sans"

-- Set "Windows" key as main modifier
MainMod = "SUPER"

-- Number of pixels to move & resize windows
RESIZE_STEP = 40

-- *********************************************************************
-- **************************** CUSTOM FILES ***************************
-- *********************************************************************

require("custom.monitors")
require("custom.autostart")
require("custom.environmentvariables")
require("custom.lookandfeel")
require("custom.input")
require("custom.keybindings")
require("custom.windowsandworkspaces")
