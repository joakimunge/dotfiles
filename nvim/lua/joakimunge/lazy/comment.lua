return {
    "numToStr/Comment.nvim",
    lazy = false,
    config = function()
        require("Comment").setup({
            -- Disable default mappings, we'll set our own
            mappings = {
                basic = false,
                extra = false,
            },
        })

        local api = require("Comment.api")

        -- Toggle comment with Ctrl+k in normal mode (current line)
        vim.keymap.set("n", "<C-k>", api.toggle.linewise.current, { desc = "Toggle comment" })

        -- Toggle comment with Ctrl+k in visual mode (selection)
        vim.keymap.set("x", "<C-k>", function()
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<ESC>", true, false, true), "nx", false)
            api.toggle.linewise(vim.fn.visualmode())
        end, { desc = "Toggle comment" })
    end,
}
