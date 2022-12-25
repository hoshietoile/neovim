local is_ok, telescope = pcall(require, "telescope")
if not is_ok then
	return
end

local actions = require("telescope.actions")
-- local builtin = require("telescope.builtin")
local fb_actions = require("telescope").extensions.file_browser.actions

telescope.setup({
	defaults = {
		propmpt_prefix = " ",
		selection_caret = " ",
		path_display = { "smart" },
		file_ignore_patterns = {
			"^node_modules/",
			"^%.git",
			"^%.",
		},
		extensions = {
			file_browser = {
				theme = "dropdown",
				hijack_netrw = true,
			},
			mappings = {
				["i"] = {
					["<C-w>"] = function()
						vim.cmd("normal vdb")
					end,
				},
				["n"] = {
					["N"] = fb_actions.create,
					["h"] = fb_actions.goto_parent_dir,
					["/"] = function()
						vim.cmd("startinsert")
					end,
				},
			},
		},
		mappings = {
			n = {
				["q"] = actions.close,
				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,
				["gg"] = actions.move_to_top,
				["G"] = actions.move_to_bottom,
				["?"] = actions.which_key,
			},
			i = {
				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,
			},
		},
	},
})

telescope.load_extension("file_browser")

local function telescope_buffer_dir()
	return vim.fn.expand("%:p:h")
end

-- Telescope keybindings
local builtin = require("telescope.builtin")
vim.keymap.set("n", ";f", function()
	builtin.find_files({
		no_ignore = false,
		hidden = true,
	})
end)

vim.keymap.set("n", ";r", function()
	builtin.live_grep({
		no_ignore = false,
		hidden = true,
	})
end)

vim.keymap.set("n", "sf", function()
	telescope.extensions.file_browser.file_browser({
		path = "%:p:h",
		cwd = telescope_buffer_dir(),
		respect_gitignore = false,
		hidden = true,
		grouped = true,
		previewer = false,
		initial_mode = "normal",
		layout_config = { height = 40 },
	})
end)
