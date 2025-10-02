-- Custom keymaps

-- Visual mode paste without overwriting register
vim.keymap.set('x', '<leader>p', '"_dP', { desc = 'Paste without overwriting register' })
