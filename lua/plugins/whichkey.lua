local which_key = require("which-key")

which_key.setup()

which_key.register({
    b = {
        name = "+buffer",
        d = {
            name = "+delete",
            d = { ":bdelete<cr>", "delete current buffer" },
            D = { ":bdelete!<cr>", "force delete current buffer" },
        },
        w = {
            name = "+write",
            w = { ":w<cr>", "write" },
            W = { ":w!<cr>", "force write" },
            a = { ":wa<cr>", "write all" },
            A = { ":wa!<cr>", "force write all" },
        },
        s = {
            name = "+split",
            n = { ":sbnext<cr>", "split window with the next buffer" },
            p = { ":sbprevious<cr>", "split window with the previous buffer" },
        },
        f = { ":bfirst<cr>", "go to the first buffer" },
        l = { ":blast<cr>", "go to the last buffer" },
        n = { ":bnext<cr>", "go to the next buffer" },
        p = { ":bprevious<cr>", "go to the previous buffer" },
    },
    w = {
        name = "+window",
        q = {
            name = "+quit",
            a = { ":qa<cr>", "quit all windows" },
            A = { ":qa!<cr>", "force quit all windows" },
            q = { ":q<cr>", "quit current window" },
            Q = { ":q!<cr>", "force quit current window" },
        },
        n = {
            name = "+new",
            j = { ":new<cr>", "open new window horizontally" },
            l = { ":vnew<cr>", "open new window vertically" },
            i = { ":enew<cr>", "open new window on top of current window" },
        },
        m = {
            name = "+movements",
            r = { "<c-w>r", "rotate window" },
            l = { "wh <c-w>L", "move window to the right" },
            h = { "wh <c-w>H", "move window to the left" },
            j = { "wh <c-w>J", "move window to the top" },
            k = { "wh <c-w>K", "move window to the bottom" },
        },
        r = {
            name = "+resize",
            n = { "<c-W>=", "normalize" },
            s = { ":vert res -8<cr>", "shrink window size vertically" },
            S = { ":res -8<cr>", "shrink window size horizontally" },
            G = { ":res +8<cr>", "grow window size horizontally" },
            g = { ":vert res +8<cr>", "grow window size vertically" },
        },
        s = {
            name = "+split",
            j = { ":sp<cr>", "split window horizontally" },
            l = { ":vs<cr>", "split window vertically" },
        },
    },
    c = {
        name = "+cursor",
        l = { "wh <c-w>l", "move cursor to the right" },
        h = { "wh <c-w>h", "move cursor to the left" },
        j = { "wh <c-w>j", "move cursor to the top" },
        k = { "wh <c-w>k", "move cursor to the bottom" },
    },
    s = { name = "+search", c = { ":nohlsearch<cr>", "clear search" } },
}, { prefix = "<leader>" })
