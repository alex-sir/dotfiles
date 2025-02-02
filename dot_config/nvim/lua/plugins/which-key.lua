return {
  "folke/which-key.nvim",
  opts = function(_, opts)
    opts.icons = {
      rules = {
        { pattern = "yazi", icon = "󰇥 ", color = "yellow" },
        { pattern = "typr", icon = " ", color = "orange" },
      },
    }
  end,
}
