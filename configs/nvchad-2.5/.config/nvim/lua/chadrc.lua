-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.ui = {
	theme = "catppuccin",
	transparency = true,
	statusline = {
		order = { "mode", "file", "git", "%=", "lsp_msg", "claca", "%=", "diagnostics", "lsp", "cwd", "cursor" },
		modules = {
			claca = function()
				return "claca"
			end,
		},
		theme = "minimal",
		separator_style = "block",
	},

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

return M
