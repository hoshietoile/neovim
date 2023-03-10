local o = vim.opt

local options = {
  backup = false,
  clipboard = "unnamedplus",
  cmdheight = 2,
  completeopt = { "menuone", "noselect" },
  conceallevel = 0,
  fileencoding = "utf-8",
  hlsearch = true,
  ignorecase = true,
  mouse = "a",
  pumheight = 10,
  showmode = false,
  showtabline = 2,
  smartcase = true,
  smartindent = true,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  timeoutlen = 1000,
  undofile = true,
  updatetime = 300,
  writebackup = false,
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  cursorline = true,
  cursorcolumn = true,
  number = true,
  relativenumber = false,
  numberwidth = 4,
  signcolumn = "yes",
  wrap = true,
  scrolloff = 8,
  sidescrolloff = 8,
  guifont = "monospace:h17",
}

o.shortmess:append "c"

for k, v in pairs(options) do
  o[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]]
vim.cmd [[set signcolumn=yes]]
vim.cmd [[set clipboard+=unnamedplus]]

-- NERDTree
vim.cmd [[autocmd TabNew * call timer_start(0, { -> execute('NerdTree') })]]
vim.cmd [[autocmd VimEnter * execute 'NERDTree']]
