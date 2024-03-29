local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    is_bootstrap = true
    vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
end

require("packer").startup(function(use)
    -- Package manager
    use("wbthomason/packer.nvim")

    use({
        "j-hui/fidget.nvim",
        tag = "legacy",
    })

    use({ -- LSP Configuration & Plugins
        "neovim/nvim-lspconfig",
        requires = {
            -- Automatically install LSPs to stdpath for neovim
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",

            -- Useful status updates for LSP
            -- 'j-hui/fidget.nvim',

            -- Additional lua configuration, makes nvim stuff amazing
            "folke/neodev.nvim",
        },
    })

    use({ -- Autocompletion
        "hrsh7th/nvim-cmp",
        requires = { "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip" },
    })

    use("rafamadriz/friendly-snippets")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-buffer")

    use({
        "windwp/nvim-ts-autotag",
        config = function()
            require("nvim-ts-autotag").setup()
        end,
    })

    use("p00f/nvim-ts-rainbow")
    use("windwp/nvim-autopairs")

    use({
        "nvim-tree/nvim-tree.lua",
        requires = {
            "nvim-tree/nvim-web-devicons", -- optional, for file icons
        },
    })

    vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
    use({
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
    })

    -- Lua
    use({
        "ahmedkhalf/project.nvim",
        config = function()
            require("project_nvim").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            })
            require("telescope").load_extension("projects")
        end,
    })

    use({ -- Highlight, edit, and navigate code
        "nvim-treesitter/nvim-treesitter",
        run = function()
            pcall(require("nvim-treesitter.install").update({ with_sync = true }))
        end,
    })

    use({ -- Additional text objects via treesitter
        "nvim-treesitter/nvim-treesitter-textobjects",
        after = "nvim-treesitter",
    })

    use("nvim-treesitter/nvim-treesitter-context")

    use("jose-elias-alvarez/null-ls.nvim")
    use("folke/which-key.nvim")
    use("rcarriga/nvim-notify")

    -- use { 'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons' }
    use({
        "goolord/alpha-nvim",
        requires = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("alpha").setup(require("alpha.themes.startify").config)
        end,
    })
    use("pwntester/octo.nvim")
    use("ellisonleao/glow.nvim")
    use({
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    })

    use("tpope/vim-surround")
    use("tpope/vim-repeat")
    use("RRethy/vim-illuminate")
    use("nacro90/numb.nvim")
    use("f-person/git-blame.nvim")
    use({
        "rmagatti/goto-preview",
        config = function()
            require("goto-preview").setup({
                default_mappings = true,
            })
        end,
    })
    use("ray-x/lsp_signature.nvim")
    use("simrat39/symbols-outline.nvim")
    -- Lua
    use({
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            })
        end,
    })
    -- use("karb94/neoscroll.nvim")
    -- Lua
    use({
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("todo-comments").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            })
        end,
    })
    use("itchyny/vim-cursorword")

    -- Git related plugins
    use("tpope/vim-fugitive")
    use("tpope/vim-rhubarb")
    use("lewis6991/gitsigns.nvim")

    use("navarasu/onedark.nvim") -- Theme inspired by Atom
    use("lunarvim/Onedarker.nvim")
    use("rebelot/kanagawa.nvim")
    use("EdenEast/nightfox.nvim")
    use("norcalli/nvim-colorizer.lua")
    use({ "catppuccin/nvim", as = "catppuccin" })

    -- use 'nanozuki/tabby.nvim'
    use("nvim-lualine/lualine.nvim")        -- Fancier statusline

    use("lukas-reineke/indent-blankline.nvim") -- Add indentation guides even on blank lines
    use("numToStr/Comment.nvim")            -- "gc" to comment visual regions/lines
    use("tpope/vim-sleuth")                 -- Detect tabstop and shiftwidth automatically

    -- Fuzzy Finder (files, lsp, etc)
    use({
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-live-grep-args.nvim",
        },
        config = function()
            require("telescope").load_extension("live_grep_args")
        end,
    })

    -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make", cond = vim.fn.executable("make") == 1 })
    use({ "akinsho/toggleterm.nvim", tag = "*" })
    use({
        "Exafunction/codeium.vim",
        config = function()
            -- Change '<C-g>' here to any keycode you like.
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
    })

    use({
        "jackMort/ChatGPT.nvim",
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
        requires = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
        },
    })

    use({
        "ggandor/leap.nvim",
        config = function()
            require("leap").add_default_mappings()
        end,
    })

    -- Add custom plugins to packer from ~/.config/nvim/lua/custom/plugins.lua
    local has_plugins, plugins = pcall(require, "custom.plugins")
    if has_plugins then
        plugins(use)
    end

    if is_bootstrap then
        require("packer").sync()
    end
