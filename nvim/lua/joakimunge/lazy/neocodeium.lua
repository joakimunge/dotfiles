return {
    "monkoose/neocodeium",
    event = "VeryLazy",
    config = function()
        local neocodeium = require("neocodeium")

        neocodeium.setup({
            -- Disable in special filetypes
            filetypes = {
                help = false,
                gitcommit = false,
                gitrebase = false,
                TelescopePrompt = false,
                ["dap-repl"] = false,
                ["."] = false,
            },
            -- Don't show suggestions in .env files
            filter = function(bufnr)
                if vim.endswith(vim.api.nvim_buf_get_name(bufnr), ".env") then
                    return false
                end
                return true
            end,
        })

        -- Keymaps (all in insert mode)
        vim.keymap.set("i", "<A-f>", function()
            neocodeium.accept()
        end, { desc = "Accept AI suggestion" })

        vim.keymap.set("i", "<A-w>", function()
            neocodeium.accept_word()
        end, { desc = "Accept AI suggestion (word)" })

        vim.keymap.set("i", "<A-a>", function()
            neocodeium.accept_line()
        end, { desc = "Accept AI suggestion (line)" })

        vim.keymap.set("i", "<A-e>", function()
            neocodeium.cycle_or_complete()
        end, { desc = "Cycle AI suggestions (next)" })

        vim.keymap.set("i", "<A-r>", function()
            neocodeium.cycle_or_complete(-1)
        end, { desc = "Cycle AI suggestions (prev)" })

        vim.keymap.set("i", "<A-c>", function()
            neocodeium.clear()
        end, { desc = "Clear AI suggestion" })
    end,
}
