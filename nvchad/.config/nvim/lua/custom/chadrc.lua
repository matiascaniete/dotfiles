---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "gruvbox",
  theme_toggle = { "gruvbox", "one_light" },
  transparency = false,

  hl_override = highlights.override,
  hl_add = highlights.add,

  statusline = {
    -- modules arg here is the default table of modules
    overriden_modules = function(modules)
      table.insert(
        modules,
        5,
        (function()
          return "[cod:" .. vim.fn["codeium#GetStatusString"]() .. "]"
        end)()
      )

      table.insert(
        modules,
        5,
        (function()
          return "[tab:" .. vim.o.tabstop .. "]"
        end)()
      )
    end,
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
