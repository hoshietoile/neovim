local is_ok, todo = pcall(require, "todo-comments")
if not is_ok then
	return
end

todo.setup({
	signs = true, -- show icons
	sign_priority = 8,
	-- TODO: apply icons
	keywords = {
		FIX = {
			icon = "F",
			color = "error",
			alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
		},
		TODO = { icon = "T", color = "info" },
		HACK = { icon = "H", color = "warning" },
		WARN = { icon = "W", color = "warning", alt = { "WARNING", "XXX" } },
		PERF = { icon = "P", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
		NOTE = { icon = "N", color = "hint", alt = { "INFO" } },
		TEST = { icon = "T", color = "info", alt = { "TESTING", "PASSED", "FAILED" } },
	},
	gui_style = {
		fg = "NONE",
		bg = "BOLD",
	},
	merge_keywords = true,
	colors = {
		error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
		warning = { "DiagnosticWarning", "WarningMsg", "#FBBF24" },
		info = { "DiagnosticInfo", "#2563EB" },
		hint = { "DiagnosticHint", "#10B981" },
		default = { "Identifier", "#7C3AED" },
		test = { "Identifier", "#FF00FF" },
	},
	search = {
		command = "rg",
		args = {
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
		},
		pattern = [[\b(KEYWORDS):]],
	},
})
