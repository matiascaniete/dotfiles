require("nvchad.options")

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

local opt = vim.opt
-- local g = vim.g

--Disable the creation of swap files
opt.swapfile = false

-- Disable highlighting of search results
opt.hlsearch = false
-- Case insensitive searching UNLESS /C or capital in search
opt.ignorecase = true
opt.smartcase = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.smarttab = true

opt.virtualedit = "block"
-- opt.inccommand = "split"
opt.relativenumber = true
opt.scrolloff = 999

opt.wrap = false
-- vim.wo.wrap = true
-- vim.wo.linebreak = true
-- vim.wo.list = false -- extra option I set in addition to the ones in your question

-- Set background transparent, including the terminal
vim.cmd([[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
  highlight NormalFloat guibg=none
  "highlight NonTextFloat guibg=none
]])

-- Restore beam cursor when exiting vim
vim.cmd("au VimLeave * set guicursor=a:ver25-blinkon0")

require("configs.neovide")
