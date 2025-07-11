require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("t", "ºº", "<C-\\><C-n>", { desc = "Switch to normal mode in terminal" })
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })
map("i", "jj", "<ESC>", { desc = "Exit insert mode more quickly" })

map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map("n", "<leader>tk", "<cmd>Telescope keymaps<cr>")

local ts = require("telescope").load_extension("emoji")
map("n", "<leader>fe", ts.emoji, { desc = "[F]ind [E]moji" })
