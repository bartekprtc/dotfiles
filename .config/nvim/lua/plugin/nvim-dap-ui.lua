return {
    "rcarriga/nvim-dap-ui",

    dependencies = {
        "mfussenegger/nvim-dap",
        "folke/neodev.nvim",
    },

    config = function ()
        require("dapui").setup()
    end
}
