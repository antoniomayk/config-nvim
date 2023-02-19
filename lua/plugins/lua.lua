local lspconfig = require("lspconfig")

require("neodev").setup()

lspconfig.lua_ls.setup({
    on_attach = LSP_ON_ATTACH(),
    flags = LSP_FLAGS(),
    capabilities = LSP_CAPABILITIES(),
    settings = { Lua = { completion = { callSnippet = "Replace" } } },
})
