return {
	{
		"folke/noice.nvim",
		opts = function(_, opts)
			-- Ensure the routes table exists
			opts.routes = opts.routes or {}

			-- Add the custom rule to skip Pyright progress messages
			table.insert(opts.routes, {
				filter = {
					event = "lsp",
					kind = "progress",
					cond = function(message)
						local client = vim.tbl_get(message.opts, "progress", "client")
						return client == "pyright"
					end,
				},
				opts = { skip = true },
			})
		end,
	},
}
