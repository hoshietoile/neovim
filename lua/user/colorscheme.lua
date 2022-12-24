-- local colorscheme = "darkplus"
-- local colorscheme = "tokyonight"
-- local colorscheme = "gruvbox"
local colorscheme = "ayu-mirage"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found")
  return
end
