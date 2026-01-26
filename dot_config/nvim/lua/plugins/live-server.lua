return {
	{
		--[[ NOTE:
      The "live-server" package from npm is required for this plugin to work
		  https://www.npmjs.com/package/live-server
		  Install with "sudo npm install -g live-server"
		--]]
		"barrettruth/live-server.nvim",
		cmd = { "LiveServerStart", "LiveServerStop", "LiveServerToggle" },
	},
}
