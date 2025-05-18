return {
	"folke/snacks.nvim",
	opts = {
		dashboard = {
			preset = {
				header = [[
______
.-"      "-.
/            \
_          |              |          _
( \         |,  .-.  .-.  ,|         / )
> "=._     | )(__/  \__)( |     _.=" <
(_/"=._"=._ |/     /\     \| _.="_.="\_)
"=._ (_     ^^     _)"_.="
"=\__|IIIIII|__/="
_.="| \IIIIII/ |"=._
_     _.="_.="\          /"=._"=._     _
( \_.="_.="     `--------`     "=._"=._/ )
> _.="                            "=._ <
(_/               *a x c               \_)
 ]],
			},
			sections = {
				{ section = "header" },
				{ icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
				{ icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
				{ icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
				{ section = "startup" },
			},
		},
	},
}
