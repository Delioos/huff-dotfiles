return {
{
  "stevearc/conform.nvim",
  -- event = 'BufWritePre', -- uncomment for format on save
  opts = require "configs.conform",
},

{
  "neovim/nvim-lspconfig",
  config = function()
    require "configs.lspconfig"
  end,
},

{
  "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "rust-analyzer",
      },
    },
},

{
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "neovim/nvim-lspconfig",
  },
  opts = {
    ensure_installed = {
      "rust_analyzer",
    },
  },
},

{
  "nvim-tree/nvim-tree.lua", 
  opts = {
    view = {
      side = "right",
      width = 30,
    },
  },
},

{
  "Philogy/vim-huff",
  ft = "huff",
  lazy = false,
},

{
  dir = vim.fn.stdpath("config") .. "/lua/custom/plugins/huff-formatter",
  name = "huff-formatter",
  ft = "huff",
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  cmd = "AlignHuffStack",
  config = function()
    require("custom.plugins.huff-formatter").setup()
  end,
},

{
  dir = vim.fn.stdpath("config") .. "/lua/custom/plugins/cool-comments-block",
  name = "cool-comments-block",
  lazy = false,  -- Always active
  config = function()
    require("custom.plugins.cool-comments-block").setup()
  end,
},

{
  dir = vim.fn.stdpath("config") .. "/lua/custom/plugins/solidity-utils",
  name = "solidity-utils",
  ft = "solidity",
  lazy = false,
  config = function()
    require("custom.plugins.solidity-utils").setup()
  end,
},
} 