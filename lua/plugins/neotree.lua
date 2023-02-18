require("neo-tree").setup({
    close_if_last_window = false,
    popup_border_style = "single", -- single | rounded
    enable_git_status = true,
    enable_diagnostics = true,
    sort_case_insensitive = false,
    sort_function = nil,
    default_component_configs = {
        container = { enable_character_fade = true },
        indent = {
            indent_size = 2,
            padding = 1,
            with_markers = true,
            indent_marker = "│",
            last_indent_marker = "└", -- └ | ╰
            highlight = "NeoTreeIndentMarker",
            with_expanders = nil,
            expander_collapsed = "+",
            expander_expanded = "-",
            expander_highlight = "NeoTreeExpander",
        },
        icon = {
            folder_closed = "+",
            folder_open = "-",
            folder_empty = "~",
            default = "*",
            highlight = "NeoTreeFileIcon",
        },
        modified = { symbol = "[+]", highlight = "NeoTreeModified" },
        name = { trailing_slash = false, use_git_status_colors = true, highlight = "NeoTreeFileName" },
        git_status = {
            symbols = {
                added = "A",
                modified = "M",
                deleted = "D",
                renamed = "R",
                untracked = "?",
                ignored = "I",
                unstaged = "U",
                staged = "S",
                conflict = "C",
            },
        },
    },
    window = {
        position = "float",
        width = 32,
        mapping_options = { noremap = true, nowait = true },
        mappings = { ["o"] = "open", ["<space>"] = "" },
    },
    nesting_rules = {},
    filesystem = {
        follow_current_file = true,
        group_empty_dirs = true,
        hijack_netrw_behavior = "disabled",
        use_libuv_file_watcher = true,
        filtered_items = {
            visible = false,
            hide_dotfiles = true,
            hide_gitignored = true,
            hide_hidden = true,
            hide_by_name = {},
            hide_by_pattern = {},
            always_show = {},
            never_show = {},
            never_show_by_pattern = {},
        },
        window = {
            mappings = {
                ["<bs>"] = "navigate_up",
                ["."] = "set_root",
                ["H"] = "toggle_hidden",
                ["/"] = "fuzzy_finder",
                ["D"] = "fuzzy_finder_directory",
                ["f"] = "filter_on_submit",
                ["<c-x>"] = "clear_filter",
                ["[g"] = "prev_git_modified",
                ["]g"] = "next_git_modified",
            },
        },
    },
    buffers = {
        follow_current_file = true,
        group_empty_dirs = true,
        show_unloaded = true,
        window = { mappings = { ["bd"] = "buffer_delete", ["<bs>"] = "navigate_up", ["."] = "set_root" } },
    },
    git_status = {
        window = {
            position = "float",
            mappings = {
                ["A"] = "git_add_all",
                ["gu"] = "git_unstage_file",
                ["ga"] = "git_add_file",
                ["gr"] = "git_revert_file",
                ["gc"] = "git_commit",
                ["gp"] = "git_push",
                ["gg"] = "git_commit_and_push",
            },
        },
    },
})

require("which-key").register({
    e = {
        name = "+explorer",
        r = { ":NeoTreeReveal<cr>", "reveal" },
        o = { ":NeoTreeFocus<cr>", "focus" },
        c = { ":NeoTreeClose<cr>", "close" },
    },
}, { prefix = "<leader>" })
