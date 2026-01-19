-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.cmd("colorscheme radiantgore") -- load the 'radiantgore' theme (colors/radiantgore.lua)
-- Customize the window separator
vim.api.nvim_set_hl(0, "WinSeparator", {
	bg = "none", -- Transparent background
	fg = "#ff6685", -- Separator color
})
-- Customize yank flash color (overrides default IncSearch)
vim.api.nvim_set_hl(0, "IncSearch", {
	bg = "none", -- Transparent background
	fg = "#ff8a5c", -- Orange text
})
