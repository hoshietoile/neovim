local is_ok, ayu = pcall(require, "ayu")
if not is_ok then
  return
end

ayu.setup({
  mirage = false,
  overrides = {},
})
