local is_ok, configs = pcall(require, "nvim-treesitter.configs")
if not is_ok then
  return
end

configs.setup {
  ensure_installed = "all",
  sync_install = false,
  ignore_install = { "" },
  highlight = {
    enable = true,
    disable = { "" },
    additional_vim_regex_highlighting = true,
  },
  indent = {
    enable = true,
    disable = {
      "yaml",
    },
  },
}
