-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

-- EXAMPLE
local servers = {
	"bashls",
	"cssls",
	"dockerls",
	"emmet_ls",
	"gopls",
	"html",
	"intelephense",
	"jsonls",
	"lemminx",
	"lua_ls",
	"marksman",
	"psalm",
	"ruff",
	"stylelint_lsp",
	"taplo",
	"ts_ls",
	"vuels",
	"yamlls",
}

vim.lsp.enable(servers)

local function continue()
	local lspconfig = require("lspconfig")
	local nvlsp = require("nvchad.configs.lspconfig")

	for _, lsp in ipairs(servers) do
		lspconfig[lsp].setup({
			on_attach = nvlsp.on_attach,
			on_init = nvlsp.on_init,
			capabilities = nvlsp.capabilities,
		})
	end

	lspconfig.lua_ls.setup({
		on_attach = nvlsp.on_attach,
		on_init = nvlsp.on_init,
		capabilities = nvlsp.capabilities,
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

	local util = require("lspconfig/util")

	lspconfig.gopls.setup({
		on_attach = nvlsp.on_attach,
		on_init = nvlsp.on_init,
		capabilities = nvlsp.capabilities,
		cmd = { "gopls" },
		filetypes = { "go", "gomod", "gowork", "gotmpl" },
		root_dir = util.root_pattern("go.work", "go.mod", ".git"),
		settings = {
			gopls = {
				completeUnimported = true,
				usePlaceholders = true,
				analyses = {
					unusedparams = true,
				},
			},
		},
	})

	vim.notify("lsp custom config done!")
end

continue()
