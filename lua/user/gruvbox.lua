local is_ok, gruvbox = pcall(require, "gruvbox")
if not is_ok then
  return
end

gruvbox.setup({
  undercurl = true,
  underline = true,
  bold = true,
  italic = false,
  strikethrough = true,
  invert_section = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true,
  contrast = "", -- "hard" || "soft" || ""
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = false,
})
