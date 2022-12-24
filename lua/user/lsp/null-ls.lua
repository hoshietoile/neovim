local is_ok, null_ls = pcall(require, "null-ls")
if not is_ok then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion

null_ls.setup({
  debug = false,
  sources = {
    formatting.stylua,
    formatting.prettier.with({ extra_args = {} }),
    formatting.black.with({ extra_args = { "--fast" } }),
    diagnostics.eslint,
    completion.spell,
  },
})
