require('octo').setup()

vim.api.nvim_create_user_command('Issues', ':Octo issue list', { desc = 'Show issues from Github' })
