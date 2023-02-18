local util = require "formatter.util"

require("formatter").setup({
    logging = true,
    log_level = vim.log.levels.WARN,
    filetype = {
        lua = {
            function()
                return {
                    exe = "lua-format",
                    args = {
                        util.escape_path(util.get_current_buffer_file_path()),
                        "--column-limit=120",
                        "--indent-width=4",
                        "--no-use-tab",
                        "--continuation-indent-width=4",
                        "--spaces-before-call=1",
                        "--no-keep-simple-control-block-one-line",
                        "--no-keep-simple-function-one-line",
                        "--align-args",
                        "--no-break-after-functioncall-lp",
                        "--no-break-before-functioncall-rp",
                        "--no-spaces-inside-functioncall-parens",
                        "--no-spaces-inside-functiondef-parens",
                        "--align-parameter",
                        "--chop-down-parameter",
                        "--break-after-functiondef-lp",
                        "--break-before-functiondef-rp",
                        "--align-table-field",
                        "--break-after-table-lb",
                        "--break-before-table-rb",
                        "--chop-down-table",
                        "--chop-down-kv-table",
                        "--extra-sep-at-table-end",
                        "--spaces-inside-table-braces",
                        "--break-after-operator",
                        "--single-quote-to-double-quote",
                        "--spaces-around-equals-in-field",
                    },
                    stdin = true,
                }
            end,
        },
        rust = { require("formatter.filetypes.rust").rustfmt },
        fish = { require("formatter.filetypes.fish").fishindent },
        python = { require("formatter.filetypes.python").black },
        sh = { require("formatter.filetypes.sh").shfmt },
        ["*"] = { require("formatter.filetypes.any").remove_trailing_whitespace },
    },
})

vim.api.nvim_create_autocmd("BufWritePost", {
    command = "FormatWrite",
    group = vim.api.nvim_create_augroup("FormatAutogroup", { clear = true }),
})

require("which-key").register({
    b = { name = "+buffer", f = { ":Format<cr>", "format" }, F = { ":FormatWrite<cr>", "format write" } },
}, { prefix = "<leader>" })
