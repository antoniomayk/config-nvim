require("indent_blankline").setup({
    space_char_blankline = " ",
    show_current_context_start = false,
    show_current_context_start_on_current_line = true,
    show_current_context = true,
    use_treesitter = true,
})

vim.opt.listchars:append "tab:⇥⇥" -- → | ⇥
vim.opt.listchars:append "space: " --  | ·
vim.opt.listchars:append "nbsp:·"
vim.opt.listchars:append "trail:·"
vim.opt.listchars:append "extends:›"
vim.opt.listchars:append "precedes:‹"
vim.opt.listchars:append "eol: " --  | ↲
