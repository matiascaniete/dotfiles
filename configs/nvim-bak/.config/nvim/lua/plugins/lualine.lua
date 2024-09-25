-- Set lualine as statusline
-- See `:help lualine.txt`
local function tabinfo()
    return "tab:" .. vim.o.tabstop
end

local function project()
    return "prj:" .. vim.lsp.buf.list_workspace_folders()[1]
end

local function codeium()
    return "cod:" .. vim.fn["codeium#GetStatusString"]()
end

require("lualine").setup({
    options = {
        theme = "gruvbox-material",
    },
    sections = {
        lualine_c = { tabinfo, project, codeium },
    },
})
require("colorizer").setup()
