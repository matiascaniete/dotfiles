require("codeium").setup({
	enable_cmp_source = false,
	virtual_text = {
		enabled = true,
		key_bindings = {
			next = "<M-n>",
			prev = "<M-p>",
			accept = "<M-Enter>",
		},
	},
})

require("codeium.virtual_text").set_statusbar_refresh(function()
	vim.cmd("redrawstatus")
end)
