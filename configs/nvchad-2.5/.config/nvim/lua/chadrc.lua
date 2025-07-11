-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

local function windsurf_custom_status()
	local status = require("codeium.virtual_text").status()

	if status.state == "idle" then
		-- Output was cleared, for example when leaving insert mode
		return " "
	end

	if status.state == "waiting" then
		-- Waiting for response
		return "Waiting..."
	end

	if status.state == "completions" and status.total > 0 then
		return string.format("%d/%d", status.current, status.total)
	end

	return " 0 "
end

M.ui = {
	theme = "catppuccin",
	transparency = true,
	statusline = {
		order = {
			"mode",
			"file",
			"git",
			"%=",
			"lsp_msg",
			"wc",
			"%=",
			"windsurf",
			"%=",
			"diagnostics",
			"lsp",
			"cwd",
			"cursor",
		},
		modules = {
			wc = function()
				local wordcount = vim.fn.wordcount().words
				local charcount = vim.fn.wordcount().chars
				return " " .. wordcount .. "w " .. charcount .. "c"
			end,
			windsurf = function()
				return "󱝆 " .. windsurf_custom_status()
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
