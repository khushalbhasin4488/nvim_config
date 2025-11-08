return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "BufReadPost",
    opts = {
        suggestion = {
            enabled = not vim.g.ai_cmp,
            auto_trigger = true,
            hide_during_completion = vim.g.ai_cmp,
            keymap = {
                accept = false, -- handled by nvim-cmp / blink.cmp
                next = "<M-]>",
                prev = "<M-[>",
            },
        },
        panel = { enabled = false },
        filetypes = {
            markdown = true,
            help = true,
        },
    },
    -- how it will accept copilot suggestions , keybinds ?
    config = function(_, opts)
        require("copilot").setup(opts)
    end,

    -- which keybinds to use ?
    keys = {
        { "<leader>ca", mode = "i", function() require("copilot.suggestion").accept() end, desc = "Accept Copilot Suggestion" },
        { "<M-]>",      mode = "i", function() require("copilot.suggestion").next() end,   desc = "Next Copilot Suggestion" },
        { "<M-[>",      mode = "i", function() require("copilot.suggestion").prev() end,   desc = "Previous Copilot Suggestion" },


    }


}
