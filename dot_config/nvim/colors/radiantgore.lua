local black = "#0a0a08" -- Background
local white = "#cacace"

-- Grays
local dark_gray = "#4b4b53"
local mid_light_gray = "#9999a3" -- Comments

local red = "#ff6685" -- Foreground: Primary color
local green = "#1fcc00"
local yellow = "#dbc500"
local blue = "#66b2f0"
local purple = "#d97bfe"
local orange = "#ff8a5c"
local cyan = "#00ccf0"

local palette = {
	-- Backgrounds & accents
	base00 = black, -- Main background
	base01 = black, -- Secondary backgrounds (status bar, line number, folding marks)
	base02 = dark_gray, -- Visual selection, inactive status line
	base03 = mid_light_gray, -- Comments, invisibles, line highlighting
	base04 = red, -- Cursor line number, folded code, subtle accents

	-- Foregrounds & accents
	base05 = red, -- Main foreground, variables, operators, NORMAL mode
	base06 = orange, -- Secondary foreground (keywords, active elements, focused items)
	base07 = cyan, -- Miscellaneous highlights
	base08 = blue, -- Errors, exceptions, delete diffs, alerts

	-- Code & notifications
	base09 = green, -- Warnings, special constants, modified diffs, current search highlight
	base0A = orange, -- Functions, variable types, numbers, info messages, headings
	base0B = purple, -- Strings, booleans, add diffs, insert diffs, success, INSERT mode
	base0C = orange, -- Types, regular expressions, links, code block line, VISUAL mode
	base0D = red, -- Classes, functions, definitions, LazyVim ASCII art
	base0E = yellow, -- Specials, tags
	base0F = white, -- Symbols ([] {} ; ,), other errors
}

require("mini.base16").setup({
	palette = palette,
	use_cterm = true,
})

vim.o.background = "dark"
vim.g.colors_name = "radiantgore"
