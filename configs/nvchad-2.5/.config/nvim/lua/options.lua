require("nvchad.options")

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

local opt = vim.opt
-- local g = vim.g

--Disable the creation of swap files
opt.swapfile = false

-- Disable highlighting of search results
opt.hlsearch = false
-- Case insensitive searching UNLESS /C or capital in search
opt.ignorecase = true
opt.smartcase = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.smarttab = true

opt.wrap = false
-- vim.wo.wrap = true
-- vim.wo.linebreak = true
-- vim.wo.list = false -- extra option I set in addition to the ones in your question

-------------------------------------- commands ------------------------------------------
local new_cmd = vim.api.nvim_create_user_command

new_cmd("Format", function()
	vim.lsp.buf.format()
end, {})

vim.schedule(function()
	-- check if a file called addons.lua exists in the project root directory
	local file = vim.fs.find({ "nvim.local.lua" }, { upward = true })
	if file ~= nil and #file > 0 then
		-- source the addons.lua file
		print("Sourcing nvim.local.lua at " .. file[1])
		dofile(file[1])
	end
end)
