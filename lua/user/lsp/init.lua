local is_ok, _ = pcall(require, "lspconfig")
if not is_ok then
  return
end

require("user.lsp.mason")
require("user.lsp.handlers").setup()
require("user.lsp.null-ls")
