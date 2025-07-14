if pcall(require, "alpha") then
	print("loaded alpha")
	local opts = require("alpha.themes.theta").config
	opts.layout[2].val = vim.fn.systemlist('echo "my dotfiles" | figlet -f slant')
	require("alpha").setup(opts)
	require("alpha").redraw()
	return
end
