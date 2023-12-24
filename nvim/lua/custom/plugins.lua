local plugins = {
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.null-ls"
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "typescript-language-server",
        "tailwindcss-language-server",
        "eslint-lsp",
        "prettierd",
        "pyright",
        "mypy",
        "ruff",
        "black",
        "rust-analyzer",
        "vue-language-server",
        "phpactor",
      }
    }
  },
  {
    "windwp/nvim-ts-autotag",
    config = function ()
     require("nvim-ts-autotag").setup()
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function ()
     opts = require "plugins.configs.treesitter"
     opts.ensure_installed = {
        "lua",
        "javascript",
        "typescript",
        "tsx",
        "python",
        "html",
        "php",
        "c",
        "cpp",
        "css",
        "bash",
        "rust",
        "tsx",
        "svelte",
        "vue",
     }
     return opts
    end
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },
}
return plugins
