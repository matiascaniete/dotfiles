---@type MappingsTable
local M = {}

M.general = {
  n = {
    ["<leader><enter>"] = { "<cmd>.!zsh<CR>", "Execute in zsh the command in the selection" },
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
  i = {
    ["<C-z>"] = { "<cmd>.!zsh<CR>", "Execute in zsh the command in the selection" },
  },
  v = {
    ["<leader><enter>"] = { " y:'<,'>!zsh<CR><C-R>\"<CR>", "Execute in zsh all the commands in the selection" },
    [">"] = { ">gv", "indent" },
  },
}

-- more keybinds!

M.chatgpt = {
  n = {
    ["<leader>cc"] = { "<cmd>ChatGPT<CR>", "ChatGPT" },
    ["<leader>ce"] = { "<cmd>ChatGPTEditWithInstruction<CR>", "Edit with instruction" },
    ["<leader>cg"] = { "<cmd>ChatGPTRun grammar_correction<CR>", "Grammar Correction" },
    ["<leader>ct"] = { "<cmd>ChatGPTRun translate<CR>", "Translate" },
    ["<leader>ck"] = { "<cmd>ChatGPTRun keywords<CR>", "Keywords" },
    ["<leader>cd"] = { "<cmd>ChatGPTRun docstring<CR>", "Docstring" },
    ["<leader>ca"] = { "<cmd>ChatGPTRun add_tests<CR>", "Add Tests" },
    ["<leader>co"] = { "<cmd>ChatGPTRun optimize_code<CR>", "Optimize Code" },
    ["<leader>cs"] = { "<cmd>ChatGPTRun summarize<CR>", "Summarize" },
    ["<leader>cf"] = { "<cmd>ChatGPTRun fix_bugs<CR>", "Fix Bugs" },
    ["<leader>cx"] = { "<cmd>ChatGPTRun explain_code<CR>", "Explain Code" },
    ["<leader>cr"] = { "<cmd>ChatGPTRun roxygen_edit<CR>", "Roxygen Edit" },
    ["<leader>cl"] = { "<cmd>ChatGPTRun code_readability_analysis<CR>", "Code Readability Analysis" },
  },
  v = {
    ["<leader>cc"] = { "<cmd>ChatGPT<CR>", "ChatGPT" },
    ["<leader>ce"] = { "<cmd>ChatGPTEditWithInstruction<CR>", "Edit with instruction" },
    ["<leader>cg"] = { "<cmd>ChatGPTRun grammar_correction<CR>", "Grammar Correction" },
    ["<leader>ct"] = { "<cmd>ChatGPTRun translate<CR>", "Translate" },
    ["<leader>ck"] = { "<cmd>ChatGPTRun keywords<CR>", "Keywords" },
    ["<leader>cd"] = { "<cmd>ChatGPTRun docstring<CR>", "Docstring" },
    ["<leader>ca"] = { "<cmd>ChatGPTRun add_tests<CR>", "Add Tests" },
    ["<leader>co"] = { "<cmd>ChatGPTRun optimize_code<CR>", "Optimize Code" },
    ["<leader>cs"] = { "<cmd>ChatGPTRun summarize<CR>", "Summarize" },
    ["<leader>cf"] = { "<cmd>ChatGPTRun fix_bugs<CR>", "Fix Bugs" },
    ["<leader>cx"] = { "<cmd>ChatGPTRun explain_code<CR>", "Explain Code" },
    ["<leader>cr"] = { "<cmd>ChatGPTRun roxygen_edit<CR>", "Roxygen Edit" },
    ["<leader>cl"] = { "<cmd>ChatGPTRun code_readability_analysis<CR>", "Code Readability Analysis" },
  },
}

return M
