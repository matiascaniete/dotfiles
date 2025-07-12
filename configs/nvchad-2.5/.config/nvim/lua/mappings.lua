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

vim.keymap.set("n", "gK", function()
	local vl = not vim.diagnostic.config().virtual_lines
	local vt = not vim.diagnostic.config().virtual_text
	vim.diagnostic.config({ virtual_lines = vl, virtual_text = vt, underline = false })
end, { desc = "Toggle diagnostic virtual_lines and virtual_text" })
