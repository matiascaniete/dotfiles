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

-- Function to create a popup window at the cursor position and make it dismissible
function Popup_at_cursor()
	-- Get the current cursor position
	local cursor_pos = vim.api.nvim_win_get_cursor(0)
	local row = cursor_pos[1]
	local col = cursor_pos[2]

	-- Define the content of the popup
	local current_line = vim.api.nvim_get_current_line()
	local start_line = vim.fn.line(".")
	local end_line = vim.fn.search("^$", "n") - 1
	local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)
	local paragraph = table.concat(lines, "\n")

	-- print(paragraph)
	-- local lines = { "Hello from Neovim!", "claca", "lipsum", "Press Esc to close" }

	-- Define the window options
	local win_opts = {
		relative = "cursor", -- Position relative to the cursor
		row = 0, -- Position one row below the cursor
		col = 0, -- Position at the same column as the cursor
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
vim.cmd([[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]])
