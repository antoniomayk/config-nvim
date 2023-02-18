require("toggleterm").setup({
    hide_numbers = true,
    shade_filetypes = {},
    autochdir = false,
    shade_terminals = true,
    start_in_insert = true,
    insert_mappings = true,
    terminal_mappings = true,
    persist_size = true,
    persist_mode = true,
    direction = "float",
    close_on_exit = true,
    shell = vim.o.shell,
    auto_scroll = true,
    float_opts = { border = "single", winblend = 3 },
    winbar = {
        enabled = false,
        name_formatter = function(term)
            return term.name
        end,
    },
})

require("which-key").register({
    t = {
        name = "+terminal",
        n = {
            name = "+new",
            f = { ":ToggleTerm direction=float<cr>", "open new terminal float" },
            j = { ":ToggleTerm direction=horizontal<cr>", "open new terminal horizontal" },
            l = { ":ToggleTerm direction=vertical<cr>", "open new terminal vertical" },
        },
        t = { ":ToggleTerm<cr>", "toggle terminal" },
    },
}, { prefix = "<leader>" })
