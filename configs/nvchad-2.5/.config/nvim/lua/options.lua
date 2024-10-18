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

opt.virtualedit = "block"
-- opt.inccommand = "split"
opt.relativenumber = true
opt.scrolloff = 999

opt.wrap = false
-- vim.wo.wrap = true
-- vim.wo.linebreak = true
-- vim.wo.list = false -- extra option I set in addition to the ones in your question


-------------------------------------- commands ------------------------------------------

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
	print("Reloading " .. name)
	RELOAD(name)
	return require(name)
end

local new_cmd = vim.api.nvim_create_user_command

new_cmd("Format", function()
	vim.lsp.buf.format()
end, {})

new_cmd("ReloadLocalAddons", function()
	load_addons("nvim.local.lua")
end, {})

vim.schedule(function()
	load_addons("nvim.local.lua")
end)

-- make background transparent
vim.cmd([[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]])
