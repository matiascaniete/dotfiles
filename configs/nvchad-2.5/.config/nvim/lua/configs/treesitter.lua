return {
	ensure_installed = {
		"bash",
		"css",
		"dockerfile",
		"gitcommit",
		"go",
		"html",
		"javascript",
		"json",
		"lua",
		"markdown",
		"markdown_inline",
		"php",
		"python",
		"regex",
		"scss",
		"tsx",
		"twig",
		"typescript",
		"vim",
		"vimdoc",
		"vue",
		"yaml",
	},
	highlight = {
		enable = true,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<C-space>", -- set to `false` to disable one of the mappings
			node_incremental = "<C-space>",
			scope_incremental = false,
			node_decremental = "<backspace>",
		},
	},
}
