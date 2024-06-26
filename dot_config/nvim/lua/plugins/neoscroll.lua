return {
  "karb94/neoscroll.nvim",
  config = function()
    require("neoscroll").setup({
      mappings = { -- Keys to be mapped to their corresponding default scrolling animation
        "<C-u>", -- scroll the window up by half a page
        "<C-d>", -- scroll the window down by half a page
        "<C-b>", -- scroll the window up by one page (backward)
        "<C-f>", -- scroll the window down by one page (forward)
        "<C-y>", -- scroll the window up by one line
        "<C-e>", -- scroll the window down by one line
        "zt", -- scroll the window so the current line is at the top of screen
        "zz", -- scroll the window so the current line is in the middle of the screen
        "zb", -- scroll the window so the current line is at the bottom of the screen
      },
      hide_cursor = false, -- Hide cursor while scrolling
      stop_eof = true, -- Stop at <EOF> when scrolling downwards
      respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
      cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
      easing = "linear", -- Default easing function
      pre_hook = nil, -- Function to run before the scrolling animation starts
      post_hook = nil, -- Function to run after the scrolling animation ends
      performance_mode = false, -- Disable "Performance Mode" on all buffers.
    })
  end,
}
