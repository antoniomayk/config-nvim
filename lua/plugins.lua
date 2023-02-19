local packer = require("packer")

packer.startup(function(use)
    use({ "wbthomason/packer.nvim" })

    use({
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    })

    use({
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup()
        end,
    })

    use({
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup({ "*" })
        end,
    })

    use({
        "mhartington/formatter.nvim",
        config = function()
            require("plugins.formatter")
        end,
    })

    use({
        "williamboman/mason.nvim",
        requires = { "williamboman/mason-lspconfig.nvim" },
        config = function()
            require("plugins.mason")
        end,
    })

    use({
        "neovim/nvim-lspconfig",
        requires = { "folke/neodev.nvim", "simrat39/rust-tools.nvim" },
        config = function()
            require("plugins.lsp")
            require("plugins.rust")
        end,
    })

    use({
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-vsnip",
            "hrsh7th/vim-vsnip",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-nvim-lsp-signature-help",
        },
        config = function()
            require("plugins.cmp")
        end,
    })

    use({
        "catppuccin/nvim",
        config = function()
            require("plugins.catppuccin")
        end,
    })

    use({
        "akinsho/toggleterm.nvim",
        config = function()
            require("plugins.toggleterm")
        end,
    })

    use({
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("plugins.indent")
        end,
    })

    use({
        "nvim-lualine/lualine.nvim",
        config = function()
            require("plugins.lualine")
        end,
    })

    use({
        "lewis6991/gitsigns.nvim",
        config = function()
            require("plugins.gitsigns")
        end,
    })

    use({
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("plugins.treesitter")
        end,
    })

    use({
        "nvim-neo-tree/neo-tree.nvim",
        requires = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
        config = function()
            require("plugins.neotree")
        end,
    })

    use({
        "nvim-telescope/telescope.nvim",
        requires = { "nvim-lua/plenary.nvim" },
        config = function()
            require("plugins.telescope")
        end,
    })

    use({
        "folke/which-key.nvim",
        config = function()
            require("plugins.whichkey")
        end,
    })
end)

vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "plugins.lua",
    command = "source <afile> | PackerCompile",
    group = vim.api.nvim_create_augroup("packer_user_config", { clear = true }),
})
