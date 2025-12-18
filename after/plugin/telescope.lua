local telescope_status, telescope = pcall(require, 'telescope')
if not telescope_status then
    return
end

-- Setup telescope
telescope.setup({
    defaults = {
        layout_strategy = 'horizontal',
        layout_config = {
            horizontal = {
                prompt_position = 'top',
                preview_width = 0.55,
                height = 0.7,
                width = 0.85,
            },
        },
        sorting_strategy = 'ascending',
        prompt_prefix = '🔍 ',
        selection_caret = '➜ ',
        border = true,
        borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
        winblend = 0,
    },
})

local builtin_status, builtin = pcall(require, 'telescope.builtin')
if not builtin_status then
    return
end

-- Keymaps
vim.keymap.set('n', '<leader><leader>', builtin.find_files, { desc = 'Find files' })
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Help tags' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = 'Workspace diagnostics' })
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
