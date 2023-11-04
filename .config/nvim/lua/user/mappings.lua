return {
  n = {
    ["<C-s>"] = { "<esc>:w!<cr>", desc = "Save File" },
    ["<C-i>"] = {
      "<esc>:bprevious<cr>",
      desc = "Next Buffer",
    },
    ["<A-j>"] = { ":move +1<cr>" },
    ["<A-k>"] = { ":move -2<cr>" },
    ["<C-A-k>"] = { ":copy +0<cr>" },
    ["<C-A-j>"] = { ":copy -1<cr>" },
  },
  i = {
    ["<C-s>"] = { "<esc>:w!<cr>", desc = "Save File" },
  },
  v = {
    ["<C-s>"] = { ":w!<cr>", desc = "Save File" },
    ["<C-i>"] = {
      "<esc>:bprevious<cr>",
      desc = "Next Buffer",
    },
    ["<A-j>"] = { ":move +1<cr>" },
  },
}
