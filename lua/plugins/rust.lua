local rust_tools = require("rust-tools")

local which_key = require("which-key")

rust_tools.setup({
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
