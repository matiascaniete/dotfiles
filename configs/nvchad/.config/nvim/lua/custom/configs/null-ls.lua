local null_ls = require("null-ls")

local b = null_ls.builtins

local sources = {
	b.hover.dictionary,
	b.hover.printenv,
	b.formatting.stylua,
	b.formatting.prettier,
	b.formatting.eslint_d,
	b.code_actions.shellcheck, -- shell script code actions
	b.diagnostics.eslint_d,
	-- webdev stuff
	b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
	b.formatting.prettier.with({ filetypes = { "html", "markdown", "css" } }), -- so prettier works only on these filetypes
	b.formatting.phpcsfixer.with({
		env = {
			PHP_CS_FIXER_IGNORE_ENV = true,
		},
	}),
	b.diagnostics.phpcs.with({
		command = "./vendor/bin/phpcs",
	}),
	b.diagnostics.phpmd.with({
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

	-- Lua
	b.formatting.stylua,

	-- cpp
	b.formatting.clang_format,

	-- go
	b.formatting.gofumpt,
	b.formatting.goimports_reviser,
	b.formatting.golines,
}

null_ls.setup({
	debug = true,
	sources = sources,
})

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
