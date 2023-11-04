-- customize mason plugins
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = {
      ensure_installed = { "tsserver", "lua_ls" },
    },
    on_attach = function(client, bufnr)
      -- custom on_attach for this plugin
      -- Find the clients capabilities
      local cap = client.resolved_capabilities

      -- Only highlight if compatible with the language
      if cap.document_highlight then
        vim.cmd "augroup LspHighlight"
        vim.cmd "autocmd!"
        vim.cmd "autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()"
        vim.cmd "autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()"
        vim.cmd "augroup END"
      end
    end,
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = {
      ensure_installed = { "prettier", "stylua" },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = {
      ensure_installed = { "python" },
    },
  },
}
