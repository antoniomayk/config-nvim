require("plugins")
require("default")

vim.api.nvim_create_autocmd("StdinReadPre", {
    callback = function()
        STD_IN = true
    end,
})

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        local directory = vim.fn.argv()[1]
        local is_directory = vim.fn.isdirectory(directory) == 1
        if (is_directory and not STD_IN) then
            vim.api.nvim_command("wincmd p")
            vim.api.nvim_command("enew")
            vim.api.nvim_command("execute 'cd " .. directory .. "'")
        end
    end,
})