end)

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
    print("==================================")
    print("    Plugins are being installed")
    print("    Wait until Packer completes,")
    print("       then restart nvim")
    print("==================================")
    return
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup("Packer", { clear = true })
local pattern = vim.fn.expand("$MYVIMRC")
vim.api.nvim_create_autocmd("BufWritePost", {
    command = "source <afile> | PackerCompile",
    group = packer_group,
    pattern = pattern,
})

vim.g.codeium_disable_bindings = 1

require("options")
require("plugins.toggleterm")
require("plugins.null-ls")
require("plugins.lualine")
require("plugins.glow")
require("keymaps")

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`


-- local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = "*",
})

require("nvim-tree").setup()
require("which-key").setup()
local wk = require("which-key")
wk.register({
    c = {
        name = "ChatGPT",
        c = { "<cmd>ChatGPT<CR>", "ChatGPT" },
        e = { "<cmd>ChatGPTEditWithInstruction<CR>", "Edit with instruction", mode = { "n", "v" } },
        g = { "<cmd>ChatGPTRun grammar_correction<CR>", "Grammar Correction", mode = { "n", "v" } },
        t = { "<cmd>ChatGPTRun translate<CR>", "Translate", mode = { "n", "v" } },
        k = { "<cmd>ChatGPTRun keywords<CR>", "Keywords", mode = { "n", "v" } },
        d = { "<cmd>ChatGPTRun docstring<CR>", "Docstring", mode = { "n", "v" } },
        a = { "<cmd>ChatGPTRun add_tests<CR>", "Add Tests", mode = { "n", "v" } },
        o = { "<cmd>ChatGPTRun optimize_code<CR>", "Optimize Code", mode = { "n", "v" } },
        s = { "<cmd>ChatGPTRun summarize<CR>", "Summarize", mode = { "n", "v" } },
        f = { "<cmd>ChatGPTRun fix_bugs<CR>", "Fix Bugs", mode = { "n", "v" } },
        x = { "<cmd>ChatGPTRun explain_code<CR>", "Explain Code", mode = { "n", "v" } },
        r = { "<cmd>ChatGPTRun roxygen_edit<CR>", "Roxygen Edit", mode = { "n", "v" } },
        l = { "<cmd>ChatGPTRun code_readability_analysis<CR>", "Code Readability Analysis", mode = { "n", "v" } },
    },
})

-- require("bufferline").setup {}
-- require("tabby").setup()
require("numb").setup()
require("nvim-autopairs").setup()
require("lsp_signature").setup()
require("symbols-outline").setup()
-- require("neoscroll").setup()
require("Comment").setup()
require("nvim-treesitter.configs").setup({
    rainbow = {
        enable = true,
        -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
    },
})
require("treesitter-context").setup({
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    throttle = true, -- Throttles plugin updates (may improve performance)
    max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
})

-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help indent_blankline.txt`
-- require("ibl").setup({
--     char = "┊",
--     show_trailing_blankline_indent = false,
-- })
local highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowCyan",
}
local hooks = require("ibl.hooks")
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)

vim.g.rainbow_delimiters = { highlight = highlight }
require("ibl").setup({
    indent = {
        char = "¦",
    },
    scope = { highlight = highlight },
})

hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

-- Gitsigns
-- See `:help gitsigns.txt`
require("gitsigns").setup({
    signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
    },
})

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require("telescope").setup({
    defaults = {
        mappings = {
            i = {
                ["<C-u>"] = false,
                ["<C-d>"] = false,
            },
        },
    },
})

require("telescope").load_extension("notify")
vim.notify = require("notify")

-- Enable telescope fzf native, if installed
pcall(require("telescope").load_extension, "fzf")

