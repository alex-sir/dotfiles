-- *********************************************************************
-- *************************** LOOK AND FEEL ***************************
-- *********************************************************************
-- https://wiki.hypr.land/Configuring/Variables

hl.config({
	-- https://wiki.hypr.land/Configuring/Variables/#general
	general = {
		border_size = 2, -- Size of the border around windows

		gaps_in = 7, -- Gaps between windows
		gaps_out = { 1, GAPS_OUT, GAPS_OUT, GAPS_OUT }, -- Gaps between windows & monitor edges

		-- Info about colors: https://wiki.hypr.land/Configuring/Variables/#variable-types
		col = {
			inactive_border = GRAY, -- Border color for inactive windows
			active_border = DARK_RED, -- Border color for active window
		},

		layout = "dwindle", -- Layout to use (dwindle/master)

		resize_on_border = false, -- Enables resizing windows by clicking & dragging borders & gaps

		-- https://wiki.hypr.land/Configuring/Tearing
		allow_tearing = false, -- Allow for tearing. Reduces input lag but potentially introduces split images.
	},

	-- https://wiki.hypr.land/Configuring/Variables/#decoration
	decoration = {
		rounding = 15, -- Rounded corners' radius
		rounding_power = 2.0, -- Curve used for rounding corners, larger is smoother

		-- Transparency of focused and unfocused windows
		active_opacity = 1.0,
		inactive_opacity = 1.0,

		-- https://wiki.hypr.land/Configuring/Variables/#blur
		blur = {
			enabled = true, -- Enable kawase window background blur

			-- Set the distance & quality of the blur
			size = 6,
			passes = 4,

			ignore_opacity = 1, -- Blur layer ignores opacity of the window
			new_optimizations = 1, -- Further optimizations to the blur effect

			noise = 0.01,
			contrast = 1.0,
			brightness = 1.0,
			vibrancy = 0.1696, -- Saturation of blurred colors
		},

		-- https://wiki.hypr.land/Configuring/Variables/#shadow
		shadow = {
			enabled = true, -- Enable drop shadows on windows
			range = 5,
			render_power = 3, -- Power to render falloff (> means faster falloff)
			color = BLACK_TRANSLUCENT,
		},
	},

	-- https://wiki.hypr.land/Configuring/Variables/#group
	group = {
		col = {
			border_active = DARK_ORANGE, -- Active group border color
			border_inactive = GRAY, -- Inactive (out of focus) group border color
		},

		-- Bar at the top of a group showing the different windows
		groupbar = {
			font_family = FONT,
			font_size = 14,
			font_weight_active = "bold", -- Font weight of active groupbar title
			height = 15, -- Height of the groupbar
			indicator_gap = 3, -- Height of gap between groupbar indicator and title
			indicator_height = 4, -- Height of the groupbar indicator
			text_offset = 6, -- Adjust vertical position for titles
			rounding = 5, -- How much to round the indicator
			round_only_edges = false, -- Whether to round only the indicator edges of the entire groupbar
			text_color = RED, -- Color for active window title in the groupbar
			text_color_inactive = WHITE, -- Color for inactive window title in the groupbar
			col = {
				active = RED, -- Active group bar background color
				inactive = MID_LIGHT_GRAY, -- Inactive (out of focus) group bar background color
			},
			gaps_in = 20, -- Gap size between gradients
			gaps_out = 4, -- Gap size between gradients and window
		},
	},

	animations = {
		enabled = true,
	},

	-- https://wiki.hypr.land/Configuring/Dwindle-Layout
	dwindle = {
		preserve_split = true, -- Split (side/top) will not change
	},

	-- https://wiki.hypr.land/Configuring/Master-Layout
	master = {
		-- master: new window becomes master
		-- slave: new windows are added to slave stack
		-- inherit: inherit from focused windows
		new_status = "slave",
	},

	-- https://wiki.hypr.land/Configuring/Scrolling-Layout
	scrolling = {
		fullscreen_on_one_column = true, -- Single column on a workspace will span the entire screen
		column_width = 0.5, -- Default width of a column
	},

	-- https://wiki.hypr.land/Configuring/Variables/#misc
	misc = {
		font_family = FONT, -- Global default font to render text, including config error messages
		disable_hyprland_logo = false, -- Disable the random Hyprland logo/anime girl background
		force_default_wallpaper = -1, -- Set to 0 or 1 to disable the anime mascot wallpapers
		enable_swallow = true, -- Enable window swallowing
		swallow_regex = "^(kitty)$", -- Regex to be used for windows that should be swallowed
	},
})

