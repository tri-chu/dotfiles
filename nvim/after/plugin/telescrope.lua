local telescope = require('telescope')
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>p', builtin.find_files, {})
vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>c', builtin.commands, {})

telescope.load_extension('fzf')
telescope.setup({
    pickers = {
        find_files = {
            hidden = true,
            file_ignore_patterns = {"^./.git/", "^node_modules/"}
        },
        live_grep = {
            additional_args = function(opts)
                return {"--hidden"}
            end
        }
    }
})
