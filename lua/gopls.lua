-- Require LSP configuration from plugin so we can attack gopls to it 
lspconfig = require "lspconfig"
util = require "lspconfig/util"


lspconfig.gopls.setup({
  cmd = {"gopls"},
  filetypes = {"go", "gomod", "gowork", "gotmpl"},
  root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
})
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
})


