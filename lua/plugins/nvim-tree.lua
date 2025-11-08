return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons", -- optional, but recommended
        },
        opts = {
            size = 20
        },
        config = function()
            local tree = require("neo-tree.command")
            vim.keymap.set("n", "n", function() tree.execute({ toggle = true }) end)
            vim.keymap.set("n", "gn", function() tree.execute({ source = "git_status", toggle = true }) end)
            vim.keymap.set("n", "bn", function() tree.execute({ source = "buffers", toggle = true }) end)
        end,
        default_component_configs = {
            indent = {
                with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
                expander_collapsed = "",
                expander_expanded = "",
                expander_highlight = "NeoTreeExpander",
            },
            git_status = {
                symbols = {
                    unstaged = "󰄱",
                    staged = "󰱒",
                },
            },
        },
    }
}
