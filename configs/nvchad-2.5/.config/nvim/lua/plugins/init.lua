return {
	{
		"stevearc/conform.nvim",
		-- event = 'BufWritePre', -- uncomment for format on save
		opts = require("configs.conform"),
	},

	-- These are some examples, uncomment them if you want to see them work!
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("configs.lspconfig")
		end,
	},

	-- Custom plugins

	-- {
	-- 	dir = "~/Documentos/ndorma/repos/nvim-ndorma-plugin.nvim",
	-- 	lazy = false,
	-- 	config = function()
	-- 		require("nvim-ndorma-plugin").setup()
	-- 	end,
	-- },
	--

	{
		"rcarriga/nvim-notify",
		lazy = false,
		config = function()
			require("notify").setup()
			-- vim.notify = require("notify")
		end,
	},

	{
		"nvimtools/none-ls.nvim",
		lazy = false,
		nonfig = function()
			require("configs.nullls")
		end,
	},

	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},

	{
		"folke/trouble.nvim",
		cmd = "TroubleToggle",
		opts = {
			use_diagnostic_signs = true,
		},
	},

	{ "f-person/git-blame.nvim", event = "BufRead" },

	{ "tpope/vim-sleuth", lazy = false },

	{
		"nacro90/numb.nvim",
		lazy = false,
		config = function()
			require("numb").setup({})
		end,
	},

	{
		"goolord/alpha-nvim",
		lazy = false,
		config = function()
			local opts = require("alpha.themes.theta").config
			opts.layout[2].val = vim.fn.systemlist('date +"%d %m %Y" | figlet -f slant')
			require("alpha").setup(opts)
		end,
	},

	{ "RRethy/vim-illuminate", event = "BufRead" },

	{
		"hrsh7th/nvim-cmp",
		opts = function(_, opts)
			table.insert(opts.sources, 1, { name = "codeium" })
			table.insert(opts.sources, 2, { name = "emoji" })
			return opts
		end,
	},

	{
		"Exafunction/codeium.nvim",
		event = "BufEnter",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"hrsh7th/nvim-cmp",
		},
		config = function()
			require("codeium").setup({})
		end,
	},

	{
		"ellisonleao/glow.nvim",
		cmd = "Glow",
		ft = { "markdown" },
		config = function()
			require("glow").setup()
		end,
	},

	{
		"simrat39/symbols-outline.nvim",
		cmd = "SymbolsOutline",
		config = function()
			require("symbols-outline").setup()
		end,
	},

	{
		"HiPhish/rainbow-delimiters.nvim",
		event = "BufRead",
	},

	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},

	{
		"jackMort/ChatGPT.nvim",
		lazy = false,
		config = function()
			require("chatgpt").setup()
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"folke/trouble.nvim", -- optional
			"nvim-telescope/telescope.nvim",
		},
	},

	{
		"olexsmir/gopher.nvim",
		ft = "go",
		build = function()
			-- vim.cmd.GoInstallDeps()
		end,
	},
	{
		"allaman/emoji.nvim",
		lazy = false,
		-- version = "1.0.0", -- optionally pin to a tag
		-- ft = "markdown", -- adjust to your needs

		dependencies = {
			-- optional for nvim-cmp integration
			"hrsh7th/nvim-cmp",
			-- optional for telescope integration
			"nvim-telescope/telescope.nvim",
		},
		opts = {
			-- default is false
			enable_cmp_integration = true,
		},
		config = function(_, opts)
			require("emoji").setup(opts)
			-- optional for telescope integration
			local ts = require("telescope").load_extension("emoji")
			vim.keymap.set("n", "<leader>fe", ts.emoji, { desc = "[F]ind [E]moji" })
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
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
		},
	},

	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		event = "BufRead",
		config = function()
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
		end,
	},
}
