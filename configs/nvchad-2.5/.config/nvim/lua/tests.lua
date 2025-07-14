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

function Define_colors_picker()
	local pickers = require("telescope.pickers")
	local finders = require("telescope.finders")
	local previewers = require("telescope.previewers")
	local conf = require("telescope.config").values
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")

	local color_previewer = previewers.new_buffer_previewer({
		title = "Color Preview",
		define_preview = function(self, entry)
			local color_name = entry.value[1]
			local color_hex = entry.value[2]

			local lines = {
				"Name: " .. color_name,
				"Hex: " .. color_hex,
				"",
				"Preview:",
				string.rep("█", 30) .. " ← swatch of " .. color_hex,
			}

			vim.api.nvim_buf_set_lines(self.state.bufnr, 0, -1, false, lines)

			-- Optionally use syntax highlighting or set filetype
			-- vim.api.nvim_buf_set_option(self.state.bufnr, "filetype", "txt")
		end,
	})
	-- our picker function: colors
	local colors = function(opts)
		opts = opts or {}
		pickers
			.new(opts, {
				prompt_title = "colors",
				finder = finders.new_table({
					results = {
						{ "red", "#ff0000" },
						{ "green", "#00ff00" },
						{ "blue", "#0000ff" },
					},
					entry_maker = function(entry)
						return {
							value = entry,
							display = entry[1] .. " (" .. entry[2] .. ")",
							ordinal = entry[1],
						}
					end,
				}),
				sorter = conf.generic_sorter(opts),
				previewer = color_previewer,
				layout_strategy = "vertical",
				attach_mappings = function(prompt_bufnr, _)
					actions.select_default:replace(function()
						actions.close(prompt_bufnr)
						local selection = action_state.get_selected_entry()
						print(vim.inspect(selection))
						vim.api.nvim_put({ selection.value[2] }, "", false, true)
					end)
					return true
				end,
			})
			:find()
	end

	-- to execute the function
	colors(vim.tbl_deep_extend("force", require("telescope.themes").get_dropdown(), {
		previewer = true,
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				preview_width = 0.5,
			},
			width = 0.8,
			height = 0.5,
		},
	}))
end
vim.api.nvim_set_keymap("n", "<leader>cp", ":lua Define_colors_picker()<CR>", { noremap = true, silent = true })
