if vim.g.neovide then
	vim.print("Neovide version:" .. vim.g.neovide_version)
	vim.g.neovide_input_use_logo = true -- this will make cmd+tab work
	vim.g.neovide_cursor_vfx_mode = "torpedo"
	vim.g.neovide_cursor_vfx_opacity = 200
	vim.g.neovide_scale_factor = 0.9
	local padding = 0
	vim.g.neovide_padding_bottom = padding
	vim.g.neovide_padding_top = padding
	vim.g.neovide_padding_right = padding
	vim.g.neovide_padding_left = padding
	vim.g.neovide_opacity = 0.95
end
