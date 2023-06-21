return {
    "rcarriga/nvim-dap-ui",

    dependencies = {
        "mfussenegger/nvim-dap",
        "folke/neodev.nvim",
    },

    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        -- Setup adapters
        dap.adapters.lldb = {
            type = "executable",
            command = "/usr/bin/lldb-vscode",
            name = "lldb",
        }

        -- Setup configuration
        dap.configurations.cpp = {
            {
                name = "Launch",
                type = "lldb",
                request = "launch",
                program = function()
                    return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                end,
                cwd = "${workspaceFolder}",
                stopOnEntry = false,
                args = {},
            },
        }

        -- Setup remaps
        vim.keymap.set("n", "<F5>", function()
            dap.continue()
        end)
        vim.keymap.set("n", "<F9>", function()
            dap.toggle_breakpoint()
        end)
        vim.keymap.set("n", "<F10>", function()
            dap.step_over()
        end)
        vim.keymap.set("n", "<F11>", function()
            dap.step_into()
        end)
        vim.keymap.set("n", "<F12>", function()
            dap.step_out()
        end)

        -- Automatically open/close dapui on debugging session
        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
        end

        dapui.setup({
            controls = {
                element = "repl",
                enabled = true,
                icons = {
                    disconnect = "",
                    pause = "",
                    play = "",
                    run_last = "",
                    step_back = "",
                    step_into = "",
                    step_out = "",
                    step_over = "",
                    terminate = "",
                },
            },
            element_mappings = {},
            expand_lines = true,
            floating = {
                border = "single",
                mappings = {
                    close = { "q", "<Esc>" },
                },
            },
            force_buffers = true,
            icons = {
                collapsed = "",
                current_frame = "",
                expanded = "",
            },
            layouts = {
                {
                    elements = {
                        {
                            id = "scopes",
                            size = 0.25,
                        },
                        {
                            id = "breakpoints",
                            size = 0.25,
                        },
                        {
                            id = "stacks",
                            size = 0.25,
                        },
                        {
                            id = "watches",
                            size = 0.25,
                        },
                    },
                    position = "left",
                    size = 40,
                },
                {
                    elements = {
                        {
                            id = "repl",
                            size = 1.0,
                        },
                        -- {
                        --     id = "console",
                        --     size = 0.5,
                        -- },
                    },
                    position = "bottom",
                    size = 10,
                },
            },
            mappings = {
                edit = "e",
                expand = { "<CR>", "<2-LeftMouse>" },
                open = "o",
                remove = "d",
                repl = "r",
                toggle = "t",
            },
            render = {
                indent = 1,
                max_value_lines = 100,
            },
        })

        -- Map K to hover when in session
        local api = vim.api
        local keymap_restore = {}
        dap.listeners.after["event_initialized"]["me"] = function()
            for _, buf in pairs(api.nvim_list_bufs()) do
                local keymaps = api.nvim_buf_get_keymap(buf, "n")
                for _, keymap in pairs(keymaps) do
                    if keymap.lhs == "K" then
                        table.insert(keymap_restore, keymap)
                        api.nvim_buf_del_keymap(buf, "n", "K")
                    end
                end
            end
            api.nvim_set_keymap(
                "n",
                "K",
                "<cmd>lua require('dapui').eval()<cr><cmd>lua require('dapui').eval()<cr>",
                { silent = true }
            )
        end

        dap.listeners.after["event_terminated"]["me"] = function()
            for _, keymap in pairs(keymap_restore) do
                api.nvim_buf_set_keymap(
                    keymap.buffer,
                    keymap.mode,
                    keymap.lhs,
                    keymap.rhs,
                    { silent = keymap.silent == 1 }
                )
            end
            keymap_restore = {}
        end

        -- Setup custom breakpoint & current line icons
        local dap_breakpoint = {
            error = {
                text = "",
                texthl = "DiagnosticSignError",
                linehl = "",
                numhl = "",
            },
            rejected = {
                text = "",
                texthl = "DiagnosticSignHint",
                linehl = "",
                numhl = "",
            },
            stopped = {
                text = "",
                texthl = "DiagnosticSignInfo",
                linehl = "DiagnosticUnderlineInfo",
                numhl = "DiagnosticSignInfo",
            },
        }

        vim.fn.sign_define("DapBreakpoint", dap_breakpoint.error)
        vim.fn.sign_define("DapStopped", dap_breakpoint.stopped)
        vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)
    end,
}
