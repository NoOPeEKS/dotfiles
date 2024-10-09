return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {
      view = {
        side = 'right',
      }
    }
    vim.keymap.set('n', '<C-n>', ":NvimTreeToggle<CR>", {})
    vim.keymap.set('n', '<leader>e', ":NvimTreeFocus<CR>", {})
  end,
}
