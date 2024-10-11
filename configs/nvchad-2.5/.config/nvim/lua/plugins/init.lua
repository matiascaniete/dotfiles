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

	{
		"rcarriga/nvim-notify",
		lazy = false,
		config = function()
			require("notify").setup()
			-- vim.notify = require("notify")
		end,
	},

	{
		"jose-elias-alvarez/null-ls.nvim",
		lazy = false,
		config = function()
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
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	},

	{ "RRethy/vim-illuminate", event = "BufRead" },

	{
		"hrsh7th/nvim-cmp",
		opts = function(_, opts)
			table.insert(opts.sources, 1, { name = "codeium" })
			return opts
		end,
	},

	-- {
	-- 	"Exafunction/codeium.vim",
	-- 	event = "BufEnter",
	-- 	config = function()
	-- 		vim.g.codeium_disable_bindings = 1
	-- 		vim.keymap.set("i", "<a-CR>", function()
	-- 			return vim.fn["codeium#Accept"]()
	-- 		end, { expr = true })
	-- 		vim.keymap.set("i", "<a-n>", function()
	-- 			return vim.fn["codeium#CycleCompletions"](1)
	-- 		end, { expr = true })
	-- 		vim.keymap.set("i", "<a-p>", function()
	-- 			return vim.fn["codeium#CycleCompletions"](-1)
	-- 		end, { expr = true })
	-- 		vim.keymap.set("i", "<a-x>", function()
	-- 			return vim.fn["codeium#Clear"]()
	-- 		end, { expr = true })
	-- 	end,
	-- },

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
		"p00f/nvim-ts-rainbow",
		event = "BufRead",
		config = function()
			require("nvim-treesitter.configs").setup({
				rainbow = { enable = true, extended_mode = true, max_file_lines = 1000 },
			})
		end,
	},

	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	{
		"jackMort/ChatGPT.nvim",
		cmd = { "ChatGPT", "ChatGPTRun", "ChatGPTActAs", "ChatGPTRunSetup", "ChatGPTEditWithInstructions" },
		config = function()
			require("chatgpt").setup({
				chat = {
					welcome_message = "Welcome to ChatGPT!",
				},
				openai_params = {
					model = "gpt-3.5-turbo",
					frequency_penalty = 0,
					presence_penalty = 0,
					max_tokens = 1024,
					temperature = 0,
					top_p = 1,
					n = 1,
				},
			})
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
	},

	{
		"olexsmir/gopher.nvim",
		ft = "go",
		config = function(_, opts)
			require("gopher").setup(opts)
		end,
		build = function()
			vim.cmd("GoInstallDeps")
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
		},
	},
}
