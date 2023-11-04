return {
  colorscheme = "astrotheme",
  -- disable relative line numbers
  relative_number = false,
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        enabled_plugins = { "copilot.vim" },
      },
    },
  },
}
