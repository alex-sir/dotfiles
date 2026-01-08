require("zoxide"):setup({
	update_db = true,
})

-- full-border (https://github.com/yazi-rs/plugins/tree/main/full-border.yazi)
require("full-border"):setup()

-- Show username and hostname in header (https://yazi-rs.github.io/docs/tips/#username-hostname-in-header)
Header:children_add(function()
	if ya.target_family() ~= "unix" then
		return ""
	end

	local prompt_fg = "#ff6685"
	return ui.Span(ya.user_name() .. "@" .. ya.host_name() .. ":"):fg(prompt_fg)
end, 500, Header.LEFT)

-- Show user/group of files in status bar (https://yazi-rs.github.io/docs/tips/#user-group-in-status)
Status:children_add(function()
	local h = cx.active.current.hovered
	if not h or ya.target_family() ~= "unix" then
		return ""
	end

	local ownership_fg = "#ff8a5c"
	return ui.Line({
		ui.Span(ya.user_name(h.cha.uid) or tostring(h.cha.uid)):fg(ownership_fg),
		":",
		ui.Span(ya.group_name(h.cha.gid) or tostring(h.cha.gid)):fg(ownership_fg),
		" ",
	})
end, 500, Status.RIGHT)
