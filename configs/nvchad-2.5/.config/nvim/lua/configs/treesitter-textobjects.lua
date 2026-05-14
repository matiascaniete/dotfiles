require("nvim-treesitter-textobjects").setup({
  select = {
    lookahead = true,
    selection_modes = {
      ["@parameter.outer"] = "v",
      ["@function.outer"] = "V",
      ["@class.outer"] = "V",
    },
    include_surrounding_whitespace = false,
  },
  move = {
    set_jumps = true,
  },
})

local select = require("nvim-treesitter-textobjects.select")

vim.keymap.set({ "x", "o" }, "ac", function()
  select.select_textobject("@class.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "ic", function()
  select.select_textobject("@class.inner", "textobjects")
end)

vim.keymap.set({ "x", "o" }, "am", function()
  select.select_textobject("@function.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "im", function()
  select.select_textobject("@function.inner", "textobjects")
end)

vim.keymap.set({ "x", "o" }, "af", function()
  select.select_textobject("@call.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "if", function()
  select.select_textobject("@call.inner", "textobjects")
end)

vim.keymap.set({ "x", "o" }, "al", function()
  select.select_textobject("@loop.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "il", function()
  select.select_textobject("@loop.inner", "textobjects")
end)

vim.keymap.set({ "x", "o" }, "ai", function()
  select.select_textobject("@conditional.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "ii", function()
  select.select_textobject("@conditional.inner", "textobjects")
end)

vim.keymap.set({ "x", "o" }, "a=", function()
  select.select_textobject("@assignment.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "i=", function()
  select.select_textobject("@assignment.inner", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "l=", function()
  select.select_textobject("@assignment.lhs", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "r=", function()
  select.select_textobject("@assignment.rhs", "textobjects")
end)

vim.keymap.set({ "x", "o" }, "aa", function()
  select.select_textobject("@parameter.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "ia", function()
  select.select_textobject("@parameter.inner", "textobjects")
end)

local swap = require("nvim-treesitter-textobjects.swap")

vim.keymap.set("n", "<leader>na", function()
  swap.swap_next({ "@parameter.inner" }, "textobjects")
end)
vim.keymap.set("n", "<leader>nm", function()
  swap.swap_next({ "@function.inner" }, "textobjects")
end)
vim.keymap.set("n", "<leader>pa", function()
  swap.swap_previous({ "@parameter.inner" }, "textobjects")
end)
vim.keymap.set("n", "<leader>pm", function()
  swap.swap_previous({ "@function.inner" }, "textobjects")
end)

local move = require("nvim-treesitter-textobjects.move")

vim.keymap.set("n", "]m", function()
  move.goto_next_start({ "@function.outer" }, "textobjects")
end)
vim.keymap.set("n", "[m", function()
  move.goto_previous_start({ "@function.outer" }, "textobjects")
end)
vim.keymap.set("n", "]c", function()
  move.goto_next_start({ "@class.outer" }, "textobjects")
end)
vim.keymap.set("n", "[c", function()
  move.goto_previous_start({ "@class.outer" }, "textobjects")
end)
