require("treesj").setup({
    use_default_keymaps = false,
    max_join_length = 200,
})

vim.keymap.set("n", "<leader>bt", "<cmd>TSJToggle<CR>")
vim.keymap.set("n", "<leader>bj", "<cmd>TSJJoin<CR>")
vim.keymap.set("n", "<leader>bs", "<cmd>TSJSplit<CR>")
