return {
    "yamatsum/nvim-cursorline",

    config = function()
        require("nvim-cursorline").setup({
            cursorline = {
                enable = true,
                timeout = 0,
                number = false,
            },
            cursorword = {
                enable = true,
                min_length = 3,
                hl = { underline = false, bg = "#454545" },
            },
        })
    end,
}