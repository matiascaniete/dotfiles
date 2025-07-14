return {
	{

		"hrsh7th/nvim-cmp",
		opts = {
			-- this is is a hack to make nvim-cmp work with the 'blink' option appearance.use_nvim_cmp = true
			-- See https://cmp.saghen.dev/configuration/reference.html#appearance
			sources = {},
		},
	},

	{
		"saghen/blink.cmp",
		lazy = false,
		-- enabled = false,
		-- optional: provides snippets for the snippet source
		dependencies = {
			"rafamadriz/friendly-snippets",
			"Exafunction/windsurf.nvim",
			"moyiz/blink-emoji.nvim",
			"xzbdmw/colorful-menu.nvim",
		},

		-- use a release tag to download pre-built binaries
		version = "1.*",
		-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
		-- build = 'cargo build --release',
		-- If you use nix, you can build from source using latest nightly rust with:
		-- build = 'nix run .#build-plugin',

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
			-- 'super-tab' for mappings similar to vscode (tab to accept)
			-- 'enter' for enter to accept
			-- 'none' for no mappings
			--
			-- All presets have the following mappings:
			-- C-space: Open menu or open docs if already open
			-- C-n/C-p or Up/Down: Select next/previous item
			-- C-e: Hide menu
			-- C-k: Toggle signature help (if signature.enabled = true)
			--
			-- See :h blink-cmp-config-keymap for defining your own keymap
			keymap = { preset = "enter" },

			appearance = {
				-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				-- Adjusts spacing to ensure icons are aligned
				nerd_font_variant = "mono",
				use_nvim_cmp_as_default = true,
			},

			-- (Default) Only show the documentation popup when manually triggered
			completion = {
				menu = {
					border = "solid",
					draw = {
						treesitter = { "lsp" },
						columns = {
							{ "kind_icon" },
							{ "label" },
							{ "source_id" },
						},
						components = {
							label = {
								text = function(ctx)
									return require("colorful-menu").blink_components_text(ctx)
								end,
								highlight = function(ctx)
									return require("colorful-menu").blink_components_highlight(ctx)
								end,
							},
						},
					},
				},
				documentation = {
					window = {
						border = "solid",
					},
					auto_show = true,
				},
			},
			signature = {
				enabled = true,
				window = {
					show_documentation = true,
					border = "solid",
				},
			},

			-- Default list of enabled providers defined so that you can extend it
			-- elsewhere in your config, without redefining it, due to `opts_extend`
			sources = {
				default = { "lsp", "path", "snippets", "buffer", "emoji" },
				providers = {
					-- codeium = { name = "Codeium", module = "codeium.blink", async = true },
					emoji = { name = "emoji", module = "blink-emoji", score_offset = 15, opts = { insert = true } },
				},
			},

			-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
			-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
			-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
			--
			-- See the fuzzy documentation for more information
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},

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

	{
		"matiascaniete/local.nvim",
		lazy = false,
		config = function()
			require("local-nvim").setup({ filename = "nvim.local.lua" })
		end,
	},

	-- {
	-- 	dir = "~/Documentos/local.nvim/",
	-- 	lazy = false,
	-- 	config = function()
	-- 		require("local-nvim").setup({ filename = "nvim.local.lua" })
	-- 	end,
	-- },

	{
		"rcarriga/nvim-notify",
		lazy = false,
		config = function()
			require("notify").setup({
				merge_duplicates = true,
				background_colour = "#000000",
			})

			vim.notify = require("notify")
		end,
	},

	{
		"nvimtools/none-ls.nvim",
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
			local opts = require("alpha.themes.theta").config
			opts.layout[2].val = vim.fn.systemlist('date +"%d %m %Y" | figlet -f slant')
			require("alpha").setup(opts)
		end,
	},

	{ "RRethy/vim-illuminate", event = "BufRead" },

	-- {
	-- 	"hrsh7th/nvim-cmp",
	-- 	opts = function(_, opts)
	-- 		opts.sources = opts.sources or {}
	--
	-- 		-- table.insert(opts.sources, 1, { name = "codeium" })
	-- 		table.insert(opts.sources, 2, { name = "emoji" })
	-- 		table.insert(opts.sources, {
	-- 			name = "lazydev",
	-- 			group_index = 0, -- set group index to 0 to skip loading LuaLS completions
	-- 		})
	-- 	end,
	-- },

	{
		"folke/noice.nvim",
		event = "VeryLazy",
		enabled = false,
		config = function()
			require("noice").setup({
				lsp = {
					-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
					},
				},
				-- you can enable a preset for easier configuration
				presets = {
					bottom_search = true, -- use a classic bottom cmdline for search
					command_palette = true, -- position the cmdline and popupmenu together
					long_message_to_split = true, -- long messages will be sent to a split
					inc_rename = false, -- enables an input dialog for inc-rename.nvim
					lsp_doc_border = false, -- add a border to hover docs and signature help
				},
			})
		end,
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	},

	{
		"Exafunction/windsurf.nvim",
		event = "BufEnter",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"hrsh7th/nvim-cmp",
		},
		config = function()
			require("configs.windsurf")
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

	-- {
	-- 	"allaman/emoji.nvim",
	-- 	-- lazy = false,
	-- 	dependencies = {
	-- 		"hrsh7th/nvim-cmp",
	-- 		"nvim-telescope/telescope.nvim",
	-- 	},
	-- 	opts = {
	-- 		-- enable_cmp_integration = true,
	-- 	},
	-- 	config = function(_, opts)
	-- 		require("emoji").setup(opts)
	-- 	end,
	-- },

	{
		"kylechui/nvim-surround",
		version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},

	{
		"mason-org/mason-lspconfig.nvim",
		opts = require("configs.mason"),
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = require("configs.treesitter"),
	},

	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		event = "BufRead",
		config = function()
			require("configs.treesitter-textobjects")
		end,
	},

	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
}