-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require("nvim-treesitter.configs").setup({
    ignore_install = {
        "help",
    },
    -- Add languages to be installed here that you want installed for treesitter
    ensure_installed = {
        "bash",
        "c",
        "cpp",
        "css",
        "dockerfile",
        "gitcommit",
        "go",
        "help",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "php",
        "python",
        "regex",
        "rust",
        "scss",
        "twig",
        "typescript",
        "vue",
        "yaml",
    },

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true, -- <= THIS LINE is the magic!
    },
    indent = { enable = true, disable = { "python" } },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<c-space>",
            node_incremental = "<c-space>",
            scope_incremental = "<c-s>",
            node_decremental = "<c-backspace>",
        },
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["aa"] = "@parameter.outer",
                ["ia"] = "@parameter.inner",
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
            },
        },
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                ["]m"] = "@function.outer",
                ["]]"] = "@class.outer",
            },
            goto_next_end = {
                ["]M"] = "@function.outer",
                ["]["] = "@class.outer",
            },
            goto_previous_start = {
                ["[m"] = "@function.outer",
                ["[["] = "@class.outer",
            },
            goto_previous_end = {
                ["[M"] = "@function.outer",
                ["[]"] = "@class.outer",
            },
        },
        swap = {
            enable = true,
            swap_next = {
                ["<leader>a"] = "@parameter.inner",
            },
            swap_previous = {
                ["<leader>A"] = "@parameter.inner",
            },
        },
    },
})

vim.diagnostic.config({
    severity_sort = true,
    float = {
        source = "always", -- Or "if_many"
    },
})

-- LSP settings.
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
    -- NOTE: Remember that lua is a real programming language, and as such it is possible
    -- to define small helper and utility functions so you don't have to repeat yourself
    -- many times.
    --
    -- In this case, we create a function that lets us more easily define mappings specific
    -- for LSP related items. It sets the mode, buffer and description for us each time.
    local nmap = function(keys, func, desc)
        if desc then
            desc = "LSP: " .. desc
        end

        vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
    end

    nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
    nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

    nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
    nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
    nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
    nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
    nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
    nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
    nmap("<leader>sga", require("telescope").extensions.live_grep_args.live_grep_args, "[S]earch [G]rep [A]rgs")
    -- See `:help K` for why this keymap
    nmap("K", vim.lsp.buf.hover, "Hover Documentation")
    nmap("KK", vim.lsp.buf.signature_help, "Signature Documentation")

    -- Lesser used LSP functionality
    nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
    nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
    nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
    nmap("<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, "[W]orkspace [L]ist Folders")

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
        vim.lsp.buf.format({ timeout_ms = 5000 })
    end, { desc = "Format current buffer with LSP" })
    nmap("<leader>lf", function()
        vim.cmd("Format")
        vim.notify("Format finished!")
    end, "[L]SP [F]ormat")

    vim.api.nvim_buf_create_user_command(bufnr, "CodeActions", function(_)
        vim.lsp.buf.code_action()
    end, { desc = "Code action for current buffer with LSP" })
end

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
local servers = {
    -- clangd = {},
    -- gopls = {},
    -- rust_analyzer = {},
    bashls = {},
    dockerls = {},
    emmet_ls = {},
    html = {},
    intelephense = {},
    jsonls = {},
    lemminx = {},
    lua_ls = {
        Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
        },
    },
    marksman = {},
    psalm = {},
    pyright = {},
    stylelint_lsp = {
        stylelintplus = {
            -- see available options in stylelint-lsp documentation
            configOverrides = {
                ignoreFiles = { "**/*.ts" },
            },
        },
    },
    taplo = {},
    tsserver = {},
    vuels = {},
    yamlls = {},
    -- twigcs doesn't work, install it manually!!!
    -- twigcs = {},
}

-- Setup neovim lua configuration
require("neodev").setup()
--
-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- Setup mason so it can manage external tooling
require("mason").setup()

-- Ensure the servers above are installed
local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
    ensure_installed = vim.tbl_keys(servers),
})

mason_lspconfig.setup_handlers({
    function(server_name)
        require("lspconfig")[server_name].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
        })
    end,
})

-- Turn on lsp status information
require("fidget").setup()

-- nvim-cmp setup
local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    }),
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },
        { name = "buffer" },
    },
})
require("luasnip.loaders.from_vscode").lazy_load()
require("neovide")
