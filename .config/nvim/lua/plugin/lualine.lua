return {
    "nvim-lualine/lualine.nvim",

    dependencies = { "nvim-tree/nvim-web-devicons" },

    config = function()
        require("lualine").setup({
            extensions = { "fugitive", "fzf", "neo-tree", "nvim-dap-ui", "symbols-outline" },
        })
    end,
}
