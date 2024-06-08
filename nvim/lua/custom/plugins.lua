local plugins = {
  {
    "benlubas/molten-nvim",
    version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
    lazy = false,
    build = ":UpdateRemotePlugins",
    init = function()
      -- this is an example, not a default. Please see the readme for more configuration options
      vim.g.molten_image_provider = "image.nvim"
      vim.g.molten_output_win_max_height = 12
    end,
  },
  {
    -- see the image.nvim readme for more information about configuring this plugin
    "3rd/image.nvim",
    opts = {
      backend = "kitty", -- whatever backend you would like to use
      max_width = 100,
      max_height = 12,
      max_height_window_percentage = math.huge,
      max_width_window_percentage = math.huge,
      window_overlap_clear_enabled = true, -- toggles images when windows are overlapped
      window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
    },
  },
  {
    "dccsillag/magma-nvim",
    build = ":UpdateRemotePlugins",
    lazy = false,
  },
  { -- directly open ipynb files as quarto docuements
    -- and convert back behind the scenes
    'GCBallesteros/jupytext.nvim',
    lazy = false,
    config = function ()
      require("jupytext").setup({
        style = "markdown",
        output_extension = "md",
        force_ft = "markdown",
      })
    end,
  },
  {
    "quarto-dev/quarto-nvim",
    ft = { 'quarto', 'markdown' },
    dev = false,
    opts = {
      lspFeatures = {
        languages = {'r', 'python', 'julia', 'bash', 'lua', 'html', 'dot', 'javascript', 'typescript', 'ojs'},
        chunks = "all",
        diagnostics = {
          enabled = true,
          triggers = {"BufWritePost"},
        },
        completion = {
          enabled = true,
        },
      },
      codeRunner = {
        enabled = true,
        default_method = 'molten',
      },
    },
    dependencies = {
      "jmbuhr/otter.nvim",
      opts = {},
    },
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function ()
      require("gopher").setup(opts)
    end,
    build = function ()
      vim.cmd [[silent! GoInstallDeps]]
    end
  },
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
        "gopls",
        "elixir-ls"
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
        "css",
        "bash",
        "rust",
        "tsx",
        "svelte",
        "vue",
        "go",
        "elixir",
        "heex"
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
