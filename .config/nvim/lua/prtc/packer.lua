vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
    -- package manager
    use("wbthomason/packer.nvim")

    -- colour scheme
    use("bartekprtc/gruv-vsassist.nvim")

    -- syntax/colours highlighting
    use("nvim-treesitter/nvim-treesitter", { run = "TSUpdate" })
    -- use("nvim-treesitter/playground")
    use("NvChad/nvim-colorizer.lua")

    -- matching symbols (), "", etc
    use("windwp/nvim-autopairs")
    use("kylechui/nvim-surround")
    use({
        "utilyre/sentiment.nvim",
        tag = "*",
    })

    -- undo changes
    use("mbbill/undotree")

    -- git
    use("tpope/vim-fugitive")
    use("lewis6991/gitsigns.nvim")

    -- lsp/autocompletion/snippets/formatting
    use({
        "vonheikemen/lsp-zero.nvim",
        branch = "v2.x",
        requires = {
            -- lsp support
            { "neovim/nvim-lspconfig" }, -- required
            {
                "williamboman/mason.nvim",
                run = function()
                    pcall(vim.cmd, "MasonUpdate")
                end,
            }, -- optional
            { "williamboman/mason-lspconfig.nvim" }, -- optional

            -- autocompletion
            { "hrsh7th/nvim-cmp" }, -- required
            { "hrsh7th/cmp-nvim-lsp" }, -- required
            { "hrsh7th/cmp-buffer" }, -- optional
            { "hrsh7th/cmp-path" }, -- optional
            { "saadparwaiz1/cmp_luasnip" }, -- optional
            { "hrsh7th/cmp-nvim-lua" }, -- optional

            -- snippets
            { "l3mon4d3/luasnip" }, -- required
            { "rafamadriz/friendly-snippets" }, -- optional
        },
    })
    use("ray-x/lsp_signature.nvim")
    use("j-hui/fidget.nvim")
    use({
        "weilbith/nvim-code-action-menu",
        cmd = "CodeActionMenu",
    })
    use("VidocqH/lsp-lens.nvim")
    use("jose-elias-alvarez/null-ls.nvim")

    -- statusline, tabline
    use({
        "nvim-lualine/lualine.nvim",
        requires = { "nvim-tree/nvim-web-devicons", opt = true },
    })
    use({
        "utilyre/barbecue.nvim",
        tag = "*",
        requires = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        -- after = "nvim-web-devicons", -- keep this if you're using NvChad
    })

    use("nvim-treesitter/nvim-treesitter-context")

    -- indents
    use("lukas-reineke/indent-blankline.nvim")
    use("yamatsum/nvim-cursorline")
    use("nmac427/guess-indent.nvim")

    -- file explorer
    use({
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            {
                "s1n7ax/nvim-window-picker",
                tag = "v1.*",
            },
        },
    })

    -- clean on save
    use("mcauley-penney/tidy.nvim")

    -- comments
    use("numToStr/Comment.nvim")
    use({
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
    })
    use({
        "danymat/neogen",
        requires = "nvim-treesitter/nvim-treesitter",
    })

    -- better quickfix window
    use({ "kevinhwang91/nvim-bqf", ft = "qf" })

    -- fuzzy finder
    use({
        "ibhagwan/fzf-lua",
        -- optional for icon support
        requires = { "nvim-tree/nvim-web-devicons" },
    })

    -- split/join blocks
    use({
        "Wansmer/treesj",
        requires = { "nvim-treesitter" },
    })

    -- symbols outline
    use("simrat39/symbols-outline.nvim")

    -- open files at last edit place
    use("ethanholz/nvim-lastplace")

    -- move lines/blocks
    use("booperlv/nvim-gomove")
end)
