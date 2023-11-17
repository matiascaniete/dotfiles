local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

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
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

--
-- lspconfig.pyright.setup { blabla}
