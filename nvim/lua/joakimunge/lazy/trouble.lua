return {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup({})

            -- Toggle diagnostics panel (like VSCode's Problems)
            vim.keymap.set("n", "<leader>tt", function()
                require("trouble").toggle("diagnostics")
            end)

            -- Swedish keyboard friendly: ö = prev, ä = next
            vim.keymap.set("n", "öt", function()
                require("trouble").prev({ skip_groups = true, jump = true })
            end)

            vim.keymap.set("n", "ät", function()
                require("trouble").next({ skip_groups = true, jump = true })
            end)

        end
}
