-----------------------------------------------------------
--- FILES
-----------------------------------------------------------
vim.o["encoding"] = "utf-8"

-----------------------------------------------------------
--- EDITOR
-----------------------------------------------------------

vim.o["clipboard"] = "unnamedplus"
vim.o["timeoutlen"] = 250
vim.o["updatetime"] = 50
vim.o["colorcolumn"] = "60,80,100,120,140,160,180"
vim.o["number"] = true
vim.o["relativenumber"] = true
vim.o["cursorline"] = true
vim.o["wrap"] = false
vim.o["scrolloff"] = 2
vim.o["sidescroll"] = 2
vim.o["list"] = true
vim.o["background"] = "dark"
vim.o["termguicolors"] = true
vim.o["autoread"] = true
vim.o["signcolumn"] = "yes"

-----------------------------------------------------------
--- BUFFERS
-----------------------------------------------------------

vim.o["hidden"] = true

-----------------------------------------------------------
--- LEADER KEY
-----------------------------------------------------------

vim.g["mapleader"] = " "

-----------------------------------------------------------
--- SEARCH
-----------------------------------------------------------

vim.o["hlsearch"] = true
vim.o["ignorecase"] = true
vim.o["incsearch"] = true
vim.o["smartcase"] = true

-----------------------------------------------------------
--- WINDOWS
-----------------------------------------------------------

vim.o["splitbelow"] = true
vim.o["splitright"] = true

-----------------------------------------------------------
--- INDENTATION
-----------------------------------------------------------

vim.o["autoindent"] = true
vim.o["smartindent"] = true

-----------------------------------------------------------
--- WHITESPACES
-----------------------------------------------------------

vim.o["shiftwidth"] = 4
vim.o["softtabstop"] = 4
vim.o["expandtab"] = true
vim.o["smarttab"] = true
vim.o["tabstop"] = 4

-----------------------------------------------------------
--- TUI
-----------------------------------------------------------

vim.o["shell"] = "fish"

-----------------------------------------------------------
--- TUI
-----------------------------------------------------------

vim.env["NVIM_TUI_ENABLE_TRUE_COLOR"] = 1

-----------------------------------------------------------
--- LSP
-----------------------------------------------------------

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
    float = { border = "single", source = "always", header = "", prefix = "" },
})

vim.api.nvim_create_autocmd("CursorHold", { command = "lua vim.diagnostic.open_float(nil, { focusable = false })" })
