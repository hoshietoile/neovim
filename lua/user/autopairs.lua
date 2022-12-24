local is_ok, autopairs = pcall(require, "nvim-autopairs")
if not is_ok then
	return
end

autopairs.setup({
	-- disable_filetype = { "vim" }
})
