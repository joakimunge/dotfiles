return {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "stevearc/dressing.nvim", -- optional for improved UI
    },
    ft = { "dart" },
    config = function()
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities()
        )

        require("flutter-tools").setup({
            ui = {
                border = "rounded",
                notification_style = "native",
            },
            decorations = {
                statusline = {
                    app_version = false,
                    device = true,
                    project_config = false,
                },
            },
            debugger = {
                enabled = true,
                run_via_dap = true,
                exception_breakpoints = {},
                register_configurations = function(_)
                    require("dap").configurations.dart = {
                        {
                            type = "dart",
                            request = "launch",
                            name = "Launch Flutter",
                            dartSdkPath = nil, -- auto-detected
                            flutterSdkPath = nil, -- auto-detected
                            program = "${workspaceFolder}/lib/main.dart",
                            cwd = "${workspaceFolder}",
                        },
                        {
                            type = "dart",
                            request = "attach",
                            name = "Attach to Flutter",
                            dartSdkPath = nil,
                            flutterSdkPath = nil,
                            cwd = "${workspaceFolder}",
                        },
                    }
                end,
            },
            widget_guides = {
                enabled = true, -- show widget guides in the gutter
            },
            closing_tags = {
                enabled = true, -- show closing tags for widgets
                highlight = "Comment",
                prefix = "// ",
            },
            dev_log = {
                enabled = true,
                notify_errors = false,
                open_cmd = "tabedit", -- open dev log in a new tab
            },
            dev_tools = {
                autostart = false,
                auto_open_browser = false,
            },
            outline = {
                open_cmd = "30vnew", -- open outline in a vertical split
                auto_open = false,
            },
            lsp = {
                capabilities = capabilities,
                color = {
                    enabled = true, -- show color decorators
                    background = false,
                    foreground = false,
                    virtual_text = true,
                    virtual_text_str = "  ",
                },
                on_attach = function(client, bufnr)
                    -- Flutter-specific keymaps
                    local opts = { buffer = bufnr, silent = true }
                    vim.keymap.set("n", "<leader>fr", "<cmd>FlutterRun<cr>", vim.tbl_extend("force", opts, { desc = "Flutter Run" }))
                    vim.keymap.set("n", "<leader>fq", "<cmd>FlutterQuit<cr>", vim.tbl_extend("force", opts, { desc = "Flutter Quit" }))
                    vim.keymap.set("n", "<leader>fR", "<cmd>FlutterRestart<cr>", vim.tbl_extend("force", opts, { desc = "Flutter Restart" }))
                    vim.keymap.set("n", "<leader>fd", "<cmd>FlutterDevices<cr>", vim.tbl_extend("force", opts, { desc = "Flutter Devices" }))
                    vim.keymap.set("n", "<leader>fe", "<cmd>FlutterEmulators<cr>", vim.tbl_extend("force", opts, { desc = "Flutter Emulators" }))
                    vim.keymap.set("n", "<leader>fo", "<cmd>FlutterOutlineToggle<cr>", vim.tbl_extend("force", opts, { desc = "Flutter Outline" }))
                    vim.keymap.set("n", "<leader>fl", "<cmd>FlutterDevTools<cr>", vim.tbl_extend("force", opts, { desc = "Flutter DevTools" }))
                    vim.keymap.set("n", "<leader>fL", "<cmd>FlutterLogClear<cr>", vim.tbl_extend("force", opts, { desc = "Flutter Log Clear" }))
                    vim.keymap.set("n", "<leader>fs", "<cmd>FlutterSuper<cr>", vim.tbl_extend("force", opts, { desc = "Flutter Super" }))
                    vim.keymap.set("n", "<leader>fa", "<cmd>FlutterReanalyze<cr>", vim.tbl_extend("force", opts, { desc = "Flutter Reanalyze" }))
                end,
                settings = {
                    showTodos = true,
                    completeFunctionCalls = true,
                    renameFilesWithClasses = "prompt",
                    enableSnippets = true,
                    updateImportsOnRename = true,
                },
            },
        })
    end,
}