-- Animations: https://wiki.hypr.land/Configuring/Variables/#animations
-- Curves: https://wiki.hypr.land/Configuring/Animations/#curves
-- Easing functions: https://easings.net
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("easeInOutCirc", { type = "bezier", points = { { 0.85, 0 }, { 0.15, 1 } } })
hl.curve("easeInOutQuart", { type = "bezier", points = { { 0.76, 0 }, { 0.24, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

-- Animations: https://wiki.hypr.land/Configuring/Animations
hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
-- Windows
hl.animation({ leaf = "windows", enabled = true, speed = 3.25, bezier = "easeInOutQuart" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 3.75, bezier = "easeInOutCirc", style = "gnomed" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 4.1, bezier = "easeInOutCirc", style = "slide" })
-- Layers
hl.animation({ leaf = "layers", enabled = true, speed = 3.6, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 3.65, bezier = "easeOutQuint", style = "popin" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 3.5, bezier = "easeInOutQuart", style = "popin" })
-- Fade
hl.animation({ leaf = "fade", enabled = true, speed = 3, bezier = "quick" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 3.1, bezier = "easeInOutCubic" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 3.6, bezier = "easeInOutCubic" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 3.2, bezier = "easeInOutCubic" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 3.1, bezier = "easeInOutCubic" })
-- Border color switch speed
hl.animation({ leaf = "border", enabled = true, speed = 6.8, bezier = "easeOutQuint" })
-- Workspaces
hl.animation({
	leaf = "workspaces",
	enabled = true,
	speed = 3.45,
	bezier = "easeInOutCirc",
	style = "slidefade",
})
hl.animation({
	leaf = "workspacesIn",
	enabled = true,
	speed = 3.2,
	bezier = "easeInOutCirc",
	style = "slidefade",
})
hl.animation({
	leaf = "workspacesOut",
	enabled = true,
	speed = 3.7,
	bezier = "easeInOutCirc",
	style = "slidefade",
})
hl.animation({
	leaf = "specialWorkspaceIn",
	enabled = true,
	speed = 3.2,
	bezier = "easeInOutCirc",
	style = "slidefade",
})
hl.animation({
	leaf = "specialWorkspaceOut",
	enabled = true,
	speed = 3.7,
	bezier = "easeInOutCirc",
	style = "slidefade",
})
-- Screen zoom
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })

-- https://wiki.hypr.land/Configuring/Workspace-Rules
-- w[tv1]: Reduce gaps when there is a single (1) tiled (t) & visible (v) window
hl.workspace_rule({ workspace = "w[tv1]", gaps_in = 0, gaps_out = 1 }) -- Window (w) counts on the workspace
-- f[1]: Reduce gaps when there is a maximized window
hl.workspace_rule({ workspace = "f[1]", gaps_in = 0, gaps_out = 1 }) -- Fullscreen (f) state of the workspace
-- Completely remove the border highlight and rounded corners for w[tv1]
hl.window_rule({
	name = "no-gaps-wtv1",
	match = {
		float = false,
		workspace = "w[tv1]",
	},
	border_size = 0,
	rounding = 0,
})
-- Completely remove the border highlight and rounded corners for f[1]
hl.window_rule({
	name = "no-gaps-f1",
	match = {
		-- float = false,
		workspace = "f[1]",
	},
	border_size = 0,
	rounding = 0,
})
