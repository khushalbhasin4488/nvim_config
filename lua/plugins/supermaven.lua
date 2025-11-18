return {
    "supermaven-inc/supermaven-nvim",
    config = function()
        require("supermaven-nvim").setup({
            keymaps = {
                accept_suggestion = "<Tab>",
                clear_suggestion = "<C-]>",
                accept_word = "<C-j>",
            },
            ignore_filetypes = { cpp = true }, -- or { "cpp", }
            color = {
                suggestion_color = "#ffffff",
                cterm = 244,
            },
            log_level = "info", -- set to "off" to disable logging completely
            disable_inline_completion = false
        })
    end,
}
