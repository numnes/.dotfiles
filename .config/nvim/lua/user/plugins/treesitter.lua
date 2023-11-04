return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = { "javascript", "typescript" },
  },
  setup = function(_, opts)
    opts.autotag = {
      enable = true,
    }
    return opts
  end,
}
