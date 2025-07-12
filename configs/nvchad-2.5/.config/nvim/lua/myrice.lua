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

vim.api.nvim_create_user_command("Format", function()
	vim.lsp.buf.format()
end, {
	desc = "Format current buffer with LSP",
})

vim.api.nvim_create_user_command("Src", function()
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

return {
	---@param text string
	---@return nil
	claca = function(text)
		if not text then
			return
		end
		if type(text) == "number" then
			print("error")
			return
		end
		print(text)
	end,
}
