return { {
    'romgrk/barbar.nvim',
    config = function()
        require 'barbar'.setup {
            animation = true,
        }

        vim.keymap.set('n', '<C-,>', '<Cmd>BufferPrevious<CR>', { noremap = true, silent = true })
        vim.keymap.set('n', '<C-.>', '<Cmd>BufferNext<CR>', { noremap = true, silent = true })
        vim.keymap.set('n', '<C-1>', '<Cmd>BufferGoto 1<CR>', { noremap = true, silent = true })
        vim.keymap.set('n', '<C-2>', '<Cmd>BufferGoto 2<CR>', { noremap = true, silent = true })
        vim.keymap.set('n', '<C-3>', '<Cmd>BufferGoto 3<CR>', { noremap = true, silent = true })
        vim.keymap.set('n', '<C-4>', '<Cmd>BufferGoto 4<CR>', { noremap = true, silent = true })
        vim.keymap.set('n', '<C-5>', '<Cmd>BufferGoto 5<CR>', { noremap = true, silent = true })
        vim.keymap.set('n', '<C-6>', '<Cmd>BufferGoto 6<CR>', { noremap = true, silent = true })
        vim.keymap.set('n', '<C-7>', '<Cmd>BufferGoto 7<CR>', { noremap = true, silent = true })
        vim.keymap.set('n', '<C-8>', '<Cmd>BufferGoto 8<CR>', { noremap = true, silent = true })
        vim.keymap.set('n', '<C-9>', '<Cmd>BufferGoto 9<CR>', { noremap = true, silent = true })
        vim.keymap.set('n', '<C-0>', '<Cmd>BufferLast<CR>', { noremap = true, silent = true })
        vim.keymap.set('n', '<C-c>', '<Cmd>BufferClose<CR>', { noremap = true, silent = true })
    end
},
}
