local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

	-- Override plugin definition options

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- format & linting
			{
				"jose-elias-alvarez/null-ls.nvim",
				config = function()
					require("custom.configs.null-ls")
				end,
			},
		},
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end, -- Override to setup mason-lspconfig
	},

	-- override plugin configs
	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},

	-- Install a plugin
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},

	{ "folke/trouble.nvim", cmd = "TroubleToggle", opts = { use_diagnostic_signs = true } },
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
	-- {
	-- 	"j-hui/fidget.nvim",
	-- 	lazy = false,
	-- 	config = function()
	-- 		require("fidget").setup({})
	-- 	end,
	-- },
	{ "RRethy/vim-illuminate", event = "BufRead" },
	{
		"hrsh7th/nvim-cmp",
		opts = function()
			local options = require("plugins.configs.cmp")
			-- add codeium to the sources table
			table.insert(options.sources, 1, { name = "codeium" })
			return options
		end,
	},
	{
		"Exafunction/codeium.vim",
		event = "BufEnter",
		config = function()
			vim.g.codeium_disable_bindings = 1
			vim.keymap.set("i", "<a-CR>", function()
				return vim.fn["codeium#Accept"]()
			end, { expr = true })
			vim.keymap.set("i", "<a-n>", function()
				return vim.fn["codeium#CycleCompletions"](1)
			end, { expr = true })
			vim.keymap.set("i", "<a-p>", function()
				return vim.fn["codeium#CycleCompletions"](-1)
			end, { expr = true })
			vim.keymap.set("i", "<a-x>", function()
				return vim.fn["codeium#Clear"]()
			end, { expr = true })
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
		-- lazy = false,
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

	-- To make a plugin not be loaded
	-- {
	--   "NvChad/nvim-colorizer.lua",
	--   enabled = false
	-- },

	-- All NvChad plugins are lazy-loaded by default
	-- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
	-- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
	-- {
	--   "mg979/vim-visual-multi",
	--   lazy = false,
	-- }
}

return plugins
