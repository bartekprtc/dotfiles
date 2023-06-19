return {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },

    lazy = true,
    keys = {
        "<leader>e",
        "<leader>ff",
        "<leader>fr",
        "<leader>fg",
        "<leader>fs",
        "<leader>fS",
        "<leader>fl",
        "<leader>fL",
        "<leader>fw",
        "<leader>fW",
    },

    config = function()
        vim.keymap.set(
            "n",
            "<leader>e",
            "<cmd>lua require('fzf-lua').buffers()<CR>",
            { noremap = true, silent = true }
        )
        vim.keymap.set(
            "n",
            "<leader>ff",
            "<cmd>lua require('fzf-lua').files()<CR>",
            { noremap = true, silent = true }
        )
        vim.keymap.set(
            "n",
            "<leader>fr",
            "<cmd>lua require('fzf-lua').oldfiles()<CR>",
            { noremap = true, silent = true }
        )
        vim.keymap.set(
            "n",
            "<leader>fg",
            "<cmd>lua require('fzf-lua').git_files()<CR>",
            { noremap = true, silent = true }
        )
        vim.keymap.set(
            "n",
            "<leader>fs",
            "<cmd>lua require('fzf-lua').grep()<CR>",
            { noremap = true, silent = true }
        )
        vim.keymap.set(
            "n",
            "<leader>fS",
            "<cmd>lua require('fzf-lua').grep_last()<CR>",
            { noremap = true, silent = true }
        )
        vim.keymap.set(
            "x",
            "<leader>fs",
            "<cmd>lua require('fzf-lua').grep_visual()<CR>",
            { noremap = true, silent = true }
        )
        vim.keymap.set(
            "n",
            "<leader>fl",
            "<cmd>lua require('fzf-lua').live_grep()<CR>",
            { noremap = true, silent = true }
        )
        vim.keymap.set(
            "n",
            "<leader>fL",
            "<cmd>lua require('fzf-lua').live_grep_resume()<CR>",
            { noremap = true, silent = true }
        )
        vim.keymap.set(
            "n",
            "<leader>fw",
            "<cmd>lua require('fzf-lua').grep_cword()<CR>",
            { noremap = true, silent = true }
        )
        vim.keymap.set(
            "n",
            "<leader>fW",
            "<cmd>lua require('fzf-lua').grep_cWORD()<CR>",
            { noremap = true, silent = true }
        )
    end,
}
