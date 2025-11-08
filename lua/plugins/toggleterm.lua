return {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
        size = 20,
        open_mapping = [[<c-\>]],
        direction = "horizontal", -- Or "horizontal" for bottom split
        hide_numbers = true,
        border = "single",
        start_in_insert = true,
        insert_mappings = true,   -- whether or not the open mapping applies in insert mode
        terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
        persist_size = true,
        persist_mode = true,
        close_on_exit = true, -- close the terminal window when the process exits
        clear_env = false,
        shell = vim.o.shell,
        float_opts = {
            border = "curved",
            winbled = 0,
            highlights = {
                border = "Normal",
                background = "Normal"
            },
        },
    },

    -- keys = {
    --     {
    --         "<leader>td",
    --         "<cmd>ToggleTerm size=20 direction=horizontal<cr>",
    --         desc = "Open a horizontal terminal at the Desktop directory",
    --     },
    -- },
    winbar = {
        enabled = false,
        name_formatter = function(term) --  term: Terminal
            return term.name
        end

    },

    config = function(_, opts)
        require("toggleterm").setup(opts)
    end,
}
