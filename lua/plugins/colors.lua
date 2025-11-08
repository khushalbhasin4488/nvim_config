local function enable_transparency()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
end
local colors = {
    bg       = '#202328',
    fg       = '#bbc2cf',
    yellow   = '#ECBE7B',
    cyan     = '#008080',
    darkblue = '#081633',
    green    = '#98be65',
    orange   = '#FF8800',
    violet   = '#a9a1e1',
    magenta  = '#c678dd',
    blue     = '#51afef',
    red      = '#ec5f67',
}

local conditions = {
    buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
    end,
    hide_in_width = function()
        return vim.fn.winwidth(0) > 80
    end,
    check_git_workspace = function()
        local filepath = vim.fn.expand('%:p:h')
        local gitdir = vim.fn.finddir('.git', filepath .. ';')
        return gitdir and #gitdir > 0 and #gitdir < #filepath
    end,
}

return {
    {
        "olimorris/onedarkpro.nvim",
    },
    -- {
    --     "ellisonleao/gruvbox.nvim",
    --     config = true,
    -- },
    -- {
    --     "folke/tokyonight.nvim",
    --     config = function()
    --         -- load the colorscheme here
    --         vim.cmd.colorscheme "tokyonight-night"
    --         enable_transparency()
    --     end,
    -- },
    {
        "akinsho/bufferline.nvim",
        opts = {
            options = {
                -- stylua: ignore
                close_command = function(n) Snacks.bufdelete(n) end,
                -- stylua: ignore
                right_mouse_command = function(n) Snacks.bufdelete(n) end,
                diagnostics = "nvim_lsp",
                always_show_bufferline = false,
                diagnostics_indicator = function(_, _, diag)
                    local icons = LazyVim.config.icons.diagnostics
                    local ret = (diag.error and icons.Error .. diag.error .. " " or "")
                        .. (diag.warning and icons.Warn .. diag.warning or "")
                    return vim.trim(ret)
                end,
                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "Neo-tree",
                        highlight = "Directory",
                        text_align = "left",
                    },
                    {
                        filetype = "snacks_layout_box",
                    },
                },
                ---@param opts bufferline.IconFetcherOpts
                get_element_icon = function(opts)
                    return LazyVim.config.icons.ft[opts.filetype]
                end,
            },
        },
        config = function(_, opts)
            require("bufferline").setup(opts)
            -- Fix bufferline when restoring a session
            vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete" }, {
                callback = function()
                    vim.schedule(function()
                        pcall(nvim_bufferline)
                    end)
                end,
            })
        end,
    },
    -- {
    --     "nvim-lualine/lualine.nvim",
    --     dependencies = {
    --         "nvim-tree/nvim-web-devicons",
    --     },
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
    -- },

}
