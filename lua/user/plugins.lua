local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim ..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  print "Packer isn't installed"
  return
end

packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install plugins
return packer.startup(function(use)
  use "wbthomason/packer.nvim" -- have packer manage itself
  use "nvim-lua/popup.nvim"    -- implementation of popup api from vim in neovim
  use "nvim-lua/plenary.nvim"  -- common utilities

  -- use "9mm/vim-closer"
  use {
    "tpope/vim-dispatch",
    opt = true,
    cmd = {
      "Dispatch",
      "Make",
      "Focus",
      "Start",
    },
  }
  use {
    "iamcco/markdown-preview.nvim",
    run = "cd app && yarn install",
    cmd = "MarkdownPreview",
  }

  -- ColorScheme
  use "lunarvim/colorschemes"
  use "folke/tokyonight.nvim"
  use "ellisonleao/gruvbox.nvim"
  use "Shatur/neovim-ayu"

  -- Completions
  use "hrsh7th/nvim-cmp"    -- Completion
  use "hrsh7th/cmp-buffer"  -- buffer completions 
  use "hrsh7th/cmp-path"    -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" --- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"

  -- Snippets
  use "L3MON4D3/LuaSnip"    -- snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig" -- enable lsp
  use "williamboman/mason.nvim" -- lsp installer
  use "williamboman/mason-lspconfig.nvim" -- lsp installer
  use "jose-elias-alvarez/null-ls.nvim" -- lsp dianostics and code actions
  use "glepnir/lspsaga.nvim"

  -- Utilities
  use "windwp/nvim-autopairs"
  use "tpope/vim-endwise"
  use "tpope/vim-commentary"
  use "tpope/vim-surround"
  use "folke/todo-comments.nvim"
  use "junegunn/vim-easy-align"
  use "simeji/winresizer"

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }

  -- Terminal
  use "akinsho/toggleterm.nvim"

  -- Which key
  use "folke/which-key.nvim"

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-file-browser.nvim"
  use "BurntSushi/ripgrep"

  -- Tree
  -- TODO: Replace with other tree browser tool
  use "scrooloose/nerdtree"
  use "ryanoasis/vim-devicons"

  -- Lualine
  use "hoob3rt/lualine.nvim"

  -- Automatically setup the configuration after cloning packer.nvim
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
