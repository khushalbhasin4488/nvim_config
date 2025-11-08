local function enable_transparency()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
end
return {
    {
        "folke/tokyonight.nvim",
        config = function()
            -- load the colorscheme here
            vim.cmd.colorscheme "tokyonight-moon"
            enable_transparency()
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            theme = "tokyonight",
        }
        -- opts = function(_, opts)
        --     table.insert(
        --         opts.sections.lualine_x,
        --         2,
        --         LazyVim.lualine.status(LazyVim.config.icons.kinds.Copilot, function()
        --             local clients = package.loaded["copilot"] and vim.lsp.get_clients({ name = "copilot", bufnr = 0 }) or
        --             {}
        --             if #clients > 0 then
        --                 local status = require("copilot.status").data.status
        --                 return (status == "InProgress" and "pending") or (status == "Warning" and "error") or "ok"
        --             end
        --         end)
        --     )
        -- end,
    },

}
