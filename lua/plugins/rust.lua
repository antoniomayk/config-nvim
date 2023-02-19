local rust_tools = require("rust-tools")

local which_key = require("which-key")

rust_tools.setup({
    tools = {
        executor = require("rust-tools.executors").termopen,
        on_initialized = nil,
        reload_workspace_from_cargo_toml = true,
        inlay_hints = {
            auto = false,
            only_current_line = false,
            show_parameter_hints = true,
            parameter_hints_prefix = "<- ",
            other_hints_prefix = "=> ",
            max_len_align = false,
            max_len_align_padding = 1,
            right_align = false,
            right_align_padding = 7,
            highlight = "Comment",
        },
        hover_actions = {
            border = {
                { "┌", "FloatBorder" },
                { "─", "FloatBorder" },
                { "┐", "FloatBorder" },
                { "│", "FloatBorder" },
                { "┘", "FloatBorder" },
                { "─", "FloatBorder" },
                { "└", "FloatBorder" },
                { "│", "FloatBorder" },
            },
            max_width = nil,
            max_height = nil,
            auto_focus = true,
        },
        crate_graph = {
            backend = "x11",
            output = nil,
            full = true,
            enabled_graphviz_backends = {
                "bmp",
                "cgimage",
                "canon",
                "dot",
                "gv",
                "xdot",
                "xdot1.2",
                "xdot1.4",
                "eps",
                "exr",
                "fig",
                "gd",
                "gd2",
                "gif",
                "gtk",
                "ico",
                "cmap",
                "ismap",
                "imap",
                "cmapx",
                "imap_np",
                "cmapx_np",
                "jpg",
                "jpeg",
                "jpe",
                "jp2",
                "json",
                "json0",
                "dot_json",
                "xdot_json",
                "pdf",
                "pic",
                "pct",
                "pict",
                "plain",
                "plain-ext",
                "png",
                "pov",
                "ps",
                "ps2",
                "psd",
                "sgi",
                "svg",
                "svgz",
                "tga",
                "tiff",
                "tif",
                "tk",
                "vml",
                "vmlz",
                "wbmp",
                "webp",
                "xlib",
                "x11",
            },
        },
    },
    server = {
        on_attach = function(_, bufnr)
            LSP_ON_ATTACH(_, bufnr)

            local bufopts = { noremap = true, silent = true, buffer = bufnr }
            local whichkey_bufopts = { table.unpack(bufopts), prefix = "<leader>" }

            which_key.register({
                l = { name = "+lsp", a = { rust_tools.code_action_group.code_action_group, "code action" } },
            }, whichkey_bufopts)

            vim.keymap.set("n", "<C-space>", rust_tools.hover_actions.hover_actions, bufopts)
        end,
        flags = LSP_FLAGS(),
        capabilities = LSP_CAPABILITIES(),
    },
})
