require("nvim-treesitter.configs").setup({
	textobjects = {
		select = {
			enable = true,
			-- Automatically jump forward to textobj, similar to targets
			lookahead = true,
			keymaps = {
				-- Built-in captures.
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",

				["am"] = "@function.outer",
				["im"] = "@function.inner",

				["af"] = "@call.outer",
				["if"] = "@call.inner",

				["al"] = "@loop.outer",
				["il"] = "@loop.inner",

				["ai"] = "@conditional.outer",
				["ii"] = "@conditional.inner",

				["a="] = "@assignment.outer",
				["i="] = "@assignment.inner",
				["l="] = "@assignment.lhs",
				["r="] = "@assignment.rhs",

				["aa"] = "@parameter.outer",
				["ia"] = "@parameter.inner",
			},
		},
		swap = {
			enable = true,
			swap_next = {
				["<leader>na"] = "@parameter.inner",
				["<leader>nm"] = "@function.inner",
			},
			swap_previous = {
				["<leader>pa"] = "@parameter.inner",
				["<leader>pm"] = "@function.inner",
			},
		},
		move = {
			enable = true,
			goto_next_start = {
				["]m"] = "@function.outer",
				["]c"] = "@class.outer",
			},
			goto_previous_start = {
				["[m"] = "@function.outer",
				["[c"] = "@class.outer",
			},
		},
	},
})
