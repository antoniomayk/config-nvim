require("telescope").setup({
    defaults = {
        border = true,
        borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        prompt_prefix = "",
    },
    pickers = {},
    extensions = {},
})

require("which-key").register({
    f = {
        name = "+finder",
        c = { "<cmd>Telescope commands<cr>", "find commands" },
        f = { "<cmd>Telescope find_files<cr>", "find files" },
        b = { "<cmd>Telescope buffers<cr>", "find buffers" },
        g = { "<cmd>Telescope live_grep<cr>", "live grep" },
        h = { "<cmd>Telescope help_tags<cr>", "help tags" },
    },
}, { prefix = "<leader>" })
