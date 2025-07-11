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
