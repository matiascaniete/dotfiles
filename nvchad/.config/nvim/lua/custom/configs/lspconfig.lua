local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

-- if you just want default config for the servers then put them in a table
local servers = {
	"bashls",
	"cssls",
	"dockerls",
	"emmet_ls",
	"html",
	"intelephense",
	"jsonls",
	"lua_ls",
	"marksman",
	"psalm",
	"pyright",
	"stylelint_lsp",
	"taplo",
	"tsserver",
	"tsserver",
	"vuels",
	"yamlls",
}

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using
				-- (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = {
					"vim",
					"require",
				},
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})

--
-- lspconfig.pyright.setup { blabla}
