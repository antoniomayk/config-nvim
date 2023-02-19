local lsp_keys = function(bufopts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
end

local lsp_keys_wichkey = function(whichkey_opts, whichkey_bufopts)
    local which_key = require "which-key"

    which_key.register({
        l = {
            name = "+lsp",
            g = { name = "+goto", p = { vim.lsp.buf.goto_prev, "prev" }, n = { vim.lsp.buf.goto_next, "next" } },
        },
    }, whichkey_opts)

    which_key.register({
        l = {
            name = "+lsp",
            g = {
                name = "+goto",
                D = { vim.lsp.buf.declaration, "declaration" },
                d = { vim.lsp.buf.definition, "definition" },
                i = { vim.lsp.buf.implementation, "implementation" },
            },
            K = { vim.lsp.buf.signature_help, "signature help" },
            k = { vim.lsp.buf.hover, "hover" },
            D = { vim.lsp.buf.type_definition, "type definition" },
            r = { vim.lsp.buf.rename, "rename" },
            R = { vim.lsp.buf.references, "references" },
            a = { vim.lsp.buf.code_action, "code action" },
            f = {
                function()
                    vim.lsp.buf.format { async = true }
                end,
                "format",
            },
            w = {
                name = "+workspace",
                a = { vim.lsp.buf.add_workspace_folder, "add workspace folder" },
                r = { vim.lsp.buf.remove_workspace_folder, "remove workspace folder" },
                l = {
                    function()
                        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    end,
                    "list workspace folder",
                },
            },
        },
    }, whichkey_bufopts)
end

LSP_ON_ATTACH = function(_, bufnr)
    local opts = { noremap = true, silent = true }
    local bufopts = { table.unpack(opts), buffer = bufnr }

    lsp_keys(bufopts)

    local whichkey_opts = { table.unpack(opts), prefix = "<leader>" }
    local whichkey_bufopts = { table.unpack(bufopts), prefix = "<leader>" }

    lsp_keys_wichkey(whichkey_opts, whichkey_bufopts)
end

LSP_FLAGS = function()
    return { debounce_text_changes = 150 }
end

LSP_CAPABILITIES = function()
    return require("cmp_nvim_lsp").default_capabilities()
end
