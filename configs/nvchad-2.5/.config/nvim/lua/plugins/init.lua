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

    { "tpope/vim-sleuth",        lazy = false },

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
            opts.sources = opts.sources or {}

            -- table.insert(opts.sources, 1, { name = "codeium" })
            table.insert(opts.sources, 2, { name = "emoji" })
            table.insert(opts.sources, {
                name = "lazydev",
                group_index = 0, -- set group index to 0 to skip loading LuaLS completions
            })
        end,
    },

    {
        "folke/noice.nvim",
        event = "VeryLazy",
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
    {
        "allaman/emoji.nvim",
        lazy = false,
        dependencies = {
            "hrsh7th/nvim-cmp",
            "nvim-telescope/telescope.nvim",
        },
        opts = {
            enable_cmp_integration = true,
        },
        config = function(_, opts)
            require("emoji").setup(opts)
        end,
    },

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
