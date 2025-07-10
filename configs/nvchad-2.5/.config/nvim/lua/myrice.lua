local load_addons = function(filename)
	-- check if a file called addons.lua exists in the project root directory
	local file = vim.fs.find({ filename }, { upward = true })
	if file ~= nil and #file > 0 then
		-- source the addons.lua file
		print("Sourcing " .. file[1])
		dofile(file[1])
	end
end

P = function(v)
	print(vim.inspect(v))
	return v
end

RELOAD = function(...)
	return require("plenary.reload").reload_module(...)
end

R = function(name)
	if not name then
		print("No module name given")
		return
	end
	print("Reloading " .. name)
	RELOAD(name)
	return require(name)
end

local new_cmd = vim.api.nvim_create_user_command

new_cmd("Format", function()
	vim.lsp.buf.format()
end, {
	desc = "Format current buffer with LSP",
})

new_cmd("Src", function()
	local fname = vim.fn.expand("%")
	local ext = vim.fn.fnamemodify(fname, ":e")
	if not (ext == "lua") then
		vim.notify("File must be a lua file!")
		return
	end
	vim.cmd.source(fname)
	vim.notify(fname .. " sourced at " .. vim.fn.strftime("%H:%M:%S") .. "!")
end, {
	desc = "Source current buffer",
})

vim.api.nvim_set_keymap("n", "<leader>sr", ":Src<cr>", { desc = "Source current buffer" })

new_cmd("ReloadLocalAddons", function()
	load_addons("nvim.local.lua")
end, {})

vim.schedule(function()
	load_addons("nvim.local.lua")
end)

-- Set tab size for lua
vim.api.nvim_create_autocmd("FileType", {
	pattern = "lua",
	callback = function()
		vim.opt_local.tabstop = 4
		vim.opt_local.shiftwidth = 4
		vim.opt_local.softtabstop = 4
		vim.opt_local.expandtab = true
	end,
})

local ts_utils = require("nvim-treesitter.ts_utils")

local function_node_types = {
	-- Common named functions
	"function_definition", -- Bash, C, Python
	"function_declaration", -- JS, TS
	"function", -- Lua
	"method_definition", -- JS, PHP classes
	"method_declaration", -- Java, C#
	"function_item", -- Rust
	"def", -- Python
	"constructor_declaration", -- Java

	-- Anonymous / closures
	"anonymous_function_creation_expression", -- PHP
	"arrow_function", -- JS
	"function_expression", -- JS
	"lambda_expression", -- Python, Rust, Kotlin
	"closure_expression", -- Rust
}

function DeleteFunctionUniversal(mode)
	local node = ts_utils.get_node_at_cursor()
	while node do
		for _, fn_type in ipairs(function_node_types) do
			if node:type() == fn_type then
				local start_row, _, end_row, _ = node:range()

				if mode == "full" then
					vim.api.nvim_buf_set_lines(0, start_row, end_row + 1, false, {})
					vim.api.nvim_win_set_cursor(0, { start_row + 1, 0 })
					print("Deleted entire function (" .. fn_type .. ")")
					return
				elseif mode == "contents" then
					-- Get function node range:
					local start_row, _, end_row, _ = node:range()

					-- Delete lines between start+1 and end (excluding signature and closing)
					if end_row > start_row + 1 then
						vim.api.nvim_buf_set_lines(0, start_row + 1, end_row, false, {})
						vim.api.nvim_win_set_cursor(0, { start_row + 2, 0 })
						print("Cleared function body contents (" .. node:type() .. ")")
					else
						print("Function body already empty or no inner lines to clear")
					end
					return
				end
			end
		end
		node = node:parent()
	end
	print("❌ No function node found under cursor")
end

-- Keymaps
vim.keymap.set("n", "<leader>df", function()
	DeleteFunctionUniversal("full")
end, { desc = "Delete whole function" })
vim.keymap.set("n", "<leader>dc", function()
	DeleteFunctionUniversal("contents")
end, { desc = "Delete function contents only" })

-- Commands
new_cmd("DeleteFunction", DeleteFunctionUniversal, {
	nargs = 1,
	complete = function()
		return { "full", "contents" }
	end,
})
