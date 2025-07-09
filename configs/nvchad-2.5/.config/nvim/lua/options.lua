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

-- Function to create a popup window at the cursor position and make it dismissible
function Popup_at_cursor()
	-- Get the current cursor position
	-- local cursor_pos = vim.api.nvim_win_get_cursor(0)
	-- local row = cursor_pos[1]
	-- local col = cursor_pos[2]

	-- Define the content of the popup
	-- local current_line = vim.api.nvim_get_current_line()
	local start_line = vim.fn.line(".")
	local end_line = vim.fn.search("^$", "n") - 1
	local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)
	-- local paragraph = table.concat(lines, "\n")

	-- append text to a new line
	table.insert(lines, "Press Esc or q close")

	-- print(paragraph)
	-- local lines = { "Hello from Neovim!", "claca", "lipsum", "Press Esc to close" }

	-- Define the window options
	local win_opts = {
		relative = "cursor", -- Position relative to the cursor
		row = 2, -- Position one row below the cursor
		col = 2, -- Position at the same column as the cursor
		width = 80, -- Set the width of the popup window
		height = 10, -- Set the height of the popup window
		style = "minimal", -- Disable line numbers, sign column, etc.
		border = "single", -- Border style: 'single', 'double', 'rounded', 'none', etc.
	}

	-- Create a new buffer for the popup
	local buf = vim.api.nvim_create_buf(false, true) -- Not listed and scratch buffer
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

	-- Open the popup window at the cursor position
	local win = vim.api.nvim_open_win(buf, true, win_opts)

	-- Function to close the popup window
	local function close_popup()
		vim.api.nvim_win_close(win, true)
	end

	-- Set key mapping in the buffer to close the popup on <Esc>
	vim.api.nvim_buf_set_keymap(buf, "n", "<Esc>", "", {
		noremap = true,
		silent = true,
		callback = close_popup,
	})

	-- Optional: Prevent other keybindings from affecting the popup by setting a no-op for other keys
	vim.api.nvim_buf_set_keymap(buf, "n", "q", "", {
		noremap = true,
		silent = true,
		callback = close_popup,
	})
end

-- Map the function to a keybinding for quick access
vim.api.nvim_set_keymap("n", "<leader>p", ":lua Popup_at_cursor()<CR>", { noremap = true, silent = true })

-- Set background transparent, including the terminal
vim.cmd([[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
  highlight NormalFloat guibg=none
  "highlight NonTextFloat guibg=none
]])

-- Restore beam cursor when exiting vim
vim.cmd("au VimLeave * set guicursor=a:ver25-blinkon0")

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

if vim.g.neovide then
	vim.print("Neovide version:" .. vim.g.neovide_version)
	vim.g.neovide_input_use_logo = true -- this will make cmd+tab work
	vim.g.neovide_cursor_vfx_mode = "torpedo"
	vim.g.neovide_cursor_vfx_opacity = 200
	vim.g.neovide_scale_factor = 0.9
	local padding = 0
	vim.g.neovide_padding_bottom = padding
	vim.g.neovide_padding_top = padding
	vim.g.neovide_padding_right = padding
	vim.g.neovide_padding_left = padding
	vim.g.neovide_transparency = 1
end
