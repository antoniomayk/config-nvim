local lspconfig = require("lspconfig")

local lsp_keys = function(bufopts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
end

local on_attach = function(_, bufnr)
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    local opts = { noremap = true, silend = true }
    local bufopts = { table.unpack(opts), buffer = bufnr }

    lsp_keys(bufopts)

    local which_key = require "which-key"

    which_key.register({
        l = {
            name = "+lsp",
            g = { name = "+goto", p = { vim.lsp.buf.goto_prev, "prev" }, n = { vim.lsp.buf.goto_next, "next" } },
        },
    }, { noremap = true, silent = true, prefix = "<leader>" })

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
    }, { noremap = true, silent = true, buffer = bufnr, prefix = "<leader>" })
end

local lsp_flags = { debounce_text_changes = 150 }

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- RUST

lspconfig.rust_analyzer.setup({ on_attach = on_attach, flags = lsp_flags, capabilities = capabilities })

-- LUA

require("neodev").setup()

lspconfig.lua_ls.setup({
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
    settings = { Lua = { completion = { callSnippet = "Replace" } } },
})

-- LSP CONFIG

vim.fn.sign_define("DiagnosticSignError", { text = "E ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignHint", { text = "H ", texthl = "DiagnosticSignHint" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "I ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "W ", texthl = "DiagnosticSignWarn" })

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = false,
    float = {
        border = "single", -- single | rounded
        source = "always",
        header = "",
        prefix = "",
    },
})

vim.api.nvim_create_autocmd("CursorHold", { command = "lua vim.diagnostic.open_float(nil, { focusable = false })" })
