-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require("lspconfig")

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
	"lua_ls",
	"marksman",
	"psalm",
	"pyright",
	"stylelint_lsp",
	"taplo",
	"ts_ls",
	"vuels",
	"yamlls",
}
local nvlsp = require("nvchad.configs.lspconfig")

-- lsps with default config
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = nvlsp.on_attach,
		on_init = nvlsp.on_init,
		capabilities = nvlsp.capabilities,
	})
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
