return {
    "weilbith/nvim-code-action-menu",
    cmd = "CodeActionMenu",
    keys = { "<F4>" },

    config = function()
        vim.keymap.set("n", "<F4>", "<cmd>CodeActionMenu<CR>")
    end,
}
