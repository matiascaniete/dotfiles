require("toggleterm").setup({
    size = 20,
    open_mapping = [[<c-\>]],
    hide_numbers = true, -- hide the number column in toggleterm buffers
    shade_filetypes = {},
    autochdir = false, -- when neovim changes it current directory the terminal will change it's own when next it's opened
    shade_terminals = true, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
    start_in_insert = true,
    insert_mappings = true, -- whether or not the open mapping applies in insert mode
    terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
    persist_size = true,
    persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
    direction = 'float',
    close_on_exit = true, -- close the terminal window when the process exits
    shell = vim.o.shell, -- change the default shell
    auto_scroll = true, -- automatically scroll to the bottom on terminal output
    -- This field is only relevant if direction is set to 'float'
    float_opts = {
        -- The border key is *almost* the same as 'nvim_open_win'
        -- see :h nvim_open_win for details on borders however
        -- the 'curved' border is a custom border type
        -- not natively supported but implemented in this plugin.
        border = 'single', -- like `size`, width and height can be a number or function which is passed the current terminal
        winblend = 3,
    },
    winbar = {
        enabled = true,
        name_formatter = function(term) --  term: Terminal
            return term.name
        end
    },
})

local Terminal = require('toggleterm.terminal').Terminal
local lazyGit = Terminal:new({
    cmd = 'lazygit',
    float_opts = {
        border = "rounded",
    },
    hidden = true
})

vim.api.nvim_create_user_command('LazyGit', function(_)
    lazyGit:toggle()
    print 'lg toggled!'
end, { desc = 'LazyGit toggled!' })
