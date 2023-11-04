return {
  "preservim/nerdcommenter",
  lazy = false,
  config = function()
    vim.g.NERDCreateDefaultMappings = 1
    vim.g.NERDSpaceDelims = 1
    vim.g.NERDCompactSexyComs = 1
    vim.api.nvim_set_keymap(
      "n",
      "<leader>/",
      "<Plug>NERDCommenterToggle('n', 'toggle')<cr>",
      { noremap = false, silent = true }
    )
    vim.api.nvim_set_keymap(
      "v",
      "<leader>/",
      "<Plug>NERDCommenterToggle('n', 'toggle')<CR>",
      { noremap = false, silent = true }
    )
  end,
}
