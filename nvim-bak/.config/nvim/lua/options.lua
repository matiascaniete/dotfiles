-- [[ Setting options ]]
-- See `:help vim.o`
--
vim.o.swapfile = false

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = "a"

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.smarttab = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = "yes"

vim.o.splitbelow = true
vim.o.splitright = true

vim.o.clipboard = "unnamedplus"

-- Set colorscheme
vim.o.termguicolors = true
vim.o.background = "dark"

-- vim.api.nvim_command("colorscheme kanagawa")
-- vim.api.nvim_command('colorscheme onedarker')
-- vim.api.nvim_command('colorscheme nightfox')
vim.api.nvim_command("colorscheme catppuccin")
--
-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- last status
vim.o.ls = 0

-- command height
vim.o.ch = 0

-- spell
-- vim.o.spell = 1
-- z= for listing suggestions
vim.o.spelllang = "es_es,en_us"
vim.o.spellsuggest = "best,9"

vim.o.showtabline = 2
