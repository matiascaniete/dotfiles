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
	"ruff",
	"stylelint_lsp",
	"taplo",
	"ts_ls",
	"vtsls",
	"yamlls",
	-- "psalm",
	-- "vue-language-server",
	-- "vue_ls",
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

	-- lspconfig.lua_ls.setup({
	-- 	on_attach = nvlsp.on_attach,
	-- 	on_init = nvlsp.on_init,
	-- 	capabilities = nvlsp.capabilities,
	-- 	settings = {
	-- 		Lua = {
	-- 			runtime = {
	-- 				-- Tell the language server which version of Lua you're using
	-- 				-- (most likely LuaJIT in the case of Neovim)
	-- 				version = "LuaJIT",
	-- 			},
	-- 			diagnostics = {
	-- 				-- Get the language server to recognize the `vim` global
	-- 				globals = {
	-- 					"vim",
	-- 					"require",
	-- 				},
	-- 			},
	-- 			workspace = {
	-- 				-- Make the server aware of Neovim runtime files
	-- 				library = vim.api.nvim_get_runtime_file("", true),
	-- 			},
	-- 			-- Do not send telemetry data containing a randomized but unique identifier
	-- 			telemetry = {
	-- 				enable = false,
	-- 			},
	-- 		},
	-- 	},
	-- })

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

-- continue()

-- config for vue
local vue_language_server_path = vim.fn.stdpath("data")
	.. "/mason/packages/vue-language-server/node_modules/@vue/language-server"
local vue_plugin = {
	name = "@vue/typescript-plugin",
	location = vue_language_server_path,
	languages = { "vue" },
	configNamespace = "typescript",
}
local vtsls_config = {
	settings = {
		vtsls = {
			tsserver = {
				globalPlugins = {
					vue_plugin,
				},
			},
		},
	},
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
}

local vue_ls_config = {
	on_init = function(client)
		client.handlers["tsserver/request"] = function(_, result, context)
			local clients = vim.lsp.get_clients({ bufnr = context.bufnr, name = "vtsls" })
			if #clients == 0 then
				vim.notify(
					"Could not find `vtsls` lsp client, `vue_ls` would not work without it.",
					vim.log.levels.ERROR
				)
				return
			end
			local ts_client = clients[1]

			local param = unpack(result)
			local id, command, payload = unpack(param)
			ts_client:exec_cmd({
				title = "vue_request_forward", -- You can give title anything as it's used to represent a command in the UI, `:h Client:exec_cmd`
				command = "typescript.tsserverRequest",
				arguments = {
					command,
					payload,
				},
			}, { bufnr = context.bufnr }, function(_, r)
				local response_data = { { id, r.body } }
				---@diagnostic disable-next-line: param-type-mismatch
				client:notify("tsserver/response", response_data)
			end)
		end
	end,
}
-- nvim 0.11 or above
vim.lsp.config("vtsls", vtsls_config)
vim.lsp.config("vue_ls", vue_ls_config)
vim.lsp.enable({ "vtsls", "vue_ls" })
