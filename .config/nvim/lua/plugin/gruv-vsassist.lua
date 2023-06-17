return {
    "bartekprtc/gruv-vsassist.nvim",

    priority = 1000, -- Need this loaded before everything else

    config = function()
        require("gruv-vsassist").setup({
            -- Enable transparent background
            transparent = false,

            -- Enable italic comment
            italic_comments = true,
        })
    end,
}
