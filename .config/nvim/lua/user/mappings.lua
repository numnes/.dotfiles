-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
    -- first key is the mode
    n = {
        L = {
            function()
                require("astronvim.utils.buffer").nav(vim.v.count > 0 and
                                                          vim.v.count or 1)
            end,
            desc = "Next buffer"
        },
        H = {
            function()
                require("astronvim.utils.buffer").nav(
                    -(vim.v.count > 0 and vim.v.count or 1))
            end,
            desc = "Previous buffer"
        },
        ["<leader>bD"] = {
            function()
                require("astronvim.utils.status").heirline.buffer_picker(
                    function(bufnr)
                        require("astronvim.utils.buffer").close(bufnr)
                    end)
            end,
            desc = "Pick to close"
        },
        ["<leader>b"] = {name = "Buffers"},
        ["<C-s>"] = {":w!<cr>", desc = "Save File"}, -- change description but the same command
        ["<A-j>"] = {":move +1<cr>"},
        ["<A-k>"] = {":move -2<cr>"},
        ["<C-A-k>"] = {":copy +0<cr>"},
        ["<C-A-j>"] = {":copy -1<cr>"}
    },
    t = {},
    i = {["<C-s>"] = {"<esc>:w!<cr>", desc = "Save File"}}
}
