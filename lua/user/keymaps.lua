local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal       = "n"
--   insert       = "i"
--   visual       = "v"
--   visual_block = "x"
--   term         = "t"
--   command      = "c"

-- Split window
keymap("n", "ss", ":split<Return><C-w>w", term_opts)
keymap("n", "sv", ":vsplit<Return><C-w>w", term_opts)

-- Open browser
keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- Window navigations
-- NOTE: Deleted because which-key warns.
-- `Your <leader> key for "n" mode in buf 0 is currently mapped to "<C-W>w".
-- WhichKey automatically cretes triggers, so please remove the mapping.`
-- keymap("", "<Space>", "<C-w>w", opts)
keymap("", "sh", "<C-w>h", opts)
keymap("", "sk", "<C-w>k", opts)
keymap("", "sj", "<C-w>j", opts)
keymap("", "sl", "<C-w>l", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Insert
-- Press <ctrl+c> to get back to normal mode
keymap("i", "<C-c>", "<ESC>", opts)

-- Visual
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
-- Pasting while visual mode
keymap("v", "p", '"_dP', opts)

-- Virual Block
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Plugins
keymap("x", "ga", "<Plug>(EasyAlign)", opts)
keymap("n", "ga", "<Plug>(EasyAlign)", opts)

-- Which Key
keymap("n", "?", "<cmd>WhichKey<CR>", opts)
