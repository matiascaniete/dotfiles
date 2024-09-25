-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

require("null-ls").setup({
    debug = true,
    sources = {
        require("null-ls").builtins.hover.dictionary,
        require("null-ls").builtins.hover.printenv,
        require("null-ls").builtins.formatting.stylua,
        require("null-ls").builtins.formatting.prettier,
        require("null-ls").builtins.formatting.eslint_d,
        require("null-ls").builtins.formatting.phpcsfixer.with({
            env = {
                PHP_CS_FIXER_IGNORE_ENV = true,
            },
        }),
        require("null-ls").builtins.diagnostics.phpcs.with({
            command = "./vendor/bin/phpcs",
        }),

        require("null-ls").builtins.code_actions.shellcheck, -- shell script code actions
        require("null-ls").builtins.diagnostics.eslint_d,
        require("null-ls").builtins.diagnostics.phpmd.with({
            extra_args = function()
                local configFile = "phpmd.xml"
                if vim.fn.filereadable(configFile) == 1 then
                    -- vim.notify("Using phpmd configuration from file " .. configFile)
                    return { configFile }
                end
                -- vim.notify("Using phpmd with all rules")
                return { "cleancode,codesize,controversial,design,naming,unusedcode" }
            end,
        }),
        -- on_attach = function(client, bufnr)
        --     vim.notify('on-attach')
        --     if client.supports_method("textDocument/formatting") then
        --         vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        --         vim.api.nvim_create_autocmd("BufWritePre", {
        --             group = augroup,
        --             buffer = bufnr,
        --             callback = function()
        --                 vim.notify('formatin')
        --                 vim.lsp.buf.format({ bufnr = bufnr })
        --             end,
        --         })
        --     end
        -- end,
    },
})

local null_ls = require("null-ls")

local shellcheck_formatter = {
    name = "custom_shellcheck",
    method = null_ls.methods.FORMATTING,
    filetypes = { "sh" },
    generator = null_ls.formatter({
        command = "sh",
        args = { "-c", "tmp=$(mktemp); cat > $tmp; shellcheck $tmp --format=diff | patch $tmp -o-" },
        to_stdin = true,
        from_stderr = true,
    }),
}
null_ls.register(shellcheck_formatter)

local fmter = {
    name = "custom_beautysh",
    method = null_ls.methods.FORMATTING,
    filetypes = { "sh" },
    generator = null_ls.formatter({
        command = "sh",
        args = { "-c", "beautysh - --force-function-style paronly" },
        to_stdin = true,
        from_stderr = true,
    }),
}
null_ls.register(fmter)
